import 'package:been_here/data/db/daos/preferences_dao.dart';
import 'package:been_here/domain/memories/notification_rules.dart';
import 'package:been_here/domain/places/auto_mute.dart';
import 'package:meta/meta.dart';

/// Everything the user can change.
@immutable
class AppSettings {
  const AppSettings({
    this.autoMuteDays = defaultAutoMuteDays,
    this.placeNamesEnabled = false,
    this.memoryAgeDays = 182,
    this.placeCooldownDays = 30,
    this.dailyLimitHours = 24,
  });

  /// Distinct days after which a place is muted automatically.
  final int autoMuteDays;

  /// Whether places may be given names.
  ///
  /// Off by default, and the only thing in the app that can put data on the
  /// network: naming a place means handing its coordinates to the system
  /// geocoder, which is Apple's or Google's. Opt-in, never assumed.
  final bool placeNamesEnabled;

  /// How old the newest photo at a place must be before arriving there is
  /// worth mentioning.
  final int memoryAgeDays;

  /// How long a place stays quiet after it has spoken.
  final int placeCooldownDays;

  /// How long the whole app stays quiet after any notification.
  final int dailyLimitHours;

  /// The thresholds, as the rules want them.
  NotificationRules get notificationRules => NotificationRules(
    minimumAge: Duration(days: memoryAgeDays),
    placeCooldown: Duration(days: placeCooldownDays),
    globalCooldown: Duration(hours: dailyLimitHours),
  );

  AppSettings copyWith({
    int? autoMuteDays,
    bool? placeNamesEnabled,
    int? memoryAgeDays,
    int? placeCooldownDays,
    int? dailyLimitHours,
  }) => AppSettings(
    autoMuteDays: autoMuteDays ?? this.autoMuteDays,
    placeNamesEnabled: placeNamesEnabled ?? this.placeNamesEnabled,
    memoryAgeDays: memoryAgeDays ?? this.memoryAgeDays,
    placeCooldownDays: placeCooldownDays ?? this.placeCooldownDays,
    dailyLimitHours: dailyLimitHours ?? this.dailyLimitHours,
  );

  @override
  bool operator ==(Object other) =>
      other is AppSettings &&
      other.autoMuteDays == autoMuteDays &&
      other.placeNamesEnabled == placeNamesEnabled &&
      other.memoryAgeDays == memoryAgeDays &&
      other.placeCooldownDays == placeCooldownDays &&
      other.dailyLimitHours == dailyLimitHours;

  @override
  int get hashCode => Object.hash(
    autoMuteDays,
    placeNamesEnabled,
    memoryAgeDays,
    placeCooldownDays,
    dailyLimitHours,
  );

  @override
  String toString() =>
      'AppSettings(autoMuteDays: $autoMuteDays, '
      'placeNames: $placeNamesEnabled)';
}

/// Reads and writes [AppSettings]. Keys are stable strings; they outlive app
/// versions.
class SettingsStore {
  const SettingsStore(this.dao);

  static const String _autoMuteDays = 'auto_mute_days';
  static const String _placeNames = 'place_names_enabled';
  static const String _memoryAge = 'memory_age_days';
  static const String _placeCooldown = 'place_cooldown_days';
  static const String _dailyLimit = 'daily_limit_hours';

  final PreferencesDao dao;

  Future<AppSettings> read() async {
    final values = await dao.readAll();
    const defaults = AppSettings();
    return AppSettings(
      autoMuteDays:
          int.tryParse(values[_autoMuteDays] ?? '') ?? defaultAutoMuteDays,
      placeNamesEnabled: values[_placeNames] == 'true',
      memoryAgeDays:
          int.tryParse(values[_memoryAge] ?? '') ?? defaults.memoryAgeDays,
      placeCooldownDays:
          int.tryParse(values[_placeCooldown] ?? '') ??
          defaults.placeCooldownDays,
      dailyLimitHours:
          int.tryParse(values[_dailyLimit] ?? '') ?? defaults.dailyLimitHours,
    );
  }

  Future<void> setAutoMuteDays(int days) =>
      dao.write(_autoMuteDays, '${days.clamp(1, 3650)}');

  Future<void> setPlaceNamesEnabled({required bool enabled}) =>
      dao.write(_placeNames, '$enabled');

  Future<void> setMemoryAgeDays(int days) =>
      dao.write(_memoryAge, '${days.clamp(1, 3650)}');

  Future<void> setPlaceCooldownDays(int days) =>
      dao.write(_placeCooldown, '${days.clamp(0, 365)}');

  Future<void> setDailyLimitHours(int hours) =>
      dao.write(_dailyLimit, '${hours.clamp(0, 168)}');
}
