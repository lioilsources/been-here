import 'dart:async';

import 'package:been_here/app/providers.dart';
import 'package:been_here/domain/settings/app_settings.dart';
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
