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
    this.mapEnabled = false,
    this.onboardingSeen = false,
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

  /// Whether places may be shown on a map.
  ///
  /// Off by default for the same reason place names are: map tiles come from
  /// a server, and the stream of requests is a running account of where you
  /// are looking, street by street. Unlike a name, which is asked once per
  /// place, this continues for as long as the map is open.
  final bool mapEnabled;

  /// Whether the three intro screens have been through once.
  ///
  /// Lives with the settings because it is one more thing the preferences
  /// table already knows how to keep, and because the user can ask to see
  /// the intro again.
  final bool onboardingSeen;

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
    bool? mapEnabled,
    bool? onboardingSeen,
  }) => AppSettings(
    autoMuteDays: autoMuteDays ?? this.autoMuteDays,
    placeNamesEnabled: placeNamesEnabled ?? this.placeNamesEnabled,
    memoryAgeDays: memoryAgeDays ?? this.memoryAgeDays,
    placeCooldownDays: placeCooldownDays ?? this.placeCooldownDays,
    dailyLimitHours: dailyLimitHours ?? this.dailyLimitHours,
    mapEnabled: mapEnabled ?? this.mapEnabled,
    onboardingSeen: onboardingSeen ?? this.onboardingSeen,
  );

  @override
  bool operator ==(Object other) =>
      other is AppSettings &&
      other.autoMuteDays == autoMuteDays &&
      other.placeNamesEnabled == placeNamesEnabled &&
      other.memoryAgeDays == memoryAgeDays &&
      other.placeCooldownDays == placeCooldownDays &&
      other.dailyLimitHours == dailyLimitHours &&
      other.mapEnabled == mapEnabled &&
      other.onboardingSeen == onboardingSeen;

  @override
  int get hashCode => Object.hash(
    autoMuteDays,
    placeNamesEnabled,
    memoryAgeDays,
    placeCooldownDays,
    dailyLimitHours,
    mapEnabled,
    onboardingSeen,
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
  static const String _map = 'map_enabled';
  static const String _onboarding = 'onboarding_seen';

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
      mapEnabled: values[_map] == 'true',
      onboardingSeen: values[_onboarding] == 'true',
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

  Future<void> setMapEnabled({required bool enabled}) =>
      dao.write(_map, '$enabled');

  Future<void> setOnboardingSeen({required bool seen}) =>
      dao.write(_onboarding, '$seen');
}
