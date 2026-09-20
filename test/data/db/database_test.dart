import 'package:been_here/data/db/database.dart';
import 'package:been_here/domain/places/mute_state.dart';
// drift exports an `isNull` expression helper that collides with matcher's.
import 'package:drift/drift.dart' hide isNull;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AppDatabase db;

  setUp(() {
    db = AppDatabase.withExecutor(NativeDatabase.memory());
  });

  tearDown(() => db.close());

  Future<int> insertPlace({MuteState mute = MuteState.none}) => db
      .into(db.places)
      .insert(
        PlacesCompanion.insert(
          centerLat: 50.0755,
          centerLng: 14.4378,
          radiusM: 150,
          firstAt: 1600000000,
          lastAt: 1700000000,
          mute: Value(mute),
        ),
      );

  Future<void> insertPhoto(String id, {int? placeId}) => db
      .into(db.photos)
      .insert(
        PhotosCompanion.insert(
          assetId: id,
          takenAt: 1700000000,
          width: 4032,
          height: 3024,
          indexedAt: 1700000100,
          placeId: Value(placeId),
        ),
      );

  test('schema is created and empty', () async {
    expect(await db.select(db.photos).get(), isEmpty);
    expect(await db.select(db.places).get(), isEmpty);
    expect(await db.select(db.rephotos).get(), isEmpty);
    expect(await db.select(db.indexState).get(), isEmpty);
  });

  test('a photo round-trips', () async {
    await insertPhoto('asset-1');
    final row = await db.select(db.photos).getSingle();
    expect(row.assetId, 'asset-1');
    expect(row.lat, isNull);
    expect(row.isVideo, isFalse);
  });

  test('asset_id is the primary key, so reindexing cannot duplicate', () async {
    await insertPhoto('asset-1');
    expect(
      () => insertPhoto('asset-1'),
      throwsA(isA<SqliteException>()),
    );
    await db
        .into(db.photos)
        .insert(
          PhotosCompanion.insert(
            assetId: 'asset-1',
            takenAt: 1700000999,
            width: 1,
            height: 1,
            indexedAt: 1700000999,
          ),
          mode: InsertMode.insertOrReplace,
        );
    expect(await db.select(db.photos).get(), hasLength(1));
  });

  test('mute state round-trips through its text column', () async {
    final id = await insertPlace(mute: MuteState.userUnmuted);
    final place = await (db.select(
      db.places,
    )..where((p) => p.id.equals(id))).getSingle();
    expect(place.mute, MuteState.userUnmuted);
    expect(place.mute.isMuted, isFalse);
    expect(place.mute.isUserDecision, isTrue);
  });

  test('mute defaults to none', () async {
    final id = await db
        .into(db.places)
        .insert(
          PlacesCompanion.insert(
            centerLat: 1,
            centerLng: 2,
            radiusM: 100,
            firstAt: 0,
            lastAt: 0,
          ),
        );
    final place = await (db.select(
      db.places,
    )..where((p) => p.id.equals(id))).getSingle();
    expect(place.mute, MuteState.none);
  });

  test('deleting a place detaches its photos instead of losing them', () async {
    final placeId = await insertPlace();
    await insertPhoto('asset-1', placeId: placeId);

    await (db.delete(db.places)..where((p) => p.id.equals(placeId))).go();

    final row = await db.select(db.photos).getSingle();
    expect(row.assetId, 'asset-1');
    expect(row.placeId, isNull);
  });

  test('index_state is a key/value store', () async {
    await db
        .into(db.indexState)
        .insert(
          IndexStateCompanion.insert(key: 'last_full_scan', value: '12345'),
          mode: InsertMode.insertOrReplace,
        );
    await db
        .into(db.indexState)
        .insert(
          IndexStateCompanion.insert(key: 'last_full_scan', value: '67890'),
          mode: InsertMode.insertOrReplace,
        );
    final rows = await db.select(db.indexState).get();
    expect(rows, hasLength(1));
    expect(rows.single.value, '67890');
  });

  test('declared indexes exist', () async {
    final rows = await db
        .customSelect("SELECT name FROM sqlite_master WHERE type = 'index'")
        .get();
    final names = rows.map((r) => r.read<String>('name')).toSet();
    expect(
      names,
      containsAll([
        'photos_lat',
        'photos_lng',
        'photos_geohash',
        'photos_place_taken',
        'photos_taken_at',
        'places_center',
        'rephotos_original',
      ]),
    );
  });
}
