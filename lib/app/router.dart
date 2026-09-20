import 'package:been_here/features/home_shell.dart';
import 'package:flutter/material.dart';

/// Route names. Notifications deep-link into these, so they are part of the
/// app's contract with the system — keep them stable.
abstract final class AppRoutes {
  static const String here = '/';
  static const String places = '/places';
  static const String settings = '/settings';
}

/// Lets a notification tap navigate without a BuildContext.
final GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

abstract final class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.here:
        final args = settings.arguments;
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => HomeShell(
            placeId: args is HereScreenArgs ? args.placeId : null,
          ),
        );
      default:
        return null;
    }
  }
}

/// Arguments for [AppRoutes.here]. A null [placeId] means "wherever I am now".
@immutable
class HereScreenArgs {
  const HereScreenArgs({this.placeId});

  final int? placeId;
}
