import 'dart:async';

import 'package:been_here/app/providers.dart';
import 'package:been_here/domain/settings/app_settings.dart';
import 'package:been_here/features/here/arrivals_sheet.dart';
import 'package:been_here/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// The few things the user gets to decide. Phase 6 fills it out.
class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final settings = ref.watch(settingsProvider).value ?? const AppSettings();
    final stats = ref.watch(indexStatsProvider).value;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.settingsTabLabel)),
      body: ListView(
        children: [
          _Section(title: l10n.settingsPrivacyTitle),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
            child: Text(
              l10n.settingsPrivacyBody,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ),

          SwitchListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            title: Text(l10n.settingsPlaceNamesTitle),
            subtitle: Text(l10n.settingsPlaceNamesBody),
            isThreeLine: true,
            value: settings.placeNamesEnabled,
            onChanged: (enabled) => unawaited(
              ref
                  .read(settingsProvider.notifier)
                  .setPlaceNames(enabled: enabled),
            ),
          ),

          const Divider(height: 32),
          _Section(title: l10n.settingsAutoMuteTitle),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Text(
              l10n.settingsAutoMuteBody,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          _AutoMuteSlider(days: settings.autoMuteDays),

          SwitchListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            title: Text(l10n.settingsMapTitle),
            subtitle: Text(l10n.settingsMapBody),
            isThreeLine: true,
            value: settings.mapEnabled,
            onChanged: (enabled) => unawaited(
              ref
                  .read(settingsProvider.notifier)
                  .setMapEnabled(enabled: enabled),
            ),
          ),

          const Divider(height: 32),
          _Section(title: l10n.settingsArrivalsTitle),
          const _ArrivalsRow(),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 4, 20, 0),
            child: Text(
              l10n.settingsThresholdsBody,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          _ThresholdSlider(
            title: l10n.settingsMemoryAgeTitle,
            value: settings.memoryAgeDays.toDouble(),
            min: 1,
            max: 730,
            label: (v) => l10n.settingsMemoryAgeValue(v.round()),
            onChanged: (v) =>
                ref.read(settingsProvider.notifier).setMemoryAgeDays(v.round()),
          ),
          _ThresholdSlider(
            title: l10n.settingsPlaceCooldownTitle,
            value: settings.placeCooldownDays.toDouble(),
            min: 0,
            max: 120,
            label: (v) => l10n.settingsMemoryAgeValue(v.round()),
            onChanged: (v) => ref
                .read(settingsProvider.notifier)
                .setPlaceCooldownDays(v.round()),
          ),
          _ThresholdSlider(
            title: l10n.settingsDailyLimitTitle,
            value: settings.dailyLimitHours.toDouble(),
            min: 0,
            max: 72,
            label: (v) => l10n.settingsDailyLimitValue(v.round()),
            onChanged: (v) => ref
                .read(settingsProvider.notifier)
                .setDailyLimitHours(v.round()),
          ),

          const Divider(height: 32),
          _Section(title: l10n.settingsIndexTitle),
          if (stats != null)
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 8),
              child: Text(
                '${l10n.indexedPhotoCount(stats.total)} · '
                '${l10n.indexedLocationCoverage(stats.locationPercent)}',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            leading: const Icon(Icons.refresh),
            title: Text(l10n.settingsReindex),
            onTap: () =>
                unawaited(ref.read(indexerProvider).run(restart: true)),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class _Section extends StatelessWidget {
  const _Section({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
    child: Text(
      title,
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}

class _ArrivalsRow extends ConsumerWidget {
  const _ArrivalsRow();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final status =
        ref.watch(arrivalsStatusProvider).value ?? ArrivalsStatus.off;

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      leading: Icon(
        status == ArrivalsStatus.on
            ? Icons.notifications_active_outlined
            : Icons.notifications_off_outlined,
      ),
      title: Text(switch (status) {
        ArrivalsStatus.on => l10n.settingsArrivalsOn,
        ArrivalsStatus.needsSystemSettings => l10n.settingsArrivalsPending,
        ArrivalsStatus.off => l10n.settingsArrivalsOff,
      }),
      onTap: switch (status) {
        ArrivalsStatus.on => null,
        // iOS will not raise the prompt again; the settings app is the only
        // way through.
        ArrivalsStatus.needsSystemSettings => () => unawaited(
          ref.read(locationServiceProvider).openSystemSettings(),
        ),
        ArrivalsStatus.off => () => unawaited(ArrivalsSheet.show(context)),
      },
      trailing: status == ArrivalsStatus.on
          ? null
          : const Icon(Icons.chevron_right),
    );
  }
}

/// A threshold, with the write deferred to when the finger comes off.
class _ThresholdSlider extends ConsumerStatefulWidget {
  const _ThresholdSlider({
    required this.title,
    required this.value,
    required this.min,
    required this.max,
    required this.label,
    required this.onChanged,
  });

  final String title;
  final double value;
  final double min;
  final double max;
  final String Function(double value) label;
  final Future<void> Function(double value) onChanged;

  @override
  ConsumerState<_ThresholdSlider> createState() => _ThresholdSliderState();
}

class _ThresholdSliderState extends ConsumerState<_ThresholdSlider> {
  double? _dragging;

  @override
  Widget build(BuildContext context) {
    final value = _dragging ?? widget.value;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
          child: Text(
            '${widget.title}: ${widget.label(value)}',
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Slider(
            value: value.clamp(widget.min, widget.max),
            min: widget.min,
            max: widget.max,
            label: widget.label(value),
            onChanged: (v) => setState(() => _dragging = v),
            onChangeEnd: (v) {
              setState(() => _dragging = null);
              unawaited(widget.onChanged(v));
            },
          ),
        ),
      ],
    );
  }
}

class _AutoMuteSlider extends ConsumerStatefulWidget {
  const _AutoMuteSlider({required this.days});

  final int days;

  @override
  ConsumerState<_AutoMuteSlider> createState() => _AutoMuteSliderState();
}

class _AutoMuteSliderState extends ConsumerState<_AutoMuteSlider> {
  double? _dragging;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final days = (_dragging ?? widget.days.toDouble()).round();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
          child: Text(
            l10n.settingsAutoMuteValue(days),
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Slider(
            value: days.toDouble().clamp(5, 200),
            min: 5,
            max: 200,
            label: l10n.settingsAutoMuteValue(days),
            onChanged: (value) => setState(() => _dragging = value),
            // Recomputing every place is too much work to do per frame, so
            // it waits for the finger to come off.
            onChangeEnd: (value) {
              setState(() => _dragging = null);
              unawaited(
                ref
                    .read(settingsProvider.notifier)
                    .setAutoMuteDays(value.round()),
              );
            },
          ),
        ),
      ],
    );
  }
}
