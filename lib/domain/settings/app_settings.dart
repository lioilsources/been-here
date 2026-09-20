import 'package:been_here/data/db/daos/preferences_dao.dart';
import 'package:been_here/domain/places/auto_mute.dart';
import 'package:meta/meta.dart';

/// Everything the user can change.
@immutable
class AppSettings {
  const AppSettings({
    this.autoMuteDays = defaultAutoMuteDays,
    this.placeNamesEnabled = false,
  });

  /// Distinct days after which a place is muted automatically.
  final int autoMuteDays;

  /// Whether places may be given names.
  ///
  /// Off by default, and the only thing in the app that can put data on the
  /// network: naming a place means handing its coordinates to the system
  /// geocoder, which is Apple's or Google's. Opt-in, never assumed.
  final bool placeNamesEnabled;

  AppSettings copyWith({int? autoMuteDays, bool? placeNamesEnabled}) =>
      AppSettings(
        autoMuteDays: autoMuteDays ?? this.autoMuteDays,
        placeNamesEnabled: placeNamesEnabled ?? this.placeNamesEnabled,
      );

  @override
  bool operator ==(Object other) =>
      other is AppSettings &&
      other.autoMuteDays == autoMuteDays &&
      other.placeNamesEnabled == placeNamesEnabled;

  @override
  int get hashCode => Object.hash(autoMuteDays, placeNamesEnabled);

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

  final PreferencesDao dao;

  Future<AppSettings> read() async {
    final values = await dao.readAll();
    return AppSettings(
      autoMuteDays:
          int.tryParse(values[_autoMuteDays] ?? '') ?? defaultAutoMuteDays,
      placeNamesEnabled: values[_placeNames] == 'true',
    );
  }

  Future<void> setAutoMuteDays(int days) =>
      dao.write(_autoMuteDays, '${days.clamp(1, 3650)}');

  Future<void> setPlaceNamesEnabled({required bool enabled}) =>
      dao.write(_placeNames, '$enabled');
}
