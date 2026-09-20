import 'package:been_here/app/providers.dart';
import 'package:been_here/core/geo/geo_point.dart';
import 'package:been_here/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Pretend to be somewhere else.
///
/// The plan asks for this so the Here screen can be tested from the sofa —
/// standing in the right place at the right moment is otherwise the only way
/// to see the screen do anything.
class DebugLocationSheet extends ConsumerStatefulWidget {
  const DebugLocationSheet({super.key});

  static Future<void> show(BuildContext context) => showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    builder: (_) => const DebugLocationSheet(),
  );

  @override
  ConsumerState<DebugLocationSheet> createState() => _DebugLocationSheetState();
}

class _DebugLocationSheetState extends ConsumerState<DebugLocationSheet> {
  late final TextEditingController _lat;
  late final TextEditingController _lng;
  String? _error;

  @override
  void initState() {
    super.initState();
    final current = ref.read(viewpointProvider);
    _lat = TextEditingController(text: current?.lat.toStringAsFixed(6) ?? '');
    _lng = TextEditingController(text: current?.lng.toStringAsFixed(6) ?? '');
  }

  @override
  void dispose() {
    _lat.dispose();
    _lng.dispose();
    super.dispose();
  }

  void _apply() {
    final lat = double.tryParse(_lat.text.trim().replaceAll(',', '.'));
    final lng = double.tryParse(_lng.text.trim().replaceAll(',', '.'));
    if (lat == null || lng == null || !GeoPoint(lat, lng).isValid) {
      setState(() => _error = '−90..90 / −180..180');
      return;
    }
    ref.read(viewpointProvider.notifier).point = GeoPoint(lat, lng);
    Navigator.of(context).pop();
  }

  void _clear() {
    ref.read(viewpointProvider.notifier).point = null;
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final active = ref.watch(viewpointProvider) != null;

    return Padding(
      padding: EdgeInsets.fromLTRB(
        20,
        20,
        20,
        20 + MediaQuery.viewInsetsOf(context).bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(l10n.debugLocationTitle, style: theme.textTheme.titleMedium),
          const SizedBox(height: 6),
          Text(
            l10n.debugLocationBody,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _lat,
                  keyboardType: const TextInputType.numberWithOptions(
                    signed: true,
                    decimal: true,
                  ),
                  decoration: InputDecoration(
                    labelText: l10n.debugLocationLatitude,
                    errorText: _error,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: TextField(
                  controller: _lng,
                  keyboardType: const TextInputType.numberWithOptions(
                    signed: true,
                    decimal: true,
                  ),
                  decoration: InputDecoration(
                    labelText: l10n.debugLocationLongitude,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          FilledButton(
            onPressed: _apply,
            child: Text(l10n.debugLocationApply),
          ),
          if (active)
            TextButton(
              onPressed: _clear,
              child: Text(l10n.debugLocationClear),
            ),
        ],
      ),
    );
  }
}
