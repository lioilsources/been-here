import 'dart:async';

import 'package:been_here/app/providers.dart';
import 'package:been_here/features/here/here_screen.dart';
import 'package:been_here/features/places/places_screen.dart';
import 'package:been_here/features/settings/settings_screen.dart';
import 'package:been_here/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// The three screens, and the bar between them.
///
/// Here is first and stays first: the app is about the moment you arrive
/// somewhere, and everything else is support for that.
class HomeShell extends ConsumerStatefulWidget {
  const HomeShell({super.key, this.placeId});

  /// Set when a notification opened the app at a particular place.
  final int? placeId;

  @override
  ConsumerState<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends ConsumerState<HomeShell> {
  int _index = 0;

  @override
  void initState() {
    super.initState();
    final placeId = widget.placeId;
    if (placeId != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) unawaited(openPlace(ref, placeId));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    // A tap on a notification, whenever it arrives, points the Here screen
    // at the place it was about and brings that screen forward.
    ref.listen(notificationTapsProvider, (_, next) {
      final placeId = next.value;
      if (placeId == null) return;
      unawaited(openPlace(ref, placeId));
      setState(() => _index = 0);
    });

    return Scaffold(
      body: IndexedStack(
        index: _index,
        children: const [HereScreen(), PlacesScreen(), SettingsScreen()],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (i) => setState(() => _index = i),
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.access_time_outlined),
            selectedIcon: const Icon(Icons.access_time_filled),
            label: l10n.hereTabLabel,
          ),
          NavigationDestination(
            icon: const Icon(Icons.place_outlined),
            selectedIcon: const Icon(Icons.place),
            label: l10n.placesTabLabel,
          ),
          NavigationDestination(
            icon: const Icon(Icons.settings_outlined),
            selectedIcon: const Icon(Icons.settings),
            label: l10n.settingsTabLabel,
          ),
        ],
      ),
    );
  }
}
