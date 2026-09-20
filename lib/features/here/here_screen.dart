import 'package:been_here/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// The screen that matters: what did I photograph right here, and when.
///
/// Phase 0 renders the empty state only. Location, radius and the visit
/// timeline arrive in phase 2.
class HereScreen extends ConsumerWidget {
  const HereScreen({super.key, this.placeId});

  /// When set, show memories for this place instead of the current location
  /// (a notification tap lands here).
  final int? placeId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.hereTabLabel)),
      body: Center(
        child: EmptyState(
          icon: Icons.photo_library_outlined,
          title: l10n.hereNotIndexedTitle,
          body: l10n.hereNotIndexedBody,
        ),
      ),
    );
  }
}

/// Shared placeholder for "nothing to show, and here's why".
class EmptyState extends StatelessWidget {
  const EmptyState({
    required this.icon,
    required this.title,
    required this.body,
    super.key,
    this.action,
  });

  final IconData icon;
  final String title;
  final String body;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 48, color: theme.colorScheme.outline),
          const SizedBox(height: 20),
          Text(
            title,
            style: theme.textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            body,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
          if (action != null) ...[
            const SizedBox(height: 24),
            action!,
          ],
        ],
      ),
    );
  }
}
