import 'package:been_here/core/geo/geo_point.dart';
import 'package:been_here/core/geo/haversine.dart';
import 'package:been_here/data/db/database.dart';
import 'package:been_here/data/photos/fake_photo_library.dart';
import 'package:been_here/data/photos/fixtures.dart';
import 'package:been_here/data/photos/photo_library.dart';
import 'package:been_here/domain/indexing/indexer_service.dart';
import 'package:been_here/domain/places/mute_state.dart';
import 'package:been_here/domain/places/places_service.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AppDatabase db;
  late FakePhotoLibrary library;
  late IndexerService indexer;
  late PlacesService places;

  Future<void> build(List<PhotoAsset> assets, {int autoMuteDays = 30}) async {
    db = AppDatabase.withExecutor(NativeDatabase.memory());
    library = FakePhotoLibrary(assets: assets);
    indexer = IndexerService(
      library: library,
      photos: db.photosDao,
      state: db.indexStateDao,
      batchSize: 1000,
    );
    places = PlacesService(dao: db.placesDao, autoMuteDays: autoMuteDays);
    await indexer.run();
  }

  tearDown(() async {
    await indexer.dispose();
    await library.dispose();
    await db.close();
  });

  /// The place whose centre is closest to [target], if it is within 600 m.
  Future<PlaceRow?> placeNear(GeoPoint target) async {
    PlaceRow? best;
    var bestDistance = double.infinity;
    for (final place in await db.placesDao.all()) {
      final distance = distanceMeters(
        target,
        GeoPoint(place.centerLat, place.centerLng),
      );
      if (distance < bestDistance) {
        bestDistance = distance;
        best = place;
      }
    }
    return bestDistance <= 600 ? best : null;
  }

  group('the 50k fixture', () {
    late LibraryFixture fixture;

    setUp(() async {
      fixture = generateLibraryFixture();
      await build(fixture.assets);
      await places.recompute();
    });

    test('finds places', () async {
      expect(await db.placesDao.count(), greaterThan(40));
    });

    test('auto-mutes home', () async {
      final home = await placeNear(fixture.home);

      expect(home, isNotNull, reason: 'no place found at the home cluster');
      expect(home!.distinctDays, greaterThan(500));
      expect(home.mute, MuteState.auto);
      expect(home.mute.isMuted, isTrue);
    });

    test('auto-mutes work', () async {
      final work = await placeNear(fixture.work);

      expect(work, isNotNull, reason: 'no place found at the work cluster');
      expect(work!.distinctDays, greaterThan(300));
      expect(work.mute, MuteState.auto);
    });

    test('leaves trip places alone', () async {
      var checked = 0;
      for (final trip in fixture.tripPlaces) {
        final place = await placeNear(trip);
        if (place == null) continue;
        checked++;
        expect(
          place.mute,
          MuteState.none,
          reason:
              'trip place at $trip was muted with '
              '${place.distinctDays} distinct days',
        );
        expect(place.distinctDays, lessThan(30));
      }
      expect(checked, greaterThan(20), reason: 'too few trip places found');
    });

    test('only the everyday places are muted', () async {
      final muted = (await db.placesDao.all())
          .where((p) => p.mute.isMuted)
          .toList();

      // Home and work, and nothing else in a library like this.
      expect(muted, hasLength(2));
    });

    test('every located photo belongs to a place', () async {
      final unassigned = await db
          .customSelect(
            'SELECT COUNT(*) AS c FROM photos '
            'WHERE lat IS NOT NULL AND place_id IS NULL',
          )
          .getSingle();
      expect(unassigned.read<int>('c'), 0);
    });

    test('photos without a location belong to no place', () async {
      final assigned = await db
          .customSelect(
            'SELECT COUNT(*) AS c FROM photos '
            'WHERE lat IS NULL AND place_id IS NOT NULL',
          )
          .getSingle();
      expect(assigned.read<int>('c'), 0);
    });

    test('place photo counts add up to the located photos', () async {
      final total = (await db.placesDao.all()).fold<int>(
        0,
        (sum, p) => sum + p.photoCount,
      );
      expect(total, await db.photosDao.countWithLocation());
    });
  });

  group('recomputing', () {
    late LibraryFixture fixture;

    setUp(() async {
      fixture = generateLibraryFixture(photoCount: 3000);
      await build(fixture.assets);
      await places.recompute();
    });

    test('is stable: the same photos give the same places', () async {
      final before = await db.placesDao.all();
      await places.recompute();
      final after = await db.placesDao.all();

      expect(after.map((p) => p.id).toSet(), before.map((p) => p.id).toSet());
      expect(
        after.map((p) => p.photoCount),
        before.map((p) => p.photoCount),
      );
    });

    test('keeps a place the user muted', () async {
      final trip = (await db.placesDao.all()).firstWhere(
        (p) => p.mute == MuteState.none,
      );
      await places.mute(trip.id);

      await places.recompute();

      final after = await db.placesDao.byId(trip.id);
      expect(after!.mute, MuteState.userMuted);
    });

    test('keeps a home the user unmuted, forever', () async {
      final home = await placeNear(fixture.home);
      expect(home!.mute, MuteState.auto);

      await places.unmute(home.id);
      await places.recompute();
      await places.recompute();

      final after = await db.placesDao.byId(home.id);
      expect(after!.mute, MuteState.userUnmuted);
      expect(after.mute.isMuted, isFalse);
    });

    test('handing a place back to the rule re-mutes a busy one', () async {
      final home = await placeNear(fixture.home);
      await places.unmute(home!.id);
      await places.clearUserDecision(home.id);

      expect((await db.placesDao.byId(home.id))!.mute, MuteState.auto);
    });

    test('picks up photos added later', () async {
      final before = await db.placesDao.count();

      library.addAll([
        for (var i = 0; i < 5; i++)
          PhotoAsset(
            id: 'new-$i',
            lat: -33.8688,
            lng: 151.2093 + i * 0.0001,
            takenAt: DateTime.utc(2026, 9, 1 + i),
            width: 100,
            height: 100,
          ),
      ]);
      await indexer.run();
      await places.recompute();

      expect(await db.placesDao.count(), before + 1);
      final sydney = await placeNear(const GeoPoint(-33.8688, 151.2093));
      expect(sydney, isNotNull);
      expect(sydney!.photoCount, 5);
    });

    test('drops a place whose photos are gone', () async {
      final before = await db.placesDao.count();
      final victim = (await db.placesDao.all()).last;

      final cells = await db.placesDao.cellOwners();
      final victimCells = cells.entries
          .where((e) => e.value == victim.id)
          .map((e) => e.key)
          .toSet();
      final rows = await db.photosDao.all();
      library.removeIds(
        rows
            .where((r) => victimCells.contains(r.geohash))
            .map((r) => r.assetId)
            .toSet(),
      );

      await indexer.run();
      await places.recompute();

      expect(await db.placesDao.count(), before - 1);
      expect(await db.placesDao.byId(victim.id), isNull);
    });
  });

  group('edge cases', () {
    test('an empty index has no places', () async {
      await build([]);
      expect(await places.recompute(), 0);
      expect(await db.placesDao.count(), 0);
    });

    test('a library with no coordinates has no places', () async {
      await build([
        PhotoAsset(
          id: 'no-gps',
          takenAt: DateTime.utc(2024),
          width: 1,
          height: 1,
        ),
      ]);
      expect(await places.recompute(), 0);
    });

    test('a lower threshold mutes more', () async {
      final fixture = generateLibraryFixture(photoCount: 3000);
      await build(fixture.assets, autoMuteDays: 3);
      await places.recompute();

      final muted = (await db.placesDao.all())
          .where((p) => p.mute.isMuted)
          .length;
      expect(muted, greaterThan(2));
    });
  });
}
