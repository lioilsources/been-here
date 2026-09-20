import 'dart:async';

import 'package:been_here/app/providers.dart';
import 'package:been_here/data/location/location_service.dart';
import 'package:been_here/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Explains background location before the system asks for it.
///
/// The plan and App Review want the same thing here: the bigger permission
/// is only asked for once the app has shown what it is for, and the ask is
/// preceded by our own words rather than dropped on the user cold. Declining
/// is a first-class outcome — everything else keeps working.
class ArrivalsSheet extends ConsumerStatefulWidget {
  const ArrivalsSheet({super.key});

  static Future<void> show(BuildContext context) => showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    builder: (_) => const ArrivalsSheet(),
  );

  @override
  ConsumerState<ArrivalsSheet> createState() => _ArrivalsSheetState();
}

class _ArrivalsSheetState extends ConsumerState<ArrivalsSheet> {
  bool _asking = false;
  bool _refused = false;

  Future<void> _enable() async {
    setState(() => _asking = true);
    try {
      final result = await ref.read(locationServiceProvider).requestAlways();

      await ref.read(notificationServiceProvider).requestPermission();

      ref
        ..invalidate(locationPermissionProvider)
        ..invalidate(arrivalsAvailableProvider)
        ..invalidate(shouldOfferArrivalsProvider);

      if (result == LocationPermissionState.always) {
        final here = await ref.read(currentLocationProvider.future);
        if (here != null) {
          await ref.read(regionSyncProvider).syncRegions(here);
        }
        if (mounted) Navigator.of(context).pop();
        return;
      }
      if (mounted) setState(() => _refused = true);
    } finally {
      if (mounted) setState(() => _asking = false);
    }
  }

  Future<void> _later() async {
    await declineArrivals(ref);
    if (mounted) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Icon(
                Icons.notifications_active_outlined,
                size: 40,
                color: theme.colorScheme.primary,
              ),
              const SizedBox(height: 16),
              Text(
                l10n.alwaysLocationTitle,
                style: theme.textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                _refused
                    ? l10n.alwaysLocationDeniedBody
                    : l10n.alwaysLocationBody,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 24),
              if (_refused)
                FilledButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(l10n.commonClose),
                )
              else ...[
                FilledButton(
                  onPressed: _asking ? null : _enable,
                  child: Text(l10n.alwaysLocationAction),
                ),
                TextButton(
                  onPressed: _asking ? null : () => unawaited(_later()),
                  child: Text(l10n.alwaysLocationLater),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

/// The quiet offer on the Here screen.
class ArrivalsCard extends ConsumerWidget {
  const ArrivalsCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final offer = ref.watch(shouldOfferArrivalsProvider).value ?? false;
    if (!offer) return const SizedBox.shrink();

    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
      child: Material(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(14),
        child: InkWell(
          borderRadius: BorderRadius.circular(14),
          onTap: () => unawaited(ArrivalsSheet.show(context)),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Icon(
                  Icons.notifications_active_outlined,
                  color: theme.colorScheme.primary,
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Text(
                    l10n.alwaysLocationTitle,
                    style: theme.textTheme.titleSmall,
                  ),
                ),
                Icon(
                  Icons.chevron_right,
                  color: theme.colorScheme.outline,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
