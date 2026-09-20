import 'dart:developer' as developer;

enum LogLevel {
  debug(500),
  info(800),
  warning(900),
  error(1000);

  const LogLevel(this.value);

  final int value;
}

/// Minimal leveled logger.
///
/// Deliberately not a package: the app ships no analytics and nothing here may
/// ever leave the device, so a thin wrapper over `dart:developer` is enough.
class Logger {
  const Logger(this.name);

  final String name;

  /// Messages below this level are dropped. Raise it in release builds.
  static LogLevel minLevel = LogLevel.debug;

  void debug(String message) => _log(LogLevel.debug, message);

  void info(String message) => _log(LogLevel.info, message);

  void warning(String message, [Object? error]) =>
      _log(LogLevel.warning, message, error);

  void error(String message, [Object? error, StackTrace? stackTrace]) =>
      _log(LogLevel.error, message, error, stackTrace);

  void _log(
    LogLevel level,
    String message, [
    Object? error,
    StackTrace? stackTrace,
  ]) {
    if (level.value < minLevel.value) return;
    developer.log(
      message,
      name: name,
      level: level.value,
      error: error,
      stackTrace: stackTrace,
    );
  }
}
