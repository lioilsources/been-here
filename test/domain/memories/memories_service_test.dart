import 'dart:math';

import 'package:been_here/core/geo/geo_point.dart';
import 'package:been_here/core/geo/geohash.dart';
import 'package:been_here/core/geo/haversine.dart';
import 'package:been_here/core/geo/unit_vector.dart';
import 'package:been_here/core/time/local_day.dart';
import 'package:been_here/data/db/database.dart';
import 'package:been_here/domain/memories/memories_service.dart';
// drift exports isNull/isNotNull expression helpers that collide with
// matcher's.
import 'package:drift/drift.dart' hide isNotNull, isNull;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

const _prague = GeoPoint(50.0755, 14.4378);
const _utc = FixedOffsetLocalDay(Duration.zero);

PhotosCompanion _row(String id, GeoPoint? at, DateTime takenAt) {
  final vector = at == null ? null : UnitVector.of(at);
  return PhotosCompanion.insert(
    assetId: id,
    lat: Value(at?.lat),
    lng: Value(at?.lng),
    geohash: Value(at == null ? null : encodeGeohash(at)),
    x: Value(vector?.x),
    y: Value(vector?.y),
    z: Value(vector?.z),
    takenAt: takenAt.millisecondsSinceEpoch ~/ 1000,
    width: 4032,
    height: 3024,
    indexedAt: 0,
  );
}

void main() {
  late AppDatabase db;
  late MemoriesService service;
  var nextId = 0;

  setUp(() {
    db = AppDatabase.withExecutor(NativeDatabase.memory());
    service = MemoriesService(dao: db.memoriesDao, localDay: _utc);
    nextId = 0;
  });

  tearDown(() => db.close());

  Future<void> insert(GeoPoint? at, DateTime takenAt, {String? id}) =>
      db.into(db.photos).insert(_row(id ?? 'photo-${nextId++}', at, takenAt));

  /// [meters] north of [from].
  GeoPoint north(GeoPoint from, double meters) =>
      GeoPoint(from.lat + meters / metersPerDegreeLatitude, from.lng);

  Future<Set<String>> idsNear(double radius) async {
    final here = await service.near(_prague, radiusMeters: radius);
    final ids = <String>{};
    for (final visit in here.visits) {
      final photos = await service.photosOf(
        visit,
        center: _prague,
        radiusMeters: radius,
      );
      ids.addAll(photos.map((p) => p.assetId));
    }
    return ids;
  }

  group('near', () {
    test('finds nothing in an empty index', () async {
      final result = await service.near(_prague, radiusMeters: 1000);
      expect(result.isEmpty, isTrue);
      expect(result.photoCount, 0);
      expect(result.mostRecent, isNull);
    });

    test('includes photos inside the radius and excludes the rest', () async {
      await insert(north(_prague, 50), DateTime.utc(2024, 6, 10), id: 'in');
      await insert(north(_prague, 900), DateTime.utc(2024, 6, 10), id: 'edge');
      await insert(north(_prague, 1500), DateTime.utc(2024, 6, 10), id: 'out');

      final result = await service.near(_prague, radiusMeters: 1000);

      expect(result.photoCount, 2);
      expect(await idsNear(1000), {'in', 'edge'});
    });

    test('cuts a circle, not the bounding box', () async {
      // The box corner at 990 m north and 990 m east is 1.4 km away.
      final corner = GeoPoint(
        _prague.lat + 990 / metersPerDegreeLatitude,
        _prague.lng + 990 / metersPerDegreeLongitude(_prague.lat),
      );
      expect(distanceMeters(_prague, corner), greaterThan(1000));

      await insert(corner, DateTime.utc(2024, 6, 10));
      expect((await service.near(_prague, radiusMeters: 1000)).photoCount, 0);
    });

    test('the SQL circle agrees with haversine exactly', () async {
      final rnd = Random(3);
      final points = <String, GeoPoint>{};
      for (var i = 0; i < 500; i++) {
        final point = GeoPoint(
          _prague.lat + (rnd.nextDouble() - 0.5) * 0.06,
          _prague.lng + (rnd.nextDouble() - 0.5) * 0.09,
        );
        points['p$i'] = point;
        await insert(point, DateTime.utc(2024, 6, 10), id: 'p$i');
      }

      const radius = 1500.0;
      final expected = points.entries
          .where((e) => distanceMeters(_prague, e.value) <= radius)
          .map((e) => e.key)
          .toSet();

      expect(expected, isNotEmpty);
      expect(await idsNear(radius), expected);
    });

    test('ignores photos with no location', () async {
      await insert(null, DateTime.utc(2024, 6, 10));
      await insert(_prague, DateTime.utc(2024, 6, 10));

      expect((await service.near(_prague, radiusMeters: 1000)).photoCount, 1);
    });

    test('groups into visits, newest first', () async {
      await insert(_prague, DateTime.utc(2019, 7, 4, 18));
      await insert(_prague, DateTime.utc(2024, 3, 1, 14));
      await insert(_prague, DateTime.utc(2024, 3, 2, 9));
      await insert(_prague, DateTime.utc(2021, 5, 12, 9));

      final result = await service.near(_prague, radiusMeters: 500);

      expect(result.visits, hasLength(3));
      expect(result.visits.map((v) => v.date.year), [2024, 2021, 2019]);
      expect(result.visits.first.photoCount, 2);
      expect(result.photoCount, 4);
      expect(result.mostRecent?.date, DateTime(2024, 3));
    });

    test('a zero radius still finds a photo at the exact spot', () async {
      await insert(_prague, DateTime.utc(2024, 6, 10));
      expect((await service.near(_prague, radiusMeters: 0)).photoCount, 1);
    });

    test('works across the antimeridian', () async {
      const fiji = GeoPoint(-17.7, 179.99);
      await insert(
        const GeoPoint(-17.7, 179.995),
        DateTime.utc(2024, 6, 10),
        id: 'east',
      );
      await insert(
        const GeoPoint(-17.7, -179.995),
        DateTime.utc(2024, 6, 10),
        id: 'west',
      );
      await insert(
        const GeoPoint(-17.7, 0),
        DateTime.utc(2024, 6, 10),
        id: 'far',
      );

      final here = await service.near(fiji, radiusMeters: 5000);
      expect(here.photoCount, 2);

      final photos = await service.photosOf(
        here.visits.single,
        center: fiji,
        radiusMeters: 5000,
      );
      expect(photos.map((p) => p.assetId).toSet(), {'east', 'west'});
    });

    test('works near a pole', () async {
      const northPole = GeoPoint(89.99, 0);
      await insert(const GeoPoint(89.995, 120), DateTime.utc(2024, 6, 10));

      expect(
        (await service.near(northPole, radiusMeters: 50000)).photoCount,
        1,
      );
    });
  });

  group('photosOf', () {
    test('returns only the visit it was asked for, oldest first', () async {
      await insert(_prague, DateTime.utc(2019, 7, 4, 18), id: 'old');
      await insert(_prague, DateTime.utc(2024, 3, 1, 14), id: 'new-a');
      await insert(_prague, DateTime.utc(2024, 3, 1, 9), id: 'new-b');

      final here = await service.near(_prague, radiusMeters: 500);
      final recent = await service.photosOf(
        here.visits.first,
        center: _prague,
        radiusMeters: 500,
      );

      expect(recent.map((p) => p.assetId), ['new-b', 'new-a']);
    });

    test('reports distances from the query centre', () async {
      await insert(north(_prague, 300), DateTime.utc(2024, 6, 10));

      final here = await service.near(_prague, radiusMeters: 1000);
      final photos = await service.photosOf(
        here.visits.single,
        center: _prague,
        radiusMeters: 1000,
      );

      expect(photos.single.distanceMeters, closeTo(300, 2));
      expect(photos.single.width, 4032);
    });

    test('pages', () async {
      for (var i = 0; i < 10; i++) {
        await insert(_prague, DateTime.utc(2024, 6, 10, 8 + i), id: 'p$i');
      }
      final here = await service.near(_prague, radiusMeters: 500);
      final visit = here.visits.single;

      final first = await service.photosOf(
        visit,
        center: _prague,
        radiusMeters: 500,
        limit: 4,
      );
      final second = await service.photosOf(
        visit,
        center: _prague,
        radiusMeters: 500,
        limit: 4,
        offset: 4,
      );

      expect(first.map((p) => p.assetId), ['p0', 'p1', 'p2', 'p3']);
      expect(second.map((p) => p.assetId), ['p4', 'p5', 'p6', 'p7']);
    });
  });

  group('countNear', () {
    test('matches what near reports', () async {
      for (var i = 0; i < 7; i++) {
        await insert(north(_prague, i * 100.0), DateTime.utc(2024, 6, 10 + i));
      }

      expect(await service.countNear(_prague, radiusMeters: 350), 4);
      expect(
        await service.countNear(_prague, radiusMeters: 5000),
        (await service.near(_prague, radiusMeters: 5000)).photoCount,
      );
    });

    test('grows monotonically with the radius', () async {
      for (var i = 1; i <= 20; i++) {
        await insert(north(_prague, i * 250.0), DateTime.utc(2024, 6, 10));
      }

      var previous = 0;
      for (final radius in [100.0, 500.0, 1000.0, 2500.0, 5000.0, 10000.0]) {
        final count = await service.countNear(_prague, radiusMeters: radius);
        expect(count, greaterThanOrEqualTo(previous), reason: '$radius m');
        previous = count;
      }
      expect(previous, 20);
    });

    test('a radius past half the globe finds everything', () async {
      await insert(const GeoPoint(-33.8688, 151.2093), DateTime.utc(2018));
      await insert(_prague, DateTime.utc(2024, 6, 10));

      expect(await service.countNear(_prague, radiusMeters: 30000000), 2);
    });
  });

  group('nearest', () {
    test('returns nothing when the index is empty', () async {
      expect(await service.nearest(_prague), isNull);
    });

    test('finds a photo far outside the current radius', () async {
      const brno = GeoPoint(49.1951, 16.6068);
      await insert(brno, DateTime.utc(2023, 6, 21));

      final nearest = await service.nearest(_prague, fromRadiusMeters: 1000);

      expect(nearest, isNotNull);
      expect(nearest!.distanceMeters, closeTo(184332, 100));
    });

    test('picks the closest of several', () async {
      await insert(
        north(_prague, 30000),
        DateTime.utc(2024, 6, 10),
        id: 'near',
      );
      await insert(north(_prague, 90000), DateTime.utc(2024, 6, 10), id: 'far');

      final nearest = await service.nearest(_prague, fromRadiusMeters: 5000);
      expect(nearest!.memory.assetId, 'near');
    });

    test('reaches the other side of the world', () async {
      const sydney = GeoPoint(-33.8688, 151.2093);
      await insert(sydney, DateTime.utc(2018));

      final nearest = await service.nearest(_prague, fromRadiusMeters: 50000);
      expect(nearest, isNotNull);
      expect(nearest!.distanceMeters, greaterThan(15000000));
    });

    test('an index with no located photos still terminates', () async {
      await insert(null, DateTime.utc(2024, 6, 10));
      expect(await service.nearest(_prague, fromRadiusMeters: 50000), isNull);
    });
  });

  group('performance', () {
    /// A hundred thousand photos, a quarter of them in a dense knot around
    /// the query point — the "standing in my own neighbourhood" case, which
    /// is the expensive one.
    Future<void> seed() async {
      final rnd = Random(11);
      final rows = <PhotosCompanion>[];
      for (var i = 0; i < 100000; i++) {
        final dense = i % 4 == 0;
        final point = dense
            ? GeoPoint(
                _prague.lat + (rnd.nextDouble() - 0.5) * 0.02,
                _prague.lng + (rnd.nextDouble() - 0.5) * 0.03,
              )
            : GeoPoint(45 + rnd.nextDouble() * 10, 8 + rnd.nextDouble() * 14);
        rows.add(
          _row(
            'bench-$i',
            point,
            DateTime.fromMillisecondsSinceEpoch(
              (1500000000 + i * 600) * 1000,
              isUtc: true,
            ),
          ),
        );
      }
      await db.batch((b) => b.insertAll(db.photos, rows));
    }

    test(
      'the visit timeline on 100k photos stays under 50 ms',
      tags: [
        'performance',
      ],
      () async {
        await seed();
        await service.near(_prague, radiusMeters: 1000); // warm

        final stopwatch = Stopwatch()..start();
        final result = await service.near(_prague, radiusMeters: 1000);
        stopwatch.stop();

        expect(result.photoCount, greaterThan(10000));
        expect(
          stopwatch.elapsedMilliseconds,
          lessThan(50),
          reason:
              'near() took ${stopwatch.elapsedMilliseconds} ms for '
              '${result.photoCount} photos',
        );
      },
    );

    test(
      'the slider count on 100k photos stays under 25 ms',
      tags: [
        'performance',
      ],
      () async {
        await seed();
        await service.countNear(_prague, radiusMeters: 1000); // warm

        final stopwatch = Stopwatch()..start();
        for (final radius in [100.0, 250.0, 500.0, 1000.0, 2000.0]) {
          await service.countNear(_prague, radiusMeters: radius);
        }
        stopwatch.stop();

        final perStep = stopwatch.elapsedMilliseconds / 5;
        expect(
          perStep,
          lessThan(25),
          reason: 'countNear() averaged $perStep ms per slider step',
        );
      },
    );
  });

  group('points for the map', () {
    test('are the located photos inside the circle', () async {
      await insert(_prague, DateTime.utc(2020));
      await insert(north(_prague, 200), DateTime.utc(2020, 1, 2));
      await insert(north(_prague, 3000), DateTime.utc(2020, 1, 3));
      await insert(null, DateTime.utc(2020, 1, 4));

      final points = await service.pointsNear(_prague, radiusMeters: 500);

      expect(points, hasLength(2));
      expect(
        points.every((p) => distanceMeters(p, _prague) <= 500),
        isTrue,
      );
    });

    test('are capped, keeping the newest', () async {
      for (var i = 0; i < 20; i++) {
        await insert(_prague, DateTime.utc(2020).add(Duration(days: i)));
      }

      final points = await service.pointsNear(
        _prague,
        radiusMeters: 500,
        limit: 5,
      );

      // A dense neighbourhood holds more photos than a map can show dots
      // for, and past a few thousand they stop being information.
      expect(points, hasLength(5));
    });

    test('an empty index draws nothing', () async {
      expect(await service.pointsNear(_prague, radiusMeters: 500), isEmpty);
    });
  });
}
