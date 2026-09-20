import 'dart:typed_data';

import 'package:been_here/core/geo/geo_point.dart';
import 'package:been_here/data/db/database.dart';
import 'package:been_here/data/photos/fake_photo_library.dart';
import 'package:been_here/domain/rephoto/rephoto_service.dart';
import 'package:drift/drift.dart' hide isNotNull, isNull;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

const _prague = GeoPoint(50.0755, 14.4378);
final _now = DateTime.utc(2026, 9, 20, 14, 30);

void main() {
  late AppDatabase db;
  late FakePhotoLibrary library;
  late RephotoService service;

  setUp(() {
    db = AppDatabase.withExecutor(NativeDatabase.memory());
    library = FakePhotoLibrary();
    service = RephotoService(
      library: library,
      rephotos: db.rephotosDao,
      clock: () => _now,
    );
  });

  tearDown(() async {
    await library.dispose();
    await db.close();
  });

  final bytes = Uint8List.fromList([1, 2, 3]);

  test('saves to the library and remembers which photo it answers', () async {
    final placeId = await _place(db);

    final outcome = await service.save(
      bytes,
      originalAssetId: 'old-1',
      at: _prague,
      placeId: placeId,
    );

    expect(outcome, RephotoOutcome.saved);
    expect(library.saved, hasLength(1));
    expect(library.saved.single.at, _prague);

    final row = await service.latestFor('old-1');
    expect(row, isNotNull);
    expect(row!.originalAssetId, 'old-1');
    expect(row.newAssetId, 'saved-1');
    expect(row.placeId, placeId);
  });

  test('the new photo carries the coordinates of the old one', () async {
    await service.save(bytes, originalAssetId: 'old-1', at: _prague);

    // Saved with the location of the photo it answers, so it lands in the
    // same place the next time the index is built.
    final indexed = await library.page(offset: 0, limit: 100);
    final rephoto = indexed.firstWhere((a) => a.id == 'saved-1');
    expect(rephoto.lat, _prague.lat);
    expect(rephoto.lng, _prague.lng);
    expect(rephoto.takenAt, _now);
  });

  test('a library that refuses the save records nothing', () async {
    library.refuseSaves = true;

    final outcome = await service.save(bytes, originalAssetId: 'old-1');

    expect(outcome, RephotoOutcome.couldNotSave);
    expect(await service.latestFor('old-1'), isNull);
    expect(await db.rephotosDao.count(), 0);
  });

  test('latestFor returns the newest of several answers', () async {
    await service.save(bytes, originalAssetId: 'old-1');

    final later = RephotoService(
      library: library,
      rephotos: db.rephotosDao,
      clock: () => _now.add(const Duration(days: 365)),
    );
    await later.save(bytes, originalAssetId: 'old-1');

    final row = await service.latestFor('old-1');
    expect(row!.newAssetId, 'saved-2');
    expect(await db.rephotosDao.count(), 2);
  });

  test('photos with no answer have none', () async {
    await service.save(bytes, originalAssetId: 'old-1');
    expect(await service.latestFor('old-2'), isNull);
  });

  test('a rephoto outlives the place it was taken at', () async {
    final placeId = await _place(db);
    await service.save(bytes, originalAssetId: 'old-1', placeId: placeId);

    // Clustering rebuilds places from scratch, so the one this rephoto was
    // taken at can disappear. The pair itself must not go with it.
    await (db.delete(db.places)..where((p) => p.id.equals(placeId))).go();

    final row = await service.latestFor('old-1');
    expect(row, isNotNull);
    expect(row!.placeId, isNull);
  });
}

Future<int> _place(AppDatabase db) => db
    .into(db.places)
    .insert(
      PlacesCompanion.insert(
        centerLat: _prague.lat,
        centerLng: _prague.lng,
        radiusM: 120,
        firstAt: 1000,
        lastAt: 2000,
      ),
    );
