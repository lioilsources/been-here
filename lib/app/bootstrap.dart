import 'dart:async';

import 'package:been_here/core/logger.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

const _log = Logger('bootstrap');

/// Starts [app] with the bindings and error handling every entry point needs.
///
/// Errors are logged locally and nowhere else — the app ships no crash
/// reporter, because a stack trace from this app can carry place names.
Future<void> bootstrap(Widget Function() app) async {
  WidgetsFlutterBinding.ensureInitialized();

  Logger.minLevel = kReleaseMode ? LogLevel.warning : LogLevel.debug;

  FlutterError.onError = (details) {
    _log.error(
      details.exceptionAsString(),
      details.exception,
      details.stack,
    );
    FlutterError.presentError(details);
  };

  PlatformDispatcher.instance.onError = (error, stack) {
    _log.error('Uncaught async error', error, stack);
    return true;
  };

  runApp(app());
}
