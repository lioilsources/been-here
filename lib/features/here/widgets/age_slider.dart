import 'dart:async';

import 'package:been_here/app/providers.dart';
import 'package:been_here/domain/memories/age_window.dart';
import 'package:been_here/features/common/format.dart';
import 'package:been_here/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// How old a photo may be to get a dot on the map: two thumbs, from "now"
/// on the left to "everything" on the right.
///
/// The radius slider's sibling, and it sits under it for the same reason:
/// both decide which dots are drawn. Unlike the radius it moves in steps a
/// person would say out loud, so the label is a sentence and the dots are
/// queried once per step rather than once per pixel.
class AgeSlider extends ConsumerStatefulWidget {
  const AgeSlider({super.key});

  @override
  ConsumerState<AgeSlider> createState() => _AgeSliderState();
}

class _AgeSliderState extends ConsumerState<AgeSlider> {
  /// Where the thumbs are while a finger is on them. The provider is only
  /// written when it lets go: every write re-queries the dots.
  AgeWindow? _dragging;

  /// Whether a finger is on a thumb. A screen reader's increase and
  /// decrease arrive as a bare `onChanged`, with no start and no end, and
  /// those have to be kept straight away or they are never kept at all.
  bool _fingerDown = false;

  static RangeValues _toValues(AgeWindow window) =>
      RangeValues(window.newest.toDouble(), window.oldest.toDouble());

  void _onChanged(AgeWindow current, RangeValues values) {
    final newest = values.start.round();
    final oldest = values.end.round();
    final next = AgeWindow.clamp(
      newest,
      oldest,
      movedOldest: oldest != current.oldest,
    );
    if (next == current) return;
    if (_fingerDown) {
      setState(() => _dragging = next);
    } else {
      unawaited(ref.read(mapAgeWindowProvider.notifier).set(next));
    }
  }

  void _onChangeEnd(RangeValues _) {
    final settled = _dragging;
    if (settled != null) {
      unawaited(ref.read(mapAgeWindowProvider.notifier).set(settled));
    }
    setState(() {
      _dragging = null;
      _fingerDown = false;
    });
  }

  void _reset() {
    setState(() => _dragging = null);
    unawaited(ref.read(mapAgeWindowProvider.notifier).set(AgeWindow.defaults));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final settled = ref.watch(mapAgeWindowProvider).value ?? AgeWindow.defaults;
    final window = _dragging ?? settled;

    final points = ref.watch(memoryPointsProvider);
    final count = points.value?.length;
    final recounting = points.isLoading || _dragging != null;

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Flexible(
                      child: Text(
                        formatAgeWindow(l10n, window),
                        style: theme.textTheme.titleSmall,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (!window.isDefault)
                      TextButton(
                        onPressed: _reset,
                        style: TextButton.styleFrom(
                          visualDensity: VisualDensity.compact,
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                        ),
                        child: Text(l10n.ageWindowReset),
                      ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              AnimatedOpacity(
                opacity: count == null || recounting ? 0.4 : 1,
                duration: const Duration(milliseconds: 150),
                child: Text(
                  // At the cap there are more than the map asked for, and
                  // saying "800 photos" would be a small lie.
                  count != null && count >= mapPointLimit
                      ? l10n.mapDotCountCapped(mapPointLimit)
                      : l10n.herePhotoCount(count ?? 0),
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
            ],
          ),
          // Not merged, unlike the radius slider: a range has two thumbs,
          // each with its own value, and merging them keeps only the first.
          // The name goes on the group so each thumb is read inside it.
          Semantics(
            container: true,
            label: l10n.ageSemanticLabel,
            child: RangeSlider(
              values: _toValues(window),
              max: AgeWindow.unbounded.toDouble(),
              divisions: AgeWindow.unbounded,
              labels: RangeLabels(
                formatAgeStop(l10n, window.newest),
                formatAgeStop(l10n, window.oldest),
              ),
              // Without this a screen reader reads the stop's index,
              // "nine", which means nothing to anyone.
              semanticFormatterCallback: (value) =>
                  formatAgeStop(l10n, value.round()),
              onChangeStart: (_) => _fingerDown = true,
              onChanged: (values) => _onChanged(window, values),
              onChangeEnd: _onChangeEnd,
            ),
          ),
        ],
      ),
    );
  }
}
