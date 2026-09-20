import 'package:been_here/core/geo/geo_point.dart';
import 'package:been_here/core/geo/geohash.dart';
import 'package:been_here/data/db/daos/index_state_dao.dart';
import 'package:been_here/data/db/database.dart';
import 'package:been_here/data/photos/fake_photo_library.dart';
import 'package:been_here/data/photos/fixtures.dart';
import 'package:been_here/data/photos/photo_library.dart';
import 'package:been_here/domain/indexing/index_progress.dart';
import 'package:been_here/domain/indexing/indexer_service.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AppDatabase db;
  late FakePhotoLibrary library;
  late IndexerService indexer;
  late List<IndexProgress> emitted;

  final clock = DateTime.utc(2026, 9, 20, 12);

  void build(
    List<PhotoAsset> assets, {
    int batchSize = 400,
    PhotoPermission permission = PhotoPermission.authorized,
    bool locationsOnlyViaResolve = false,
  }) {
    db = AppDatabase.withExecutor(NativeDatabase.memory());
    library = FakePhotoLibrary(
      assets: assets,
      permission: permission,
      locationsOnlyViaResolve: locationsOnlyViaResolve,
    );
    indexer = IndexerService(
      library: library,
      photos: db.photosDao,
      state: db.indexStateDao,
      batchSize: batchSize,
      clock: () => clock,
    );
    emitted = [];
    indexer.progress.listen(emitted.add);
  }

  tearDown(() async {
    await indexer.dispose();
    await library.dispose();
    await db.close();
  });

  group('full scan of the 50k fixture', () {
    late LibraryFixture fixture;

    setUp(() {
      fixture = generateLibraryFixture();
      build(fixture.assets);
    });

    test('indexes every image exactly once and no video', () async {
      final result = await indexer.run();

      expect(result.status, IndexStatus.completed);
      expect(result.total, 50000);
      expect(result.processed, 50000);
      expect(result.inserted, 50000);
      expect(result.deleted, 0);

      expect(await db.photosDao.count(), 50000);

      final videoIds = fixture.assets
          .where((a) => a.isVideo)
          .map((a) => a.id)
          .toSet();
      final rows = await db.photosDao.all();
      expect(rows.any((r) => videoIds.contains(r.assetId)), isFalse);
      expect(rows.any((r) => r.isVideo), isFalse);
    });

    test('keeps photos without GPS, with null coordinates', () async {
      await indexer.run();

      final expectedLocated = fixture.locatedImages.length;
      expect(await db.photosDao.countWithLocation(), expectedLocated);
      expect(await db.photosDao.count(), greaterThan(expectedLocated));
    });

    test('geohashes every located photo and nothing else', () async {
      await indexer.run();

      for (final row in await db.photosDao.all()) {
        if (row.lat == null || row.lng == null) {
          expect(row.geohash, isNull, reason: row.assetId);
          continue;
        }
        expect(
          row.geohash,
          encodeGeohash(GeoPoint(row.lat!, row.lng!)),
          reason: row.assetId,
        );
        expect(row.geohash, hasLength(placeGeohashPrecision));
      }
    });

    test('reports progress that only ever moves forward', () async {
      await indexer.run();
      // The final event is added as the run returns, so let the broadcast
      // stream deliver it before looking.
      await pumpEventQueue();

      final running = emitted.where((p) => p.isRunning).toList();
      expect(running.length, greaterThan(10));
      for (var i = 1; i < running.length; i++) {
        expect(
          running[i].processed,
          greaterThanOrEqualTo(running[i - 1].processed),
        );
        expect(running[i].total, 50000);
      }
      expect(emitted.last.status, IndexStatus.completed);
      expect(emitted.last.fraction, 1.0);
    });

    test('a second pass inserts nothing', () async {
      await indexer.run();
      final again = await indexer.run();

      expect(again.status, IndexStatus.completed);
      expect(again.inserted, 0);
      expect(again.deleted, 0);
      expect(await db.photosDao.count(), 50000);
    });

    test('stamps the index state when it finishes', () async {
      await indexer.run();

      final stamp = clock.millisecondsSinceEpoch ~/ 1000;
      expect(await db.indexStateDao.readInt(IndexStateKeys.lastSync), stamp);
      expect(
        await db.indexStateDao.readInt(IndexStateKeys.lastFullScan),
        stamp,
      );
      expect(
        await db.indexStateDao.readInt(IndexStateKeys.scanCursor),
        isNull,
      );
      expect(await db.photosDao.seenCount(), 0);
    });
  });

  group('incremental sync', () {
    late LibraryFixture fixture;

    setUp(() {
      fixture = generateLibraryFixture(photoCount: 2000);
      build(fixture.assets, batchSize: 100);
    });

    test('picks up photos added after the first pass', () async {
      await indexer.run();
      expect(await db.photosDao.count(), 2000);

      library.addAll([
        PhotoAsset(
          id: 'brand-new',
          lat: 50.0755,
          lng: 14.4378,
          takenAt: DateTime.utc(2026, 9, 19),
          width: 4032,
          height: 3024,
        ),
      ]);

      final result = await indexer.run();
      expect(result.inserted, 1);
      expect(result.deleted, 0);
      expect(await db.photosDao.count(), 2001);
      expect(await db.photosDao.byId('brand-new'), isNotNull);
    });

    test('drops photos deleted from the library', () async {
      await indexer.run();
      final victims = (await db.photosDao.all())
          .take(5)
          .map((r) => r.assetId)
          .toSet();

      library.removeIds(victims);
      final result = await indexer.run();

      expect(result.deleted, 5);
      expect(await db.photosDao.count(), 1995);
      for (final id in victims) {
        expect(await db.photosDao.byId(id), isNull);
      }
    });

    test('handles an add and a delete in the same pass', () async {
      await indexer.run();
      final victim = (await db.photosDao.all()).first.assetId;

      library
        ..removeIds({victim})
        ..addAll([
          PhotoAsset(
            id: 'replacement',
            lat: 48.2,
            lng: 16.3,
            takenAt: DateTime.utc(2025, 5),
            width: 100,
            height: 100,
          ),
        ]);

      final result = await indexer.run();
      expect(result.inserted, 1);
      expect(result.deleted, 1);
      expect(await db.photosDao.count(), 2000);
      expect(await db.photosDao.byId(victim), isNull);
      expect(await db.photosDao.byId('replacement'), isNotNull);
    });

    test('an emptied library empties the index', () async {
      await indexer.run();
      library.removeWhere((_) => true);

      final result = await indexer.run();
      expect(result.status, IndexStatus.completed);
      expect(await db.photosDao.count(), 0);
    });
  });

  group('interruption', () {
    setUp(() {
      final fixture = generateLibraryFixture(photoCount: 1000);
      build(fixture.assets, batchSize: 100);
    });

    test('a failed pass keeps what it managed to index', () async {
      library.failAfterPages = 3;

      final result = await indexer.run();

      expect(result.status, IndexStatus.failed);
      expect(result.errorCode, isNotNull);
      expect(await db.photosDao.count(), 300);
      expect(
        await db.indexStateDao.readInt(IndexStateKeys.scanCursor),
        300,
      );
    });

    test('a failed pass does not delete anything', () async {
      await indexer.run();
      expect(await db.photosDao.count(), 1000);

      library
        ..pageCalls = 0
        ..failAfterPages = 2;
      final result = await indexer.run();

      expect(result.status, IndexStatus.failed);
      // The deletion sweep must never run on a partial view of the library.
      expect(await db.photosDao.count(), 1000);
    });

    test('the next run resumes instead of starting over', () async {
      library.failAfterPages = 3;
      await indexer.run();

      library
        ..failAfterPages = null
        ..pageCalls = 0;
      final result = await indexer.run();

      expect(result.status, IndexStatus.completed);
      expect(await db.photosDao.count(), 1000);
      // 1000 assets, 100 per page, 300 already done -> 7 pages, not 10.
      expect(library.pageCalls, 7);
    });

    test('restart walks the whole library again', () async {
      library.failAfterPages = 3;
      await indexer.run();

      library
        ..failAfterPages = null
        ..pageCalls = 0;
      final result = await indexer.run(restart: true);

      expect(result.status, IndexStatus.completed);
      expect(library.pageCalls, 10);
      expect(result.inserted, 700);
      expect(await db.photosDao.count(), 1000);
    });

    test('a library that changed size restarts the pass', () async {
      library.failAfterPages = 3;
      await indexer.run();

      library
        ..failAfterPages = null
        ..addAll([
          PhotoAsset(
            id: 'extra',
            takenAt: DateTime.utc(2026),
            width: 1,
            height: 1,
          ),
        ])
        ..pageCalls = 0;

      final result = await indexer.run();
      expect(result.status, IndexStatus.completed);
      expect(library.pageCalls, 11);
      expect(await db.photosDao.count(), 1001);
    });

    test('cancel stops after the current batch and keeps the cursor', () async {
      final run = indexer.run();
      indexer.cancel();
      final result = await run;

      expect(result.status, IndexStatus.cancelled);
      expect(result.processed, lessThan(1000));
      expect(
        await db.indexStateDao.readInt(IndexStateKeys.scanCursor),
        result.processed,
      );

      final finished = await indexer.run();
      expect(finished.status, IndexStatus.completed);
      expect(await db.photosDao.count(), 1000);
    });

    test('concurrent runs join the one in flight', () async {
      final a = indexer.run();
      final b = indexer.run();
      expect(await a, await b);
      expect(await db.photosDao.count(), 1000);
    });
  });

  group('permission', () {
    test('denied indexes nothing', () async {
      final fixture = generateLibraryFixture(photoCount: 100);
      build(fixture.assets, permission: PhotoPermission.denied);

      final result = await indexer.run();

      expect(result.status, IndexStatus.permissionDenied);
      expect(await db.photosDao.count(), 0);
    });

    test('restricted indexes nothing', () async {
      final fixture = generateLibraryFixture(photoCount: 100);
      build(fixture.assets, permission: PhotoPermission.restricted);

      expect(
        (await indexer.run()).status,
        IndexStatus.permissionDenied,
      );
    });

    test('limited access still indexes what it can see', () async {
      final fixture = generateLibraryFixture(photoCount: 100);
      build(fixture.assets, permission: PhotoPermission.limited);

      final result = await indexer.run();

      expect(result.status, IndexStatus.completed);
      expect(await db.photosDao.count(), 100);
    });
  });

  group('android-style location reads', () {
    setUp(() {
      final fixture = generateLibraryFixture(photoCount: 500);
      build(fixture.assets, batchSize: 100, locationsOnlyViaResolve: true);
    });

    test(
      'falls back to the per-asset read and still gets coordinates',
      () async {
        await indexer.run();

        expect(await db.photosDao.count(), 500);
        expect(await db.photosDao.countWithLocation(), greaterThan(300));
        expect(library.resolveLocationCalls, 500);
      },
    );

    test('does not pay for the expensive read twice', () async {
      await indexer.run();
      library.resolveLocationCalls = 0;

      final again = await indexer.run();

      expect(again.inserted, 0);
      // Every asset was already indexed, so nothing needed resolving.
      expect(library.resolveLocationCalls, 0);
    });
  });

  group('edge cases', () {
    test('an empty library completes cleanly', () async {
      build([]);

      final result = await indexer.run();

      expect(result.status, IndexStatus.completed);
      expect(result.total, 0);
      expect(result.fraction, 0);
      expect(await db.photosDao.count(), 0);
    });

    test('a library of videos only indexes nothing', () async {
      build([
        PhotoAsset(
          id: 'v1',
          takenAt: DateTime.utc(2024),
          width: 1,
          height: 1,
          isVideo: true,
        ),
      ]);

      final result = await indexer.run();
      expect(result.status, IndexStatus.completed);
      expect(await db.photosDao.count(), 0);
    });

    test('photos at exactly (0, 0) are indexed without a location', () async {
      build([
        PhotoAsset(
          id: 'null-island',
          lat: 0,
          lng: 0,
          takenAt: DateTime.utc(2024),
          width: 1,
          height: 1,
        ),
      ]);

      await indexer.run();

      final row = await db.photosDao.byId('null-island');
      expect(row, isNotNull);
      expect(row!.lat, isNull);
      expect(row.geohash, isNull);
    });

    test('takenAt round-trips as unix seconds UTC', () async {
      final takenAt = DateTime.utc(2019, 7, 4, 18, 30, 15);
      build([
        PhotoAsset(
          id: 'timed',
          takenAt: takenAt,
          width: 1,
          height: 1,
        ),
      ]);

      await indexer.run();

      final row = await db.photosDao.byId('timed');
      expect(row!.takenAt, takenAt.millisecondsSinceEpoch ~/ 1000);
      expect(row.indexedAt, clock.millisecondsSinceEpoch ~/ 1000);
    });
  });

  group('performance', () {
    test(
      'a 50k first scan stays well under a minute',
      tags: [
        'performance',
      ],
      () async {
        final fixture = generateLibraryFixture();
        build(fixture.assets, batchSize: 500);

        final stopwatch = Stopwatch()..start();
        final result = await indexer.run();
        stopwatch.stop();

        expect(result.status, IndexStatus.completed);
        expect(
          stopwatch.elapsed,
          lessThan(const Duration(seconds: 60)),
          reason: 'first scan took ${stopwatch.elapsed}',
        );
      },
    );
  });
}
