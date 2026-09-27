import 'dart:async';
import 'dart:math' as math;

import 'package:been_here/app/providers.dart';
import 'package:been_here/core/geo/geo_point.dart';
import 'package:been_here/core/geo/haversine.dart';
import 'package:been_here/core/geo/map_scale.dart';
import 'package:been_here/domain/memories/map_photo.dart';
import 'package:been_here/domain/settings/app_settings.dart';
import 'package:been_here/features/common/osm_tiles.dart';
import 'package:been_here/features/here/photo_detail_screen.dart';
import 'package:been_here/features/here/widgets/radius_slider.dart';
import 'package:been_here/l10n/generated/app_localizations.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

/// A pink that no map tile is: parks are green, roads beige, water blue,
/// and the app's own amber is somewhere between a motorway and a building.
const Color _photoDot = Color(0xFFE5006D);

/// Where you are, how far the app is looking, and where the photos were
/// taken — the shape of the visit list, as a picture.
///
/// Drawn only when the user has turned maps on. When they have not, the
/// card becomes a single button that hands the coordinate to the phone's
/// own maps app: one deliberate jump instead of a stream of tile requests.
class HereMapCard extends ConsumerWidget {
  const HereMapCard({
    required this.center,
    required this.radiusMeters,
    super.key,
  });

  final GeoPoint center;
  final double radiusMeters;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsProvider).value ?? const AppSettings();
    final points = ref.watch(memoryPointsProvider).value ?? const <MapPhoto>[];
    final atPlace = ref.watch(viewedPlaceProvider) != null;

    if (!settings.mapEnabled) {
      return _OpenInMapsRow(center: center);
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: SizedBox(
          height: 170,
          child: Stack(
            children: [
              Positioned.fill(
                child: HereMap(
                  center: center,
                  radiusMeters: radiusMeters,
                  points: points,
                  centreIsPlace: atPlace,
                  // A map that pans inside a scrolling list fights the list
                  // for every drag. Tap it to get one that doesn't.
                  interactive: false,
                ),
              ),
              Positioned.fill(
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => unawaited(
                      HereMapScreen.open(
                        context,
                        center: center,
                        radiusMeters: radiusMeters,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// The map itself, without the card around it.
class HereMap extends StatefulWidget {
  const HereMap({
    required this.center,
    required this.radiusMeters,
    required this.points,
    super.key,
    this.interactive = true,
    this.centreIsPlace = false,
    this.onCentreMoved,
    this.onRadiusChanged,
    this.onPhotoTapped,
  });

  final GeoPoint center;
  final double radiusMeters;
  final List<MapPhoto> points;
  final bool interactive;

  /// Whether the middle of the circle is a place being looked at rather than
  /// where the phone is. A "you are here" crosshair on a place two thousand
  /// kilometres away is a small lie.
  final bool centreIsPlace;

  /// Called when a photo's dot is tapped.
  final ValueChanged<MapPhoto>? onPhotoTapped;

  /// Called when the user has zoomed the map — by pinch, or by the
  /// double-tap-and-drag that phones have meant "zoom" for a decade.
  ///
  /// The circle and the view are two halves of one number, so zooming is
  /// another way of setting the radius and the caller treats it as one.
  final ValueChanged<double>? onRadiusChanged;

  /// Called when the user has dragged the map somewhere and let go.
  ///
  /// Dragging a map is a way of asking "and what about over there?", so the
  /// screen follows: the circle, the dots and the timeline behind it all
  /// move to the middle of wherever the map ended up.
  final ValueChanged<GeoPoint>? onCentreMoved;

  @override
  State<HereMap> createState() => _HereMapState();
}

class _HereMapState extends State<HereMap> {
  /// How long after the last pan to take the new middle seriously.
  ///
  /// Long enough that a flick and its settle count as one move, short enough
  /// that letting go feels like it did something.
  static const _settle = Duration(milliseconds: 350);

  final _controller = MapController();
  bool _ready = false;

  Timer? _pending;
  Timer? _pendingZoom;

  /// The last centre this map asked the screen to move to.
  ///
  /// When the request comes back as a new centre the camera is already
  /// there, and moving it again would fight the finger that put it there.
  GeoPoint? _published;

  @override
  void dispose() {
    _pending?.cancel();
    _pendingZoom?.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _centreMoved(MapCamera camera) {
    final moved = widget.onCentreMoved;
    if (moved == null) return;

    _pending?.cancel();
    _pending = Timer(_settle, () {
      final centre = GeoPoint(
        camera.center.latitude,
        camera.center.longitude,
      );
      _published = centre;
      moved(centre);
    });
  }

  /// The shorter side of the map in logical pixels, known once it has been
  /// laid out.
  double _viewport = 400;

  /// The radius this map last asked the screen for, so its own echo can be
  /// told from someone else moving the slider.
  double? _publishedRadius;

  // Double tap, hold, drag: up widens the view, down tightens it. The
  // platform gesture does the same thing with the opposite sign, so it is
  // switched off in the interaction flags and done here instead — a control
  // that moves the wrong way is worse than no control.
  static const double _pixelsPerDoubling = 200;
  static const Duration _doubleTapWindow = Duration(milliseconds: 300);

  Duration? _lastTapUp;
  Offset? _lastTapPosition;

  /// Set while a double-tap-drag is in progress. The map's own gestures are
  /// disabled for the duration, or it would pan under the same finger.
  bool _sizing = false;
  double _sizingFromY = 0;
  double _sizingFromRadius = 0;

  /// The zoom at which the circle fills the view.
  double get _zoom => zoomForRadius(
    radiusMeters: widget.radiusMeters,
    latitude: widget.center.lat,
    viewportPixels: _viewport,
  );

  /// The same relation read backwards: the view the user just zoomed to is
  /// a radius, and setting it is what makes pinching turn the dial.
  void _zoomed(MapCamera camera) {
    final changed = widget.onRadiusChanged;
    if (changed == null) return;

    // A pan is not a zoom. Panning north changes the metres a pixel covers,
    // so reading the radius back off the camera after every gesture would
    // otherwise nudge the range by centimetres for no reason at all.
    if ((camera.zoom - _zoom).abs() < 0.01) return;

    _pendingZoom?.cancel();
    _pendingZoom = Timer(_settle, () {
      final radius = radiusForZoom(
        zoom: camera.zoom,
        latitude: camera.center.latitude,
        viewportPixels: _viewport,
      );
      _publishedRadius = radius;
      changed(radius);
    });
  }

  LatLng get _center => LatLng(widget.center.lat, widget.center.lng);

  /// Follows the screen.
  ///
  /// `initialCenter` is exactly that — initial. The widget survives the
  /// screen being pointed somewhere else, so without this the map keeps the
  /// camera it was born with: open a place two thousand kilometres away and
  /// the photos change while the map still shows the street you are on.
  @override
  void didUpdateWidget(HereMap old) {
    super.didUpdateWidget(old);
    final movedCentre = old.center != widget.center;
    final movedRadius = old.radiusMeters != widget.radiusMeters;
    if (!movedCentre && !movedRadius) return;

    // Our own gestures coming back around. The camera is already there, and
    // moving it again would shove it out from under the finger.
    if (!movedRadius && widget.center == _published) return;
    if (!movedCentre && widget.radiusMeters == _publishedRadius) return;

    if (_ready) _controller.move(_center, _zoom);
  }

  bool get _canResize => widget.interactive && widget.onRadiusChanged != null;

  /// The photo nearest the tap, if the tap was close enough to a dot.
  ///
  /// Hit-tested here rather than by making every dot a widget: the tolerance
  /// is a thumb's width in pixels, converted to metres at the current zoom,
  /// so it stays a thumb's width however far out the map is.
  void _tapped(LatLng where) {
    final tapped = widget.onPhotoTapped;
    if (tapped == null || widget.points.isEmpty) return;

    final tolerance =
        metresPerPixel(
          latitude: where.latitude,
          zoom: _controller.camera.zoom,
        ) *
        22;

    final at = GeoPoint(where.latitude, where.longitude);
    MapPhoto? best;
    var bestDistance = double.infinity;
    for (final photo in widget.points) {
      final metres = distanceMeters(at, photo.point);
      if (metres < bestDistance) {
        bestDistance = metres;
        best = photo;
      }
    }

    if (best != null && bestDistance <= tolerance) tapped(best);
  }

  void _pointerDown(PointerDownEvent event) {
    if (!_canResize) return;

    final lastUp = _lastTapUp;
    final lastAt = _lastTapPosition;
    final soonEnough =
        lastUp != null && event.timeStamp - lastUp < _doubleTapWindow;
    final closeEnough =
        lastAt != null && (event.localPosition - lastAt).distance < 44;

    if (soonEnough && closeEnough) {
      setState(() {
        _sizing = true;
        _sizingFromY = event.localPosition.dy;
        _sizingFromRadius = widget.radiusMeters;
      });
    }
    _lastTapPosition = event.localPosition;
  }

  void _pointerMove(PointerMoveEvent event) {
    if (!_sizing) return;

    // Up is negative on screen and means "show me more ground".
    final travelled = event.localPosition.dy - _sizingFromY;
    final radius =
        _sizingFromRadius *
        math.pow(2, travelled / -_pixelsPerDoubling).toDouble();

    // No guard: this gesture is the radius moving, so the camera *should*
    // follow it back. That is the whole point — the circle stays the same
    // size on screen and the ground under it changes.
    widget.onRadiusChanged?.call(radius);
  }

  void _pointerUp(PointerUpEvent event) {
    _lastTapUp = event.timeStamp;
    if (_sizing) setState(() => _sizing = false);
  }

  @override
  Widget build(BuildContext context) {
    // The zoom depends on how large the map is on screen, which is only
    // known once it has been laid out.
    return LayoutBuilder(
      builder: (context, constraints) {
        _viewport = constraints.biggest.shortestSide;
        return Listener(
          onPointerDown: _pointerDown,
          onPointerMove: _pointerMove,
          onPointerUp: _pointerUp,
          onPointerCancel: (_) {
            if (_sizing) setState(() => _sizing = false);
          },
          child: _map(Theme.of(context), _center),
        );
      },
    );
  }

  Widget _map(ThemeData theme, LatLng here) {
    return FlutterMap(
      mapController: _controller,
      options: MapOptions(
        initialCenter: here,
        initialZoom: _zoom,
        // Moving the camera before the map has been laid out throws, so the
        // first move waits for this.
        onMapReady: () => _ready = true,
        onTap: (_, latLng) => _tapped(latLng),
        onPositionChanged: (camera, hasGesture) {
          if (!hasGesture) return;
          _centreMoved(camera);
          _zoomed(camera);
        },
        interactionOptions: InteractionOptions(
          flags: switch ((interactive: widget.interactive, sizing: _sizing)) {
            // While the radius is being dragged the map holds still.
            (interactive: _, sizing: true) => InteractiveFlag.none,
            (interactive: false, sizing: _) => InteractiveFlag.none,
            // Everything except the platform's own double-tap-drag, which
            // zooms the opposite way round from the one above.
            (interactive: true, sizing: false) =>
              InteractiveFlag.all & ~InteractiveFlag.doubleTapDragZoom,
          },
        ),
      ),
      children: [
        osmTileLayer(),
        CircleLayer(
          circles: [
            CircleMarker(
              point: here,
              radius: widget.radiusMeters,
              useRadiusInMeter: true,
              color: theme.colorScheme.primary.withValues(alpha: 0.10),
              borderColor: theme.colorScheme.primary.withValues(alpha: 0.55),
              borderStrokeWidth: 1.5,
            ),
            // One dot per photo. Circles rather than markers: a marker is a
            // widget, and a thousand widgets is a different kind of app.
            //
            // The colour is fixed rather than taken from the theme. The map
            // underneath is a picture of the world — greens for parks,
            // beiges and greys for streets, blue for water — and the app's
            // own amber sits right in the middle of that range. This does
            // not, on purpose.
            for (final photo in widget.points)
              CircleMarker(
                point: LatLng(photo.point.lat, photo.point.lng),
                radius: 4.5,
                color: _photoDot,
                borderColor: Colors.white,
                borderStrokeWidth: 1.2,
              ),
          ],
        ),
        MarkerLayer(
          markers: [
            Marker(
              point: here,
              width: 28,
              height: 28,
              child: Icon(
                widget.centreIsPlace ? Icons.place : Icons.my_location,
                size: 20,
                color: theme.colorScheme.primary,
                shadows: const [Shadow(blurRadius: 3, color: Colors.black45)],
              ),
            ),
          ],
        ),
        const OsmAttribution(),
      ],
    );
  }
}

/// The same map, full screen and draggable.
class HereMapScreen extends ConsumerWidget {
  const HereMapScreen({
    required this.center,
    required this.radiusMeters,
    super.key,
  });

  final GeoPoint center;
  final double radiusMeters;

  static Future<void> open(
    BuildContext context, {
    required GeoPoint center,
    required double radiusMeters,
  }) => Navigator.of(context).push(
    MaterialPageRoute<void>(
      builder: (_) => HereMapScreen(center: center, radiusMeters: radiusMeters),
    ),
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final points = ref.watch(memoryPointsProvider).value ?? const <MapPhoto>[];
    final radius = ref.watch(searchRadiusProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.hereMapTitle),
        actions: [
          IconButton(
            tooltip: l10n.hereOpenInMaps,
            icon: const Icon(Icons.open_in_new),
            onPressed: () => unawaited(openInSystemMaps(center)),
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: HereMap(
              center: ref.watch(currentLocationProvider).value ?? center,
              radiusMeters: radius,
              points: points,
              centreIsPlace: ref.watch(viewedPlaceProvider) != null,
              onCentreMoved: ref.read(viewpointProvider.notifier).toMapCentre,
              // Pinching or double-tap-dragging the map is the same request
              // as dragging the slider below it.
              onRadiusChanged: (metres) =>
                  ref.read(searchRadiusProvider.notifier).meters = metres,
              onPhotoTapped: (photo) => _openPhoto(context, ref, photo),
            ),
          ),
          // The circle you are looking at, with the handle that sizes it
          // and the count of what is inside. Without it, dragging the map
          // looks like nothing happened until you go back to the timeline.
          const Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: _MapControls(),
          ),
        ],
      ),
    );
  }
}

/// Opens the tapped dot's photo, inside the visit it belongs to.
///
/// A dot is a photo, and the natural thing to do with a photo is look at it
/// — but a photo on its own is thinner than what the rest of the app shows,
/// so this opens the visit around it and lands on the one that was tapped.
/// Swiping from there walks the same afternoon.
void _openPhoto(BuildContext context, WidgetRef ref, MapPhoto photo) {
  final here = ref.read(memoriesHereProvider).value;
  if (here == null) return;

  final visit = here.visits.firstWhereOrNull(
    (v) =>
        !photo.takenAt.isBefore(v.startedAt) &&
        !photo.takenAt.isAfter(v.endedAt),
  );
  if (visit == null) return;

  unawaited(
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => PhotoDetailScreen(
          visit: visit,
          center: here.center,
          radiusMeters: here.radiusMeters,
          initialAssetId: photo.assetId,
        ),
      ),
    ),
  );
}

/// The radius, and what is inside it, over the bottom of the map.
///
/// The same slider as the timeline's, because it is the same number: the
/// circle drawn here is what that slider sets.
class _MapControls extends ConsumerWidget {
  const _MapControls();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final here = ref.watch(memoriesHereProvider).value;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface.withValues(alpha: 0.92),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: RadiusSlider(photoCount: here?.photoCount),
        ),
      ),
    );
  }
}

/// What the card becomes when maps are off.
class _OpenInMapsRow extends StatelessWidget {
  const _OpenInMapsRow({required this.center});

  final GeoPoint center;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 4, 12, 0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: TextButton.icon(
          onPressed: () => unawaited(openInSystemMaps(center)),
          icon: const Icon(Icons.map_outlined, size: 18),
          label: Text(l10n.hereOpenInMaps),
        ),
      ),
    );
  }
}

/// Hands one coordinate to the phone's own maps app.
///
/// Deliberately not the same thing as the map inside the app: this is a
/// single jump the user asked for, with one coordinate, to an app they
/// already trust with their location — not a stream of tile requests that
/// follows them around as they pan.
Future<void> openInSystemMaps(GeoPoint point) async {
  final coordinates = '${point.lat},${point.lng}';
  for (final url in [
    // Apple Maps on iOS, Google Maps in a browser elsewhere.
    Uri.parse('https://maps.apple.com/?ll=$coordinates&q=$coordinates'),
    Uri.parse('geo:$coordinates?q=$coordinates'),
  ]) {
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
      return;
    }
  }
}
