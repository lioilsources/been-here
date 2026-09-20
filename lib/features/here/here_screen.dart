import 'dart:async';

import 'package:been_here/app/providers.dart';
import 'package:been_here/data/location/location_service.dart';
import 'package:been_here/data/photos/photo_library.dart';
import 'package:been_here/domain/indexing/index_progress.dart';
import 'package:been_here/features/common/empty_state.dart';
import 'package:been_here/features/common/format.dart';
import 'package:been_here/features/here/debug_location_sheet.dart';
import 'package:been_here/features/here/widgets/radius_slider.dart';
import 'package:been_here/features/here/widgets/visit_section.dart';
import 'package:been_here/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// The screen that matters: what did I photograph right here, and when.
class HereScreen extends ConsumerStatefulWidget {
  const HereScreen({super.key, this.placeId});

  /// When set, show memories for this place instead of the current location
  /// (a notification tap lands here). Wired up in phase 4.
  final int? placeId;

  @override
  ConsumerState<HereScreen> createState() => _HereScreenState();
}

class _HereScreenState extends ConsumerState<HereScreen> {
  bool _syncStarted = false;
  bool _requestingPhotos = false;
  bool _requestingLocation = false;

  /// Starts the background sync the first time we know we're allowed to read.
  void _startSyncOnce(PhotoPermission permission) {
    if (_syncStarted || !permission.canRead) return;
    _syncStarted = true;
    // Deferred: providers must not be mutated during a build.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) unawaited(ref.read(librarySyncProvider).start());
    });
  }

  Future<void> _requestPhotoPermission() async {
    setState(() => _requestingPhotos = true);
    try {
      await ref.read(photoLibraryProvider).requestPermission();
      ref.invalidate(photoPermissionProvider);
    } finally {
      if (mounted) setState(() => _requestingPhotos = false);
    }
  }

  Future<void> _requestLocationPermission() async {
    setState(() => _requestingLocation = true);
    try {
      await ref.read(locationServiceProvider).requestWhileInUse();
      ref
        ..invalidate(locationPermissionProvider)
        ..invalidate(currentLocationProvider);
    } finally {
      if (mounted) setState(() => _requestingLocation = false);
    }
  }

  Future<void> _refresh() async {
    ref
      ..invalidate(currentLocationProvider)
      ..invalidate(memoriesHereProvider);
    await ref.read(memoriesHereProvider.future);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final photoPermission = ref.watch(photoPermissionProvider);

    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          // The debug location override. A long press keeps it out of the
          // way without hiding it behind a build flag.
          onLongPress: () => unawaited(DebugLocationSheet.show(context)),
          child: Text(l10n.hereTabLabel),
        ),
        actions: [
          if (ref.watch(debugLocationProvider) != null)
            IconButton(
              tooltip: l10n.debugLocationActive,
              icon: const Icon(Icons.bug_report_outlined),
              onPressed: () => unawaited(DebugLocationSheet.show(context)),
            ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: photoPermission.when(
          loading: _centered,
          error: (_, _) => _scrollable(
            EmptyState(
              icon: Icons.error_outline,
              title: l10n.indexFailedTitle,
              body: l10n.indexFailedBody,
              action: FilledButton(
                onPressed: () => ref.invalidate(photoPermissionProvider),
                child: Text(l10n.commonRetry),
              ),
            ),
          ),
          data: (permission) {
            _startSyncOnce(permission);
            return _body(l10n, permission);
          },
        ),
      ),
    );
  }

  Widget _centered() => const Center(child: CircularProgressIndicator());

  /// Anything shown instead of the timeline still has to scroll, or pull to
  /// refresh does nothing.
  Widget _scrollable(Widget child) => LayoutBuilder(
    builder: (context, constraints) => SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: constraints.maxHeight),
        child: Center(child: child),
      ),
    ),
  );

  Widget _body(AppLocalizations l10n, PhotoPermission photoPermission) {
    if (!photoPermission.canRead) {
      return _scrollable(_photoPermissionState(l10n, photoPermission));
    }

    // An index that is still being built has nothing to show yet.
    final indexing =
        ref.watch(indexProgressProvider).value ?? const IndexProgress.idle();
    final stats = ref.watch(indexStatsProvider).value;
    if (indexing.isRunning && (stats?.isEmpty ?? true)) {
      return _scrollable(_IndexingState(progress: indexing));
    }

    final location = ref.watch(currentLocationProvider);
    return location.when(
      loading: _centered,
      error: (_, _) => _scrollable(
        EmptyState(
          icon: Icons.location_disabled_outlined,
          title: l10n.locationUnavailableTitle,
          body: l10n.locationUnavailableBody,
          action: FilledButton(
            onPressed: () => ref.invalidate(currentLocationProvider),
            child: Text(l10n.commonRetry),
          ),
        ),
      ),
      data: (center) {
        if (center == null) return _scrollable(_locationState(l10n));
        return _timeline(l10n);
      },
    );
  }

  Widget _photoPermissionState(
    AppLocalizations l10n,
    PhotoPermission permission,
  ) {
    final canAsk = permission == PhotoPermission.notDetermined;
    return EmptyState(
      icon: Icons.lock_outline,
      title: canAsk
          ? l10n.indexPermissionTitle
          : l10n.indexPermissionDeniedTitle,
      body: canAsk ? l10n.indexPermissionBody : l10n.indexPermissionDeniedBody,
      action: canAsk
          ? FilledButton(
              onPressed: _requestingPhotos ? null : _requestPhotoPermission,
              child: Text(l10n.indexPermissionAction),
            )
          : null,
    );
  }

  Widget _locationState(AppLocalizations l10n) {
    final permission = ref.watch(locationPermissionProvider).value;

    return switch (permission) {
      LocationPermissionState.servicesDisabled => EmptyState(
        icon: Icons.location_off_outlined,
        title: l10n.locationServicesDisabledTitle,
        body: l10n.locationServicesDisabledBody,
        action: FilledButton(
          onPressed: () => ref.invalidate(locationPermissionProvider),
          child: Text(l10n.commonRetry),
        ),
      ),
      LocationPermissionState.denied ||
      LocationPermissionState.deniedForever => EmptyState(
        icon: Icons.location_off_outlined,
        title: l10n.locationDeniedTitle,
        body: l10n.locationDeniedBody,
      ),
      LocationPermissionState.notDetermined || null => EmptyState(
        icon: Icons.my_location_outlined,
        title: l10n.locationPermissionTitle,
        body: l10n.locationPermissionBody,
        action: FilledButton(
          onPressed: _requestingLocation ? null : _requestLocationPermission,
          child: Text(l10n.locationPermissionAction),
        ),
      ),
      // Permission is fine; the fix just hasn't arrived.
      _ => EmptyState(
        icon: Icons.location_searching,
        title: l10n.locationUnavailableTitle,
        body: l10n.locationUnavailableBody,
        action: FilledButton(
          onPressed: () => ref.invalidate(currentLocationProvider),
          child: Text(l10n.commonRetry),
        ),
      ),
    };
  }

  Widget _timeline(AppLocalizations l10n) {
    final here = ref.watch(memoriesHereProvider);
    final radius = ref.watch(searchRadiusProvider);
    // Keep the previous result on screen while a wider radius is counted;
    // blanking the list on every drag makes the slider feel broken.
    final memories = here.value;

    return CustomScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: RadiusSlider(photoCount: memories?.photoCount),
        ),
        if (memories == null)
          const SliverFillRemaining(
            hasScrollBody: false,
            child: Center(child: CircularProgressIndicator()),
          )
        else if (memories.isEmpty)
          SliverFillRemaining(
            hasScrollBody: false,
            child: Center(child: _NothingHere(radiusMeters: radius)),
          )
        else
          SliverList.builder(
            itemCount: memories.visits.length,
            itemBuilder: (context, i) => VisitSection(
              visit: memories.visits[i],
              center: memories.center,
              radiusMeters: memories.radiusMeters,
            ),
          ),
        const SliverToBoxAdapter(child: SizedBox(height: 32)),
      ],
    );
  }
}

/// Nothing within the radius — so say where the closest thing is, rather than
/// leaving the user to guess whether the app is broken.
class _NothingHere extends ConsumerWidget {
  const _NothingHere({required this.radiusMeters});

  final double radiusMeters;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final nearest = ref.watch(nearestMemoryProvider).value;

    return EmptyState(
      icon: Icons.photo_camera_outlined,
      title: l10n.hereNothingTitle,
      body: l10n.hereNothingBody,
      footnote: nearest == null
          ? null
          : l10n.hereNearestHint(
              formatDistance(l10n, nearest.distanceMeters),
            ),
      action: nearest == null
          ? null
          : FilledButton.tonal(
              onPressed: () =>
                  // Just past it, so what we promised actually appears.
                  ref.read(searchRadiusProvider.notifier).meters =
                      nearest.distanceMeters * 1.1,
              child: Text(
                l10n.hereRadiusLabel(
                  formatRadius(l10n, nearest.distanceMeters * 1.1),
                ),
              ),
            ),
    );
  }
}

class _IndexingState extends StatelessWidget {
  const _IndexingState({required this.progress});

  final IndexProgress progress;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(l10n.indexRunningTitle, style: theme.textTheme.titleMedium),
          const SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              // Indeterminate until the total is known.
              value: progress.total > 0 ? progress.fraction : null,
              minHeight: 6,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            l10n.indexRunningProgress(progress.processed, progress.total),
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
