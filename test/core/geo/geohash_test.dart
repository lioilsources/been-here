import 'package:been_here/core/geo/geo_point.dart';
import 'package:been_here/core/geo/geohash.dart';
import 'package:been_here/core/geo/haversine.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('encodeGeohash', () {
    test('matches published reference vectors', () {
      expect(
        encodeGeohash(const GeoPoint(57.64911, 10.40744), precision: 11),
        'u4pruydqqvj',
      );
      expect(
        encodeGeohash(const GeoPoint(42.6, -5.6), precision: 5),
        'ezs42',
      );
      expect(
        encodeGeohash(const GeoPoint(0, 0), precision: 6),
        's00000',
      );
    });

    test('honours the requested precision', () {
      const p = GeoPoint(50.0755, 14.4378);
      for (var precision = 1; precision <= 12; precision++) {
        expect(encodeGeohash(p, precision: precision).length, precision);
      }
    });

    test('shorter hashes are prefixes of longer ones', () {
      const p = GeoPoint(50.0755, 14.4378);
      final long = encodeGeohash(p, precision: 10);
      for (var precision = 1; precision < 10; precision++) {
        expect(long.startsWith(encodeGeohash(p, precision: precision)), isTrue);
      }
    });

    test('wraps out-of-range longitude instead of producing garbage', () {
      expect(
        encodeGeohash(const GeoPoint(0, 181)),
        encodeGeohash(const GeoPoint(0, -179)),
      );
    });
  });

  group('decodeGeohash', () {
    test('round-trips within the cell', () {
      const p = GeoPoint(50.0755, 14.4378);
      final hash = encodeGeohash(p);
      expect(hash.length, placeGeohashPrecision);
      final bounds = decodeGeohashBounds(hash);
      expect(bounds.contains(p), isTrue);
      expect(distanceMeters(p, decodeGeohash(hash)), lessThan(120));
    });

    test('rejects characters outside the alphabet', () {
      // a, i, l and o are not part of the geohash alphabet.
      expect(() => decodeGeohashBounds('u4pruy'), returnsNormally);
      expect(() => decodeGeohashBounds('u4pray'), throwsFormatException);
      expect(() => decodeGeohashBounds('u4priy'), throwsFormatException);
      expect(() => decodeGeohashBounds('u4prly'), throwsFormatException);
      expect(() => decodeGeohashBounds('u4proy'), throwsFormatException);
    });

    test('precision 7 cells are roughly 150 m', () {
      final bounds = decodeGeohashBounds(
        encodeGeohash(const GeoPoint(50.0755, 14.4378)),
      );
      final height = distanceMeters(
        GeoPoint(bounds.minLat, bounds.minLng),
        GeoPoint(bounds.maxLat, bounds.minLng),
      );
      final width = distanceMeters(
        GeoPoint(bounds.minLat, bounds.minLng),
        GeoPoint(bounds.minLat, bounds.maxLng),
      );
      expect(height, closeTo(153, 5));
      // Longitude cells narrow with latitude; at 50°N that is ~98 m.
      expect(width, closeTo(98, 5));
    });
  });

  group('geohashNeighbors', () {
    test('returns eight distinct cells that exclude the centre', () {
      final hash = encodeGeohash(const GeoPoint(50.0755, 14.4378));
      final neighbors = geohashNeighbors(hash);
      expect(neighbors, hasLength(8));
      expect(neighbors.toSet(), hasLength(8));
      expect(neighbors, isNot(contains(hash)));
    });

    test('neighbours have the same precision', () {
      final hash = encodeGeohash(
        const GeoPoint(-33.8688, 151.2093),
        precision: 9,
      );
      expect(geohashNeighbors(hash).every((n) => n.length == 9), isTrue);
    });

    test('every neighbour is adjacent, none is two cells away', () {
      final hash = encodeGeohash(const GeoPoint(50.0755, 14.4378));
      final center = decodeGeohash(hash);
      final bounds = decodeGeohashBounds(hash);
      final diagonal = distanceMeters(
        GeoPoint(bounds.minLat, bounds.minLng),
        GeoPoint(bounds.maxLat, bounds.maxLng),
      );

      for (final neighbor in geohashNeighbors(hash)) {
        final d = distanceMeters(center, decodeGeohash(neighbor));
        expect(d, lessThan(diagonal * 1.1), reason: neighbor);
      }
    });

    test('adjacency is mutual', () {
      final hash = encodeGeohash(const GeoPoint(50.0755, 14.4378));
      for (final neighbor in geohashNeighbors(hash)) {
        expect(geohashNeighbors(neighbor), contains(hash), reason: neighbor);
      }
    });

    test('wraps across the antimeridian', () {
      final hash = encodeGeohash(const GeoPoint(0, 179.999));
      final neighbors = geohashNeighbors(hash);
      expect(neighbors, hasLength(8));
      final westernHemisphere = neighbors.where(
        (n) => decodeGeohash(n).lng < 0,
      );
      expect(westernHemisphere, isNotEmpty);
    });

    test('has no neighbours beyond the pole', () {
      final neighbors = geohashNeighbors(encodeGeohash(const GeoPoint(90, 0)));
      expect(neighbors.length, lessThan(8));
      expect(neighbors.every((n) => decodeGeohash(n).lat <= 90), isTrue);
    });
  });
}
