import 'dart:math';

import 'package:been_here/core/geo/bounding_box.dart';
import 'package:been_here/core/geo/geo_point.dart';
import 'package:been_here/core/geo/haversine.dart';
import 'package:flutter_test/flutter_test.dart';

/// Moves [from] by [meters] along [bearingDegrees] on the sphere.
GeoPoint _offset(GeoPoint from, double meters, double bearingDegrees) {
  const toRad = pi / 180;
  final angular = meters / earthRadiusMeters;
  final bearing = bearingDegrees * toRad;
  final lat1 = from.lat * toRad;
  final lng1 = from.lng * toRad;

  final lat2 = asin(
    sin(lat1) * cos(angular) + cos(lat1) * sin(angular) * cos(bearing),
  );
  final lng2 =
      lng1 +
      atan2(
        sin(bearing) * sin(angular) * cos(lat1),
        cos(angular) - sin(lat1) * sin(lat2),
      );

  return GeoPoint(lat2 / toRad, normalizeLongitude(lng2 / toRad));
}

void main() {
  group('boundingBoxAround', () {
    test('latitude span matches the radius', () {
      final box = boundingBoxAround(const GeoPoint(50, 14), 1000);
      final height = distanceMeters(
        GeoPoint(box.minLat, 14),
        GeoPoint(box.maxLat, 14),
      );
      expect(height, closeTo(2000, 5));
    });

    test('longitude span widens with latitude', () {
      final atEquator = boundingBoxAround(const GeoPoint(0, 0), 10000);
      final atSixty = boundingBoxAround(const GeoPoint(60, 0), 10000);
      final equatorWidth = atEquator.maxLng - atEquator.minLng;
      final sixtyWidth = atSixty.maxLng - atSixty.minLng;
      expect(sixtyWidth, greaterThan(equatorWidth * 1.9));
    });

    test('contains every point inside the radius', () {
      final rnd = Random(7);
      for (var i = 0; i < 300; i++) {
        final center = GeoPoint(
          rnd.nextDouble() * 160 - 80,
          rnd.nextDouble() * 360 - 180,
        );
        final radius = 100 + rnd.nextDouble() * 50000;
        final box = boundingBoxAround(center, radius);

        for (var b = 0; b < 36; b++) {
          final edge = _offset(center, radius * 0.999, b * 10.0);
          expect(
            box.contains(edge),
            isTrue,
            reason: 'center=$center radius=$radius missed $edge',
          );
        }
      }
    });

    test('a zero radius still contains its centre', () {
      const center = GeoPoint(50, 14);
      expect(boundingBoxAround(center, 0).contains(center), isTrue);
    });

    test('clamps at the poles and takes the whole longitude range', () {
      final box = boundingBoxAround(const GeoPoint(89.9, 20), 100000);
      expect(box.maxLat, 90);
      expect(box.minLng, -180);
      expect(box.maxLng, 180);
      expect(box.crossesAntimeridian, isFalse);
    });

    test('a radius past half the globe covers all longitudes', () {
      final box = boundingBoxAround(const GeoPoint(0, 0), 20000000);
      expect(box.minLng, -180);
      expect(box.maxLng, 180);
    });
  });

  group('antimeridian', () {
    test('a box near ±180 wraps', () {
      final box = boundingBoxAround(const GeoPoint(0, 179.95), 20000);
      expect(box.crossesAntimeridian, isTrue);
      expect(box.contains(const GeoPoint(0, 179.99)), isTrue);
      expect(box.contains(const GeoPoint(0, -179.99)), isTrue);
      expect(box.contains(const GeoPoint(0, 0)), isFalse);
    });

    test('split produces two SQL-safe boxes covering the same points', () {
      final box = boundingBoxAround(const GeoPoint(0, 179.95), 20000);
      final parts = box.split();
      expect(parts, hasLength(2));
      for (final part in parts) {
        expect(part.crossesAntimeridian, isFalse);
        expect(part.minLng, lessThanOrEqualTo(part.maxLng));
      }

      for (final p in [
        const GeoPoint(0, 179.99),
        const GeoPoint(0, -179.99),
        const GeoPoint(0, 180),
      ]) {
        expect(parts.any((part) => part.contains(p)), isTrue, reason: '$p');
      }
    });

    test('split is a no-op for an ordinary box', () {
      final box = boundingBoxAround(const GeoPoint(50, 14), 1000);
      expect(box.split(), [box]);
    });
  });
}
