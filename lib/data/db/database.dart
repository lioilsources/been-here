import 'package:been_here/core/geo/geo_point.dart';
import 'package:been_here/core/geo/unit_vector.dart';
import 'package:been_here/data/db/daos/index_state_dao.dart';
import 'package:been_here/data/db/daos/memories_dao.dart';
import 'package:been_here/data/db/daos/photos_dao.dart';
import 'package:been_here/data/db/daos/places_dao.dart';
import 'package:been_here/data/db/daos/preferences_dao.dart';
import 'package:been_here/data/db/tables.dart';
// Used by the generated part file for the `mute` text enum column.
import 'package:been_here/domain/places/mute_state.dart';
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:meta/meta.dart' show visibleForTesting;

part 'database.g.dart';

@DriftDatabase(
  tables: [
    Photos,
    Places,
    PlaceCells,
    Rephotos,
    IndexState,
    ScanSeen,
    Preferences,
  ],
  daos: [
    PhotosDao,
    IndexStateDao,
    MemoriesDao,
    PlacesDao,
    PreferencesDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(driftDatabase(name: 'been_here'));

  /// For tests and benchmarks: an in-memory or temp-file database.
  ///
  /// The parameter is named `e` only to match drift's generated super
  /// constructor; it is positional, so callers never see the name.
  AppDatabase.withExecutor(super.e);

  @override
  int get schemaVersion => 5;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async {
      await m.createAll();
    },
    onUpgrade: (m, from, to) async {
      if (from < 2) {
        // Unit-sphere coordinates, so the radius query is arithmetic.
        await m.addColumn(photos, photos.x);
        await m.addColumn(photos, photos.y);
        await m.addColumn(photos, photos.z);
        await customStatement('DROP INDEX IF EXISTS photos_lat');
        await customStatement('DROP INDEX IF EXISTS photos_lng');
        await customStatement(
          'CREATE INDEX IF NOT EXISTS photos_lat_lng ON photos (lat, lng)',
        );
        await backfillUnitVectors();
      }
      if (from < 5 && from >= 3) {
        // Backfilled by the next clustering pass, which runs after every
        // indexing pass anyway.
        await m.addColumn(places, places.visitCount);
      }
      if (from < 4 && from >= 3) {
        await m.addColumn(places, places.userLabel);
        await m.addColumn(places, places.visitCount);
      }
      if (from < 3) {
        await m.createTable(placeCells);
        await m.createTable(preferences);
        await m.addColumn(places, places.userLabel);
        await m.addColumn(places, places.visitCount);
        await m.createIndex(
          Index(
            'place_cells_place',
            'CREATE INDEX IF NOT EXISTS place_cells_place '
                'ON place_cells (place_id)',
          ),
        );
      }
    },
    beforeOpen: (details) async {
      // Photos reference places; without this the ON DELETE actions on
      // those columns are silently ignored by SQLite.
      await customStatement('PRAGMA foreign_keys = ON');
    },
  );

  /// Fills in `x`/`y`/`z` for located photos that don't have them yet.
  ///
  /// Runs once, on upgrade. Paged so that a hundred thousand photos don't all
  /// have to exist in memory at the same time.
  @visibleForTesting
  Future<int> backfillUnitVectors({int batchSize = 5000}) async {
    var updated = 0;
    while (true) {
      final rows = await customSelect(
        'SELECT asset_id, lat, lng FROM photos '
        'WHERE lat IS NOT NULL AND lng IS NOT NULL AND x IS NULL '
        'LIMIT $batchSize',
      ).get();
      if (rows.isEmpty) return updated;

      await batch((b) {
        for (final row in rows) {
          final vector = UnitVector.of(
            GeoPoint(row.read<double>('lat'), row.read<double>('lng')),
          );
          b.update(
            photos,
            PhotosCompanion(
              x: Value(vector.x),
              y: Value(vector.y),
              z: Value(vector.z),
            ),
            where: (p) => p.assetId.equals(row.read<String>('asset_id')),
          );
        }
      });
      updated += rows.length;
    }
  }
}
