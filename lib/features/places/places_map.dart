import 'dart:async';

import 'package:been_here/app/providers.dart';
import 'package:been_here/data/db/database.dart';
import 'package:been_here/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

/// Places as pins.
///
/// Only ever built when the user has turned maps on: every tile is a request
/// to a server, and the sequence of them is a record of where they are
/// looking. See `AppSettings.mapEnabled`.
class PlacesMap extends ConsumerStatefulWidget {
  const PlacesMap({required this.places, super.key});

  final List<PlaceRow> places;

  @override
  ConsumerState<PlacesMap> createState() => _PlacesMapState();
}

class _PlacesMapState extends ConsumerState<PlacesMap> {
  final _controller = MapController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// A view that holds every place, or the first one if there is only one.
  LatLngBounds? get _bounds {
    if (widget.places.length < 2) return null;
    return LatLngBounds.fromPoints([
      for (final place in widget.places)
        LatLng(place.centerLat, place.centerLng),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final bounds = _bounds;
    final first = widget.places.first;

    return FlutterMap(
      mapController: _controller,
      options: MapOptions(
        initialCenter: LatLng(first.centerLat, first.centerLng),
        initialZoom: 11,
        initialCameraFit: bounds == null
            ? null
            : CameraFit.bounds(
                bounds: bounds,
                padding: const EdgeInsets.all(48),
              ),
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          // Required by the OSM tile usage policy, which also rules this
          // endpoint out for a released app — see docs/ARCHITECTURE.md.
          userAgentPackageName: 'com.lioilsources.beenhere',
          maxZoom: 19,
        ),
        MarkerLayer(
          markers: [
            for (final place in widget.places)
              Marker(
                point: LatLng(place.centerLat, place.centerLng),
                width: 40,
                height: 40,
                child: _Pin(place: place),
              ),
          ],
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: theme.colorScheme.surface.withValues(alpha: 0.8),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 6,
                  vertical: 2,
                ),
                child: Text(
                  l10n.placesMapAttribution,
                  style: theme.textTheme.labelSmall,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _Pin extends ConsumerWidget {
  const _Pin({required this.place});

  final PlaceRow place;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final muted = place.mute.isMuted;

    return Tooltip(
      message: place.userLabel ?? place.label ?? '',
      child: GestureDetector(
        onTap: () => unawaited(openPlace(ref, place.id)),
        child: Icon(
          muted ? Icons.location_off : Icons.location_on,
          size: 32,
          color: muted ? theme.colorScheme.outline : theme.colorScheme.primary,
          shadows: const [Shadow(blurRadius: 3, color: Colors.black45)],
        ),
      ),
    );
  }
}
