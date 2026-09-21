import 'dart:async';

import 'package:been_here/app/providers.dart';
import 'package:been_here/core/geo/geo_point.dart';
import 'package:been_here/domain/memories/relative_age.dart';
import 'package:been_here/domain/memories/visit.dart';
import 'package:been_here/features/common/format.dart';
import 'package:been_here/features/here/photo_detail_screen.dart';
import 'package:been_here/features/here/widgets/photo_thumbnail.dart';
import 'package:been_here/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

/// One visit in the timeline: when it was, and what it looked like.
class VisitSection extends ConsumerWidget {
  const VisitSection({
    required this.visit,
    required this.center,
    required this.radiusMeters,
    super.key,
    this.previewCount = 12,
  });

  final Visit visit;
  final GeoPoint center;
  final double radiusMeters;

  /// How many thumbnails to show before collapsing the rest into a "+N".
  final int previewCount;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);

    final age = relativeAge(instant: visit.startedAt, now: DateTime.now());
    final dateText = DateFormat.yMMMMd(
      Localizations.localeOf(context).toLanguageTag(),
    ).format(visit.date);

    final query = VisitQuery(
      visit: visit,
      center: center,
      radiusMeters: radiusMeters,
      limit: previewCount,
    );
    final photos = ref.watch(visitPhotosProvider(query));

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            formatRelativeAge(l10n, age),
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            '$dateText · ${l10n.herePhotoCount(visit.photoCount)}',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 10),
          photos.when(
            loading: () => _GridPlaceholder(
              count: visit.photoCount.clamp(1, previewCount),
            ),
            error: (_, _) => const _GridPlaceholder(count: 1),
            data: (loaded) => _PhotoGrid(
              assetIds: [for (final photo in loaded) photo.assetId],
              extra: visit.photoCount - loaded.length,
              total: visit.photoCount,
              dateText: dateText,
              onTap: (index) => _open(context, index),
            ),
          ),
        ],
      ),
    );
  }

  void _open(BuildContext context, int index) {
    unawaited(
      Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (_) => PhotoDetailScreen(
            visit: visit,
            center: center,
            radiusMeters: radiusMeters,
            initialIndex: index,
          ),
        ),
      ),
    );
  }
}

class _PhotoGrid extends StatelessWidget {
  const _PhotoGrid({
    required this.assetIds,
    required this.extra,
    required this.total,
    required this.dateText,
    required this.onTap,
  });

  final List<String> assetIds;
  final int extra;
  final int total;
  final String dateText;
  final void Function(int index) onTap;

  @override
  Widget build(BuildContext context) {
    if (assetIds.isEmpty) return const SizedBox.shrink();
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        const columns = 4;
        const gap = 6.0;
        final side = (constraints.maxWidth - gap * (columns - 1)) / columns;

        return Wrap(
          spacing: gap,
          runSpacing: gap,
          children: [
            for (var i = 0; i < assetIds.length; i++)
              SizedBox(
                width: side,
                height: side,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    PhotoThumbnail(assetId: assetIds[i]),
                    if (i == assetIds.length - 1 && extra > 0)
                      DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.5),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            '+$extra',
                            style: theme.textTheme.titleMedium?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    // The label lives on the tap target rather than on
                    // the picture: a screen reader should find one thing
                    // per photo, and it should be the thing you can open.
                    Semantics(
                      button: true,
                      label: l10n.photoOpenSemanticLabel(
                        i + 1,
                        total,
                        dateText,
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(8),
                          onTap: () => onTap(i),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        );
      },
    );
  }
}

class _GridPlaceholder extends StatelessWidget {
  const _GridPlaceholder({required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return LayoutBuilder(
      builder: (context, constraints) {
        const columns = 4;
        const gap = 6.0;
        final side = (constraints.maxWidth - gap * (columns - 1)) / columns;
        return Wrap(
          spacing: gap,
          runSpacing: gap,
          children: [
            for (var i = 0; i < count; i++)
              Container(
                width: side,
                height: side,
                decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
          ],
        );
      },
    );
  }
}
