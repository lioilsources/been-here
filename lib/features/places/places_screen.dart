import 'dart:async';

import 'package:been_here/app/providers.dart';
import 'package:been_here/core/geo/geo_point.dart';
import 'package:been_here/core/geo/haversine.dart';
import 'package:been_here/data/db/database.dart';
import 'package:been_here/domain/memories/notification_rules.dart';
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

    final ascending = ref.watch(placesSortAscendingProvider);

    String label(PlacesSort sort) => switch (sort) {
      PlacesSort.longestAgo => l10n.placesSortLongestAgo,
      PlacesSort.mostPhotos => l10n.placesSortMostPhotos,
      PlacesSort.mostVisits => l10n.placesSortVisits,
      PlacesSort.nearest => l10n.placesSortNearest,
    };

    return PopupMenuButton<void Function()>(
      icon: const Icon(Icons.sort),
      tooltip: l10n.placesSortLabel,
      onSelected: (action) => action(),
      itemBuilder: (context) => [
        for (final sort in PlacesSort.values)
          CheckedPopupMenuItem(
            value: () => ref.read(placesSortProvider.notifier).order = sort,
            checked: sort == current,
            child: Text(label(sort)),
          ),
        const PopupMenuDivider(),
        CheckedPopupMenuItem(
          value: () =>
              ref.read(placesSortAscendingProvider.notifier).value = !ascending,
          checked: ascending,
          child: Text(l10n.placesSortAscending),
        ),
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
    final age = formatRelativeAge(
      l10n,
      relativeAge(instant: lastVisit, now: DateTime.now()),
    );
    final photos = l10n.herePhotoCount(place.photoCount);

    final here = ref.watch(currentLocationProvider).value;
    final distance = here == null
        ? null
        : formatDistance(
            l10n,
            distanceMeters(here, GeoPoint(place.centerLat, place.centerLng)),
          );

    final name = ref.watch(placeLabelProvider(place.id)).value;

    // A name is a bonus, not the point. When there isn't one, the row leads
    // with what the app actually knows — when you were last here — instead
    // of with the same placeholder on every line.
    final title = name ?? l10n.placesSummary(age, photos);
    final details = <String>[
      // With a name in the title, the age and count move down here.
      if (name != null) ...[age, photos],
      l10n.placesDayCount(place.distinctDays),
      ?distance,
    ];

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      // Tapping a place is the obvious thing to do with it: show what you
      // photographed there.
      onTap: () => unawaited(openPlace(ref, place.id)),
      leading: Icon(
        place.mute.isMuted ? Icons.notifications_off_outlined : Icons.place,
        color: place.mute.isMuted
            ? theme.colorScheme.outline
            : theme.colorScheme.primary,
      ),
      title: Text(title, maxLines: 1, overflow: TextOverflow.ellipsis),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(details.join(' · ')),
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
      trailing: _PlaceMenu(place: place, hasName: name != null),
    );
  }

  String? _note(AppLocalizations l10n) => switch (place.mute) {
    MuteState.auto => l10n.placesAutoMutedNote,
    MuteState.userMuted => l10n.placesUserMutedNote,
    MuteState.userUnmuted => l10n.placesUserUnmutedNote,
    MuteState.none => null,
  };
}

/// Asks for a name. Nothing here touches the network — the name the user
/// types is theirs and stays on the phone.
class _NameDialog extends StatefulWidget {
  const _NameDialog({this.initial});

  final String? initial;

  @override
  State<_NameDialog> createState() => _NameDialogState();
}

class _NameDialogState extends State<_NameDialog> {
  late final _controller = TextEditingController(text: widget.initial ?? '');

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return AlertDialog(
      title: Text(l10n.placesNameDialogTitle),
      content: TextField(
        controller: _controller,
        autofocus: true,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(hintText: l10n.placesNameHint),
        onSubmitted: (value) => Navigator.of(context).pop(value),
      ),
      actions: [
        if (widget.initial != null)
          TextButton(
            onPressed: () => Navigator.of(context).pop(''),
            child: Text(l10n.placesNameClear),
          ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(l10n.commonCancel),
        ),
        FilledButton(
          onPressed: () => Navigator.of(context).pop(_controller.text),
          child: Text(l10n.placesNameSave),
        ),
      ],
    );
  }
}

class _PlaceMenu extends ConsumerWidget {
  const _PlaceMenu({required this.place, required this.hasName});

  final PlaceRow place;
  final bool hasName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final service = ref.watch(placesServiceProvider);

    Future<void> run(Future<void> Function() action) async {
      await action();
      ref
        ..invalidate(placesProvider)
        ..invalidate(placeLabelProvider(place.id));
    }

    Future<void> rename() async {
      final name = await showDialog<String>(
        context: context,
        builder: (_) => _NameDialog(initial: hasName ? place.userLabel : null),
      );
      if (name == null) return;
      await run(() => service.rename(place.id, name));
    }

    Future<void> tryArrival() async {
      final decision = await testArrival(ref, l10n, place.id);
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(_arrivalOutcome(l10n, decision))),
      );
      ref.invalidate(placesProvider);
    }

    return PopupMenuButton<VoidCallback>(
      icon: const Icon(Icons.more_vert),
      onSelected: (action) => action(),
      itemBuilder: (context) => [
        PopupMenuItem(
          value: () => unawaited(rename()),
          child: Text(
            place.userLabel == null ? l10n.placesName : l10n.placesRename,
          ),
        ),
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
        PopupMenuItem(
          value: () => unawaited(tryArrival()),
          child: Text(l10n.placesTestArrival),
        ),
      ],
    );
  }
}

/// What the rules decided, in words.
///
/// Saying *why* nothing happened is the whole value of the test action: the
/// silent cases are the ones that are hard to tell apart from a bug.
String _arrivalOutcome(AppLocalizations l10n, NotificationDecision decision) =>
    switch (decision.veto) {
      null => l10n.arrivalTestNotified,
      NotificationVeto.muted => l10n.arrivalTestMuted,
      NotificationVeto.tooFewPhotos => l10n.arrivalTestTooFewPhotos,
      NotificationVeto.tooRecent => l10n.arrivalTestTooRecent,
      NotificationVeto.placeCooldown => l10n.arrivalTestPlaceCooldown,
      NotificationVeto.dailyLimit => l10n.arrivalTestDailyLimit,
    };
