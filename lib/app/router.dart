import 'package:been_here/app/providers.dart';
import 'package:been_here/features/home_shell.dart';
import 'package:been_here/features/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
          builder: (_) => _Entry(
            placeId: args is HereScreenArgs ? args.placeId : null,
          ),
        );
      default:
        return null;
    }
  }
}

/// The intro, until it has been through once; the app after that.
///
/// It sits at the route rather than inside [HomeShell] so that the three
/// tabs are never built behind the introduction — the Here screen would
/// start asking for location the moment it was.
class _Entry extends ConsumerWidget {
  const _Entry({this.placeId});

  final int? placeId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsProvider);

    // One frame of nothing rather than a flash of the wrong screen: the
    // preferences read is a single query and lands immediately.
    return switch (settings.value?.onboardingSeen) {
      null => const Scaffold(body: SizedBox.shrink()),
      false => const OnboardingScreen(),
      true => HomeShell(placeId: placeId),
    };
  }
}

/// Arguments for [AppRoutes.here]. A null [placeId] means "wherever I am now".
@immutable
class HereScreenArgs {
  const HereScreenArgs({this.placeId});

  final int? placeId;
}
