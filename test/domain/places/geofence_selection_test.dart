import 'package:been_here/core/geo/geo_point.dart';
import 'package:been_here/core/geo/haversine.dart';
import 'package:been_here/domain/memories/notification_rules.dart';
import 'package:been_here/domain/places/geofence_selection.dart';
import 'package:been_here/domain/places/mute_state.dart';
import 'package:flutter_test/flutter_test.dart';

const _prague = GeoPoint(50.0755, 14.4378);
final _now = DateTime.utc(2026, 9, 20, 14);

GeoPoint _north(double meters) =>
    GeoPoint(_prague.lat + meters / metersPerDegreeLatitude, _prague.lng);

NotifiablePlace _place({
  required int id,
  GeoPoint? at,
  int photos = 14,
  Duration lastPhoto = const Duration(days: 2191),
  MuteState mute = MuteState.none,
  Duration? lastNotified,
}) => NotifiablePlace(
  placeId: id,
  center: at ?? _north(id * 1000.0),
  radiusMeters: 150,
  photoCount: photos,
  lastPhotoAt: _now.subtract(lastPhoto),
  mute: mute,
  lastNotifiedAt: lastNotified == null ? null : _now.subtract(lastNotified),
);

void main() {
  group('selectRegions', () {
    test('nothing to watch when there are no places', () {
      expect(
        selectRegions(places: const [], from: _prague, now: _now, limit: 20),
        isEmpty,
      );
    });

    test('picks the nearest places', () {
      final places = [
        _place(id: 5),
        _place(id: 1),
        _place(id: 3),
      ];

      final chosen = selectRegions(
        places: places,
        from: _prague,
        now: _now,
        limit: 2,
      );

      expect(chosen.map((p) => p.placeId), [1, 3]);
    });

    test('never exceeds the limit', () {
      final places = [for (var i = 1; i <= 60; i++) _place(id: i)];

      expect(
        selectRegions(
          places: places,
          from: _prague,
          now: _now,
          limit: iosRegionLimit,
        ),
        hasLength(iosRegionLimit),
      );
      expect(
        selectRegions(
          places: places,
          from: _prague,
          now: _now,
          limit: androidRegionLimit,
        ),
        hasLength(60),
      );
    });

    test('a zero limit watches nothing', () {
      expect(
        selectRegions(
          places: [_place(id: 1)],
          from: _prague,
          now: _now,
          limit: 0,
        ),
        isEmpty,
      );
    });

    test('a muted place never takes a slot, however close', () {
      final chosen = selectRegions(
        places: [
          _place(id: 1, at: _north(10), mute: MuteState.auto),
          _place(id: 2, at: _north(50000)),
        ],
        from: _prague,
        now: _now,
        limit: 20,
      );

      expect(chosen.map((p) => p.placeId), [2]);
    });

    test('a place you were at last week never takes a slot', () {
      final chosen = selectRegions(
        places: [
          _place(id: 1, at: _north(10), lastPhoto: const Duration(days: 7)),
          _place(id: 2, at: _north(50000)),
        ],
        from: _prague,
        now: _now,
        limit: 20,
      );

      expect(chosen.map((p) => p.placeId), [2]);
    });

    test('a place still in its cooldown never takes a slot', () {
      final chosen = selectRegions(
        places: [
          _place(id: 1, at: _north(10), lastNotified: const Duration(days: 3)),
          _place(id: 2, at: _north(50000)),
        ],
        from: _prague,
        now: _now,
        limit: 20,
      );

      expect(chosen.map((p) => p.placeId), [2]);
    });

    test('thin places never take a slot', () {
      final chosen = selectRegions(
        places: [
          _place(id: 1, at: _north(10), photos: 1),
          _place(id: 2, at: _north(50000)),
        ],
        from: _prague,
        now: _now,
        limit: 20,
      );

      expect(chosen.map((p) => p.placeId), [2]);
    });

    test('the selection follows the user', () {
      final places = [for (var i = 1; i <= 10; i++) _place(id: i)];

      final atHome = selectRegions(
        places: places,
        from: _prague,
        now: _now,
        limit: 3,
      );
      final farAway = selectRegions(
        places: places,
        from: _north(10000),
        now: _now,
        limit: 3,
      );

      expect(atHome.map((p) => p.placeId), [1, 2, 3]);
      // From 10 km north, place 10 is underfoot and 9 and 8 follow.
      expect(farAway.map((p) => p.placeId), [10, 9, 8]);
    });

    test('is stable: the same inputs give the same order', () {
      // Two places at the same distance must not swap between runs, or the
      // app re-registers regions for nothing.
      final places = [
        _place(id: 7, at: _north(1000)),
        _place(id: 2, at: _north(1000)),
      ];

      final first = selectRegions(
        places: places,
        from: _prague,
        now: _now,
        limit: 2,
      );
      final second = selectRegions(
        places: places.reversed.toList(),
        from: _prague,
        now: _now,
        limit: 2,
      );

      expect(first.map((p) => p.placeId), [2, 7]);
      expect(second.map((p) => p.placeId), [2, 7]);
    });

    test('ignores whether something notified today', () {
      // The daily cap is about the moment of arrival. If it filtered here,
      // one notification would blind the app for a day.
      final chosen = selectRegions(
        places: [_place(id: 1)],
        from: _prague,
        now: _now,
        limit: 20,
      );
      expect(chosen, hasLength(1));
    });
  });

  group('selectionChanged', () {
    test('no change when the same places come back in the same order', () {
      final places = [_place(id: 1), _place(id: 2)];
      expect(selectionChanged(places, [...places]), isFalse);
    });

    test('a different place is a change', () {
      expect(
        selectionChanged([_place(id: 1)], [_place(id: 2)]),
        isTrue,
      );
    });

    test('a different order is a change', () {
      final a = _place(id: 1);
      final b = _place(id: 2);
      expect(selectionChanged([a, b], [b, a]), isTrue);
    });

    test('a different count is a change', () {
      expect(
        selectionChanged([_place(id: 1)], [_place(id: 1), _place(id: 2)]),
        isTrue,
      );
    });

    test('two empty selections are the same', () {
      expect(selectionChanged(const [], const []), isFalse);
    });
  });

  group('the neighbourhood does not get a slot', () {
    test('places inside the home radius are skipped', () {
      // ids 1..60 sit 1..60 km north of Prague, so a 25 km home radius
      // should hand back the ones past it, nearest first.
      final places = [for (var i = 1; i <= 60; i++) _place(id: i)];

      final chosen = selectRegions(
        places: places,
        from: _prague,
        now: _now,
        limit: 20,
        home: _prague,
      );

      expect(chosen.length, 20);
      // Nothing inside the radius, and still nearest-first outside it.
      // (Place 25 sits on the boundary, which is why this asks the distance
      // rather than the id.)
      for (final place in chosen) {
        expect(
          distanceMeters(_prague, place.center),
          greaterThanOrEqualTo(25000),
        );
      }
      expect(chosen.first.placeId, lessThanOrEqualTo(26));
    });

    test('without a home every place is fair game', () {
      final places = [for (var i = 1; i <= 60; i++) _place(id: i)];

      final chosen = selectRegions(
        places: places,
        from: _prague,
        now: _now,
        limit: 20,
      );

      expect(chosen.first.placeId, 1);
    });
  });
}
