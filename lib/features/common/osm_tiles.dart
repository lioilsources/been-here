import 'package:been_here/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

/// The tile source, in one place.
///
/// Every map in the app draws from the same server with the same user agent,
/// and both of those are promises made to whoever runs it. One definition,
/// so they cannot drift apart.
///
/// `tile.openstreetmap.org` is fine for a personal build and ruled out for a
/// released one by the OSM tile usage policy — see docs/ARCHITECTURE.md.
TileLayer osmTileLayer() => TileLayer(
  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
  userAgentPackageName: 'com.lioilsources.beenhere',
  maxZoom: 19,
);

/// The credit the tile policy requires, legible over whatever is behind it.
class OsmAttribution extends StatelessWidget {
  const OsmAttribution({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: theme.colorScheme.surface.withValues(alpha: 0.8),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            child: Text(
              AppLocalizations.of(context).placesMapAttribution,
              style: theme.textTheme.labelSmall,
            ),
          ),
        ),
      ),
    );
  }
}
