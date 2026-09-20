import 'package:been_here/data/db/database.dart';
import 'package:been_here/data/db/tables.dart';
import 'package:drift/drift.dart';

part 'preferences_dao.g.dart';

@DriftAccessor(tables: [Preferences])
class PreferencesDao extends DatabaseAccessor<AppDatabase>
    with _$PreferencesDaoMixin {
  PreferencesDao(super.attachedDatabase);

  Future<Map<String, String>> readAll() async {
    final rows = await select(preferences).get();
    return {for (final row in rows) row.key: row.value};
  }

  Future<void> write(String key, String value) => into(preferences).insert(
    PreferencesCompanion.insert(key: key, value: value),
    mode: InsertMode.insertOrReplace,
  );

  Future<void> remove(String key) =>
      (delete(preferences)..where((p) => p.key.equals(key))).go();
}
