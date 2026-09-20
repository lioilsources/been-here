import 'package:been_here/core/geo/geo_point.dart';
import 'package:been_here/core/geo/geohash.dart';
import 'package:been_here/core/geo/haversine.dart';
import 'package:been_here/core/geo/unit_vector.dart';
import 'package:been_here/domain/places/place_cluster.dart';
import 'package:flutter_test/flutter_test.dart';

CellStats _cell(
  GeoPoint at, {
  int photos = 1,
  Set<int> days = const {0},
  int firstAt = 1000,
  int lastAt = 2000,
}) {
  final vector = UnitVector.of(at);
  return CellStats(
    geohash: encodeGeohash(at),
    photoCount: photos,
    firstAt: firstAt,
    lastAt: lastAt,
    sumX: vector.x * photos,
    sumY: vector.y * photos,
    sumZ: vector.z * photos,
    days: days,
  );
}

/// [meters] north of [from].
GeoPoint _north(GeoPoint from, double meters) =>
    GeoPoint(from.lat + meters / metersPerDegreeLatitude, from.lng);

const _prague = GeoPoint(50.0755, 14.4378);

void main() {
  group('clusterCells', () {
    test('no cells, no places', () {
      expect(clusterCells(const []), isEmpty);
    });

    test('one cell is one place', () {
      final places = clusterCells([_cell(_prague, photos: 7)]);

      expect(places, hasLength(1));
      expect(places.single.photoCount, 7);
      expect(places.single.cells, hasLength(1));
      expect(distanceMeters(places.single.center, _prague), lessThan(150));
    });

    test('adjacent cells become one place', () {
      // Three cells in a row: ~150 m apart, so each touches the next.
      final places = clusterCells([
        _cell(_prague),
        _cell(_north(_prague, 150)),
        _cell(_north(_prague, 300)),
      ]);

      expect(places, hasLength(1));
      expect(places.single.cells.length, greaterThanOrEqualTo(2));
    });

    test('distant cells stay separate places', () {
      final places = clusterCells([
        _cell(_prague),
        _cell(_north(_prague, 5000)),
      ]);

      expect(places, hasLength(2));
    });

    test('a gap of one empty cell splits them', () {
      // ~450 m apart leaves at least one unoccupied cell between.
      final places = clusterCells([
        _cell(_prague),
        _cell(_north(_prague, 600)),
      ]);

      expect(places, hasLength(2));
    });

    test('sums photos and unions days across a component', () {
      final places = clusterCells([
        _cell(_prague, photos: 4, days: {1, 2}),
        _cell(_north(_prague, 150), photos: 6, days: {2, 3}),
      ]);

      expect(places, hasLength(1));
      expect(places.single.photoCount, 10);
      // The shared day counts once.
      expect(places.single.distinctDays, 3);
    });

    test('takes the earliest and latest time in the component', () {
      final places = clusterCells([
        _cell(_prague, firstAt: 500, lastAt: 900),
        _cell(_north(_prague, 150), firstAt: 100, lastAt: 5000),
      ]);

      expect(places.single.firstAt, 100);
      expect(places.single.lastAt, 5000);
    });

    test('the centre is weighted by photo count', () {
      const busy = _prague;
      final quiet = _north(_prague, 150);
      final places = clusterCells([
        _cell(busy, photos: 100),
        _cell(quiet),
      ]);

      final center = places.single.center;
      expect(
        distanceMeters(center, busy),
        lessThan(distanceMeters(center, quiet)),
      );
    });

    test('the radius covers every cell but stays inside the clamp', () {
      final places = clusterCells([
        _cell(_prague),
        _cell(_north(_prague, 150)),
        _cell(_north(_prague, 300)),
      ]);

      expect(
        places.single.radiusMeters,
        inInclusiveRange(minPlaceRadiusMeters, maxPlaceRadiusMeters),
      );
      // Big enough to contain the cells it was built from.
      expect(places.single.radiusMeters, greaterThan(200));
    });

    test('a single photo still gets a usable radius', () {
      final places = clusterCells([_cell(_prague)]);
      // Measured to the cell's corners, so about a cell across — never the
      // zero a single point would give on its own.
      expect(
        places.single.radiusMeters,
        inInclusiveRange(minPlaceRadiusMeters, 200),
      );
    });

    test('a sprawling component is clamped, not unbounded', () {
      final places = clusterCells([
        for (var i = 0; i < 40; i++) _cell(_north(_prague, i * 150.0)),
      ]);

      expect(places, hasLength(1));
      expect(places.single.radiusMeters, maxPlaceRadiusMeters);
    });

    test('places come back busiest first', () {
      final places = clusterCells([
        _cell(_prague, photos: 3),
        _cell(_north(_prague, 5000), photos: 90),
        _cell(_north(_prague, 10000), photos: 20),
      ]);

      expect(places.map((p) => p.photoCount), [90, 20, 3]);
    });

    test('works across the antimeridian', () {
      const east = GeoPoint(-17.7, 179.9995);
      const west = GeoPoint(-17.7, -179.9995);

      final places = clusterCells([_cell(east), _cell(west)]);

      expect(places, hasLength(1));
      // The centroid must be on the date line, not on the far side of the
      // planet — which is what averaging longitudes would give.
      expect(places.single.center.lng.abs(), greaterThan(179));
    });

    test('cell order does not change the outcome', () {
      final cells = [
        _cell(_prague),
        _cell(_north(_prague, 150)),
        _cell(_north(_prague, 9000)),
      ];
      final forwards = clusterCells(cells);
      final backwards = clusterCells(cells.reversed);

      expect(
        forwards.map((p) => p.photoCount),
        backwards.map((p) => p.photoCount),
      );
      expect(forwards.map((p) => p.cells), backwards.map((p) => p.cells));
    });

    test('a long chain of cells stays one place', () {
      // Path compression territory: a couple of hundred cells in a line.
      // Steps of 150 m are just under a cell's height, so every step lands
      // in the same cell or the next one — never skipping one.
      final cells = [
        for (var i = 0; i < 200; i++) _cell(_north(_prague, i * 150.0)),
      ];
      final distinct = cells.map((c) => c.geohash).toSet().length;

      final places = clusterCells(cells);

      expect(places, hasLength(1));
      expect(places.single.photoCount, distinct);
      expect(distinct, greaterThan(150));
    });
  });
}
