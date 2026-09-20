import 'dart:async';

import 'package:been_here/app/providers.dart';
import 'package:been_here/data/photos/photo_library.dart';
import 'package:been_here/domain/indexing/index_progress.dart';
import 'package:been_here/features/common/empty_state.dart';
import 'package:been_here/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// The screen that matters: what did I photograph right here, and when.
///
/// Phase 1 gets it as far as owning the photo permission and showing the
/// indexing pass. Location, radius and the visit timeline arrive in phase 2.
class HereScreen extends ConsumerStatefulWidget {
  const HereScreen({super.key, this.placeId});

  /// When set, show memories for this place instead of the current location
  /// (a notification tap lands here).
  final int? placeId;

  @override
  ConsumerState<HereScreen> createState() => _HereScreenState();
}

class _HereScreenState extends ConsumerState<HereScreen> {
  bool _syncStarted = false;
  bool _requesting = false;

  /// Starts the background sync the first time we know we're allowed to read.
  void _startSyncOnce(PhotoPermission permission) {
    if (_syncStarted || !permission.canRead) return;
    _syncStarted = true;
    // Deferred: providers must not be mutated during a build.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) unawaited(ref.read(librarySyncProvider).start());
    });
  }

  Future<void> _requestPermission() async {
    setState(() => _requesting = true);
    try {
      await ref.read(photoLibraryProvider).requestPermission();
      ref.invalidate(photoPermissionProvider);
    } finally {
      if (mounted) setState(() => _requesting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final permission = ref.watch(photoPermissionProvider);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.hereTabLabel)),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 32),
          child: permission.when(
            loading: () => const CircularProgressIndicator(),
            error: (_, _) => EmptyState(
              icon: Icons.error_outline,
              title: l10n.indexFailedTitle,
              body: l10n.indexFailedBody,
              action: FilledButton(
                onPressed: () => ref.invalidate(photoPermissionProvider),
                child: Text(l10n.commonRetry),
              ),
            ),
            data: (state) {
              _startSyncOnce(state);
              return _body(context, l10n, state);
            },
          ),
        ),
      ),
    );
  }

  Widget _body(
    BuildContext context,
    AppLocalizations l10n,
    PhotoPermission permission,
  ) {
    if (!permission.canRead) {
      return _permissionState(l10n, permission);
    }

    final progress =
        ref.watch(indexProgressProvider).value ?? const IndexProgress.idle();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (permission == PhotoPermission.limited)
          _LimitedAccessNotice(text: l10n.indexLimitedAccessNotice),
        _indexState(l10n, progress),
      ],
    );
  }

  Widget _permissionState(AppLocalizations l10n, PhotoPermission permission) {
    final canAsk = permission == PhotoPermission.notDetermined;

    return EmptyState(
      icon: Icons.lock_outline,
      title: canAsk
          ? l10n.indexPermissionTitle
          : l10n.indexPermissionDeniedTitle,
      body: canAsk ? l10n.indexPermissionBody : l10n.indexPermissionDeniedBody,
      action: canAsk
          ? FilledButton(
              onPressed: _requesting ? null : _requestPermission,
              child: Text(l10n.indexPermissionAction),
            )
          : null,
    );
  }

  Widget _indexState(AppLocalizations l10n, IndexProgress progress) {
    switch (progress.status) {
      case IndexStatus.running:
        return _IndexingState(progress: progress);

      case IndexStatus.failed:
        return EmptyState(
          icon: Icons.sync_problem,
          title: l10n.indexFailedTitle,
          body: l10n.indexFailedBody,
          action: FilledButton(
            onPressed: () => ref.read(indexerProvider).run(),
            child: Text(l10n.commonRetry),
          ),
        );

      case IndexStatus.idle:
      case IndexStatus.cancelled:
      case IndexStatus.permissionDenied:
      case IndexStatus.completed:
        return const _IndexSummary();
    }
  }
}

class _LimitedAccessNotice extends StatelessWidget {
  const _LimitedAccessNotice({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.fromLTRB(24, 0, 24, 24),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.info_outline, size: 18, color: theme.colorScheme.outline),
          const SizedBox(width: 10),
          Expanded(
            child: Text(text, style: theme.textTheme.bodySmall),
          ),
        ],
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

/// Phase 1 placeholder: proves the index exists. Phase 2 replaces this with
/// the actual memories for the current location.
class _IndexSummary extends ConsumerWidget {
  const _IndexSummary();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final stats = ref.watch(indexStatsProvider);

    return stats.when(
      loading: () => const CircularProgressIndicator(),
      error: (_, _) => EmptyState(
        icon: Icons.error_outline,
        title: l10n.indexFailedTitle,
        body: l10n.indexFailedBody,
      ),
      data: (data) {
        if (data.isEmpty) {
          return EmptyState(
            icon: Icons.photo_library_outlined,
            title: l10n.hereNotIndexedTitle,
            body: l10n.hereNotIndexedBody,
            action: FilledButton(
              onPressed: () => ref.read(indexerProvider).run(),
              child: Text(l10n.indexStartAction),
            ),
          );
        }
        return EmptyState(
          icon: Icons.photo_library_outlined,
          title: l10n.indexedPhotoCount(data.total),
          body: l10n.indexedLocationCoverage(data.locationPercent),
          footnote: l10n.hereEmptyBody,
        );
      },
    );
  }
}
