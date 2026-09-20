import 'dart:async';

import 'package:been_here/app/providers.dart';
import 'package:been_here/core/geo/geo_point.dart';
import 'package:been_here/core/geo/haversine.dart';
import 'package:been_here/data/db/database.dart';
import 'package:been_here/domain/memories/relative_age.dart';
import 'package:been_here/domain/places/mute_state.dart';
import 'package:been_here/features/common/empty_state.dart';
import 'package:been_here/features/common/format.dart';
import 'package:been_here/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Everywhere you've been, and which of those you'd rather not hear about.
class PlacesScreen extends ConsumerWidget {
  const PlacesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final places = ref.watch(placesProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.placesTabLabel),
        actions: const [_SortMenu()],
      ),
      body: places.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, _) => Center(
          child: EmptyState(
            icon: Icons.error_outline,
            title: l10n.indexFailedTitle,
            body: l10n.indexFailedBody,
          ),
        ),
        data: (all) {
          if (all.isEmpty) {
            return Center(
              child: EmptyState(
                icon: Icons.place_outlined,
                title: l10n.placesEmptyTitle,
                body: l10n.placesEmptyBody,
              ),
            );
          }

          final visible = all.where((p) => !p.mute.isMuted).toList();
          final muted = all.where((p) => p.mute.isMuted).toList();

          return ListView(
            children: [
              for (final place in visible) _PlaceTile(place: place),
              if (muted.isNotEmpty) ...[
                const Divider(height: 32),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 8),
                  child: Text(
                    l10n.placesMutedSection(muted.length),
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                for (final place in muted) _PlaceTile(place: place),
              ],
              const SizedBox(height: 24),
            ],
          );
        },
      ),
    );
  }
}

class _SortMenu extends ConsumerWidget {
  const _SortMenu();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final current = ref.watch(placesSortProvider);

    String label(PlacesSort sort) => switch (sort) {
      PlacesSort.longestAgo => l10n.placesSortLongestAgo,
      PlacesSort.mostPhotos => l10n.placesSortMostPhotos,
      PlacesSort.nearest => l10n.placesSortNearest,
    };

    return PopupMenuButton<PlacesSort>(
      icon: const Icon(Icons.sort),
      tooltip: l10n.placesSortLabel,
      initialValue: current,
      onSelected: (sort) => ref.read(placesSortProvider.notifier).order = sort,
      itemBuilder: (context) => [
        for (final sort in PlacesSort.values)
          PopupMenuItem(value: sort, child: Text(label(sort))),
      ],
    );
  }
}

class _PlaceTile extends ConsumerWidget {
  const _PlaceTile({required this.place});

  final PlaceRow place;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);

    final lastVisit = DateTime.fromMillisecondsSinceEpoch(
      place.lastAt * 1000,
      isUtc: true,
    );
    final age = relativeAge(instant: lastVisit, now: DateTime.now());

    final here = ref.watch(currentLocationProvider).value;
    final distance = here == null
        ? null
        : distanceMeters(here, GeoPoint(place.centerLat, place.centerLng));

    final label = ref.watch(placeLabelProvider(place.id)).value;

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      leading: Icon(
        place.mute.isMuted ? Icons.notifications_off_outlined : Icons.place,
        color: place.mute.isMuted
            ? theme.colorScheme.outline
            : theme.colorScheme.primary,
      ),
      title: Text(
        label ?? l10n.placesUnnamed,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            [
              formatRelativeAge(l10n, age),
              l10n.herePhotoCount(place.photoCount),
              l10n.placesDayCount(place.distinctDays),
              if (distance != null) formatDistance(l10n, distance),
            ].join(' · '),
          ),
          if (_note(l10n) != null)
            Text(
              _note(l10n)!,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.outline,
              ),
            ),
        ],
      ),
      isThreeLine: _note(l10n) != null,
      trailing: _MuteButton(place: place),
    );
  }

  String? _note(AppLocalizations l10n) => switch (place.mute) {
    MuteState.auto => l10n.placesAutoMutedNote,
    MuteState.userMuted => l10n.placesUserMutedNote,
    MuteState.userUnmuted => l10n.placesUserUnmutedNote,
    MuteState.none => null,
  };
}

class _MuteButton extends ConsumerWidget {
  const _MuteButton({required this.place});

  final PlaceRow place;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);

    Future<void> run(Future<void> Function() action) async {
      await action();
      ref.invalidate(placesProvider);
    }

    final service = ref.watch(placesServiceProvider);

    return PopupMenuButton<VoidCallback>(
      icon: const Icon(Icons.more_vert),
      onSelected: (action) => action(),
      itemBuilder: (context) => [
        if (!place.mute.isMuted)
          PopupMenuItem(
            value: () => unawaited(run(() => service.mute(place.id))),
            child: Text(l10n.placesMute),
          ),
        if (place.mute.isMuted)
          PopupMenuItem(
            value: () => unawaited(run(() => service.unmute(place.id))),
            child: Text(l10n.placesUnmute),
          ),
        if (place.mute.isUserDecision)
          PopupMenuItem(
            value: () =>
                unawaited(run(() => service.clearUserDecision(place.id))),
            child: Text(l10n.placesUseAutoRule),
          ),
      ],
    );
  }
}
