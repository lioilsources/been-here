import 'dart:async';

import 'package:been_here/app/providers.dart';
import 'package:been_here/core/geo/geo_point.dart';
import 'package:been_here/domain/settings/app_settings.dart';
import 'package:been_here/features/common/osm_tiles.dart';
import 'package:been_here/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

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
    final points = ref.watch(memoryPointsProvider).value ?? const <GeoPoint>[];
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
  });

  final GeoPoint center;
  final double radiusMeters;
  final List<GeoPoint> points;
  final bool interactive;

  /// Whether the middle of the circle is a place being looked at rather than
  /// where the phone is. A "you are here" crosshair on a place two thousand
  /// kilometres away is a small lie.
  final bool centreIsPlace;

  @override
  State<HereMap> createState() => _HereMapState();
}

class _HereMapState extends State<HereMap> {
  final _controller = MapController();
  bool _ready = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// A zoom that fits the search circle, near enough.
  ///
  /// The tile grid doubles its scale every level, and one tile is roughly
  /// 40 075 km wide at the equator divided by 2^zoom — so this is that,
  /// solved for the diameter on screen.
  double get _zoom {
    final span = widget.radiusMeters * 2.4;
    for (var zoom = 18.0; zoom > 2; zoom--) {
      if (40075016 / (1 << zoom.toInt()) > span) return zoom;
    }
    return 2;
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
    if (old.center == widget.center &&
        old.radiusMeters == widget.radiusMeters) {
      return;
    }
    if (_ready) _controller.move(_center, _zoom);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final here = _center;

    return FlutterMap(
      mapController: _controller,
      options: MapOptions(
        initialCenter: here,
        initialZoom: _zoom,
        // Moving the camera before the map has been laid out throws, so the
        // first move waits for this.
        onMapReady: () => _ready = true,
        interactionOptions: InteractionOptions(
          flags: widget.interactive
              ? InteractiveFlag.all
              : InteractiveFlag.none,
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
            for (final point in widget.points)
              CircleMarker(
                point: LatLng(point.lat, point.lng),
                radius: 3.5,
                color: theme.colorScheme.tertiary.withValues(alpha: 0.85),
                borderColor: Colors.white70,
                borderStrokeWidth: 0.5,
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
    final points = ref.watch(memoryPointsProvider).value ?? const <GeoPoint>[];

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
      body: HereMap(
        center: center,
        radiusMeters: radiusMeters,
        points: points,
        centreIsPlace: ref.watch(viewedPlaceProvider) != null,
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
