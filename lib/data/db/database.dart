import 'package:been_here/data/db/daos/index_state_dao.dart';
import 'package:been_here/data/db/daos/photos_dao.dart';
import 'package:been_here/data/db/tables.dart';
// Used by the generated part file for the `mute` text enum column.
import 'package:been_here/domain/places/mute_state.dart';
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'database.g.dart';

@DriftDatabase(
  tables: [Photos, Places, Rephotos, IndexState, ScanSeen],
  daos: [PhotosDao, IndexStateDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(driftDatabase(name: 'been_here'));

  /// For tests and benchmarks: an in-memory or temp-file database.
  ///
  /// The parameter is named `e` only to match drift's generated super
  /// constructor; it is positional, so callers never see the name.
  AppDatabase.withExecutor(super.e);

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async {
      await m.createAll();
    },
    beforeOpen: (details) async {
      // Photos reference places; without this the ON DELETE actions on
      // those columns are silently ignored by SQLite.
      await customStatement('PRAGMA foreign_keys = ON');
    },
  );
}
