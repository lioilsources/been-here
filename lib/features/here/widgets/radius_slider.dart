import 'dart:async';
import 'dart:math' as math;

import 'package:been_here/app/providers.dart';
import 'package:been_here/features/common/format.dart';
import 'package:been_here/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Radius control for the Here screen.
///
/// Logarithmic, because the interesting range spans five hundred times
/// itself: the first half of the track has to buy 100 m to 2 km, where "this
/// building" turns into "this neighbourhood", and the rest can have the
/// tens of kilometres.
class RadiusSlider extends ConsumerStatefulWidget {
  const RadiusSlider({required this.photoCount, super.key});

  /// Shown next to the radius. Null while it is being recounted.
  final int? photoCount;

  @override
  ConsumerState<RadiusSlider> createState() => _RadiusSliderState();
}

class _RadiusSliderState extends ConsumerState<RadiusSlider> {
  static final double _logMin = math.log(SearchRadius.minMeters);
  static final double _logMax = math.log(SearchRadius.maxMeters);

  double? _dragging;
  Timer? _throttle;

  @override
  void dispose() {
    _throttle?.cancel();
    super.dispose();
  }

  static double _toSlider(double meters) =>
      (math.log(meters) - _logMin) / (_logMax - _logMin);

  static double _toMeters(double position) =>
      math.exp(_logMin + position * (_logMax - _logMin));

  /// Pushes the value at most every 80 ms while the finger is down.
  ///
  /// Every change re-runs a database query; at sixty frames a second that
  /// queues up faster than it drains and the slider stutters.
  void _onChanged(double position) {
    final meters = _toMeters(position);
    setState(() => _dragging = meters);
    if (_throttle?.isActive ?? false) return;
    _throttle = Timer(const Duration(milliseconds: 80), () {
      final latest = _dragging;
      if (latest != null) {
        ref.read(searchRadiusProvider.notifier).meters = latest;
      }
    });
  }

  void _onChangeEnd(double position) {
    _throttle?.cancel();
    ref.read(searchRadiusProvider.notifier).meters = _toMeters(position);
    setState(() => _dragging = null);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final settled = ref.watch(searchRadiusProvider);
    final radius = _dragging ?? settled;
    final count = widget.photoCount;

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                l10n.hereRadiusLabel(formatRadius(l10n, radius)),
                style: theme.textTheme.titleSmall,
              ),
              AnimatedOpacity(
                opacity: count == null ? 0.4 : 1,
                duration: const Duration(milliseconds: 150),
                child: Text(
                  l10n.herePhotoCount(count ?? 0),
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
            ],
          ),
          Slider(
            value: _toSlider(radius).clamp(0.0, 1.0),
            label: formatRadius(l10n, radius),
            onChanged: _onChanged,
            onChangeEnd: _onChangeEnd,
          ),
        ],
      ),
    );
  }
}
