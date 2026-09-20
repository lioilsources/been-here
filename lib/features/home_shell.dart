import 'package:been_here/features/here/here_screen.dart';
import 'package:been_here/features/places/places_screen.dart';
import 'package:been_here/features/settings/settings_screen.dart';
import 'package:been_here/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';

/// The three screens, and the bar between them.
///
/// Here is first and stays first: the app is about the moment you arrive
/// somewhere, and everything else is support for that.
class HomeShell extends StatefulWidget {
  const HomeShell({super.key, this.placeId});

  /// Set when a notification opened the app at a particular place.
  final int? placeId;

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      body: IndexedStack(
        index: _index,
        children: [
          HereScreen(placeId: widget.placeId),
          const PlacesScreen(),
          const SettingsScreen(),
        ],
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
