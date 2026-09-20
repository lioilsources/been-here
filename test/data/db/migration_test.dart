import 'dart:io';

import 'package:been_here/core/geo/bounding_box.dart';
import 'package:been_here/core/geo/geo_point.dart';
import 'package:been_here/core/geo/unit_vector.dart';
import 'package:been_here/data/db/database.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqlite3/sqlite3.dart';

/// The schema as version 1 shipped it: no unit-sphere columns, and one index
/// per coordinate.
const _schemaV1 = '''
CREATE TABLE photos (
  asset_id TEXT NOT NULL,
  lat REAL NULL,
  lng REAL NULL,
  taken_at INTEGER NOT NULL,
  geohash TEXT NULL,
  place_id INTEGER NULL,
  is_video INTEGER NOT NULL DEFAULT 0,
  width INTEGER NOT NULL,
  height INTEGER NOT NULL,
  indexed_at INTEGER NOT NULL,
  PRIMARY KEY (asset_id)
);
CREATE INDEX photos_lat ON photos (lat);
CREATE INDEX photos_lng ON photos (lng);
CREATE TABLE places (
  id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  center_lat REAL NOT NULL, center_lng REAL NOT NULL, radius_m REAL NOT NULL,
  photo_count INTEGER NOT NULL DEFAULT 0,
  distinct_days INTEGER NOT NULL DEFAULT 0,
  first_at INTEGER NOT NULL, last_at INTEGER NOT NULL,
  label TEXT NULL, mute TEXT NOT NULL DEFAULT 'none',
  last_notified_at INTEGER NULL
);
CREATE TABLE rephotos (
  id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  original_asset_id TEXT NOT NULL, new_asset_id TEXT NOT NULL,
  place_id INTEGER NULL, created_at INTEGER NOT NULL
);
CREATE TABLE index_state (
  key TEXT NOT NULL, value TEXT NOT NULL, PRIMARY KEY (key)
);
CREATE TABLE scan_seen (asset_id TEXT NOT NULL, PRIMARY KEY (asset_id));
''';

void main() {
  late Directory dir;
  late File file;

  setUp(() {
    dir = Directory.systemTemp.createTempSync('been_here_migration');
    file = File('${dir.path}/been_here.sqlite');
  });

  tearDown(() => dir.deleteSync(recursive: true));

  /// Writes a version 1 database holding [photos] as (id, lat, lng) triples.
  void writeV1(List<(String, double?, double?)> photos) {
    final raw = sqlite3.open(file.path)..execute(_schemaV1);
    for (final (id, lat, lng) in photos) {
      raw.execute(
        'INSERT INTO photos (asset_id, lat, lng, taken_at, width, height, '
        'indexed_at) VALUES (?, ?, ?, 1700000000, 4032, 3024, 0)',
        [id, lat, lng],
      );
    }
    raw
      ..execute('PRAGMA user_version = 1')
      ..close();
  }

  test('a version 1 database opens and keeps its rows', () async {
    writeV1([('kept', 50.0755, 14.4378)]);

    final db = AppDatabase.withExecutor(NativeDatabase(file));
    addTearDown(db.close);

    expect(await db.photosDao.count(), 1);
    expect((await db.photosDao.byId('kept'))!.lat, closeTo(50.0755, 1e-9));
  });

  test('the upgrade backfills unit vectors for located photos', () async {
    const prague = GeoPoint(50.0755, 14.4378);
    writeV1([
      ('located', prague.lat, prague.lng),
      ('no-gps', null, null),
    ]);

    final db = AppDatabase.withExecutor(NativeDatabase(file));
    addTearDown(db.close);

    final located = await db.photosDao.byId('located');
    final expected = UnitVector.of(prague);
    expect(located!.x, closeTo(expected.x, 1e-12));
    expect(located.y, closeTo(expected.y, 1e-12));
    expect(located.z, closeTo(expected.z, 1e-12));

    final missing = await db.photosDao.byId('no-gps');
    expect(missing!.x, isNull);
    expect(missing.y, isNull);
    expect(missing.z, isNull);
  });

  test('the upgraded database answers radius queries', () async {
    writeV1([
      ('near', 50.0755, 14.4378),
      ('far', 49.1951, 16.6068),
    ]);

    final db = AppDatabase.withExecutor(NativeDatabase(file));
    addTearDown(db.close);

    const prague = GeoPoint(50.0755, 14.4378);
    final here = await db.memoriesDao.countWithin(
      boxes: boundingBoxAround(prague, 1000).split(),
      center: UnitVector.of(prague),
      chordSquared: chordSquaredForRadius(1000),
    );
    expect(here, 1);
  });

  test(
    'the upgrade swaps the coordinate indexes for the composite one',
    () async {
      writeV1([('a', 1, 2)]);

      final db = AppDatabase.withExecutor(NativeDatabase(file));
      addTearDown(db.close);

      final rows = await db
          .customSelect("SELECT name FROM sqlite_master WHERE type = 'index'")
          .get();
      final names = rows.map((r) => r.read<String>('name')).toSet();

      expect(names, contains('photos_lat_lng'));
      expect(names, isNot(contains('photos_lat')));
      expect(names, isNot(contains('photos_lng')));
    },
  );

  test('backfilling twice is a no-op', () async {
    writeV1([('a', 10, 20), ('b', 11, 21)]);

    final db = AppDatabase.withExecutor(NativeDatabase(file));
    addTearDown(db.close);

    // Opening it already ran the migration.
    expect(await db.photosDao.count(), 2);
    expect(await db.backfillUnitVectors(), 0);
  });

  test('the upgrade adds the places and preferences tables', () async {
    writeV1([('a', 50.0755, 14.4378)]);

    final db = AppDatabase.withExecutor(NativeDatabase(file));
    addTearDown(db.close);

    // Reachable means created; a missing table throws here.
    expect(await db.placesDao.cellOwners(), isEmpty);
    expect(await db.preferencesDao.readAll(), isEmpty);

    await db.preferencesDao.write('auto_mute_days', '45');
    expect(await db.preferencesDao.readAll(), {'auto_mute_days': '45'});
  });

  test('a fresh database is created at the current version', () async {
    final db = AppDatabase.withExecutor(NativeDatabase(file));
    addTearDown(db.close);

    expect(await db.photosDao.count(), 0);
    final version = await db.customSelect('PRAGMA user_version').getSingle();
    expect(version.data.values.first, db.schemaVersion);
  });
}
