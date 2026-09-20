import 'package:been_here/app/router.dart';
import 'package:been_here/app/theme.dart';
import 'package:been_here/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';

class BeenHereApp extends StatelessWidget {
  const BeenHereApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (context) => AppLocalizations.of(context).appTitle,
      theme: buildTheme(Brightness.light),
      darkTheme: buildTheme(Brightness.dark),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      navigatorKey: appNavigatorKey,
      initialRoute: AppRoutes.here,
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
