import 'dart:math';

import 'package:been_here/core/geo/geo_point.dart';
import 'package:been_here/core/geo/haversine.dart';
import 'package:been_here/core/geo/unit_vector.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('UnitVector', () {
    test('lands on the unit sphere', () {
      final rnd = Random(5);
      for (var i = 0; i < 200; i++) {
        final point = GeoPoint(
          rnd.nextDouble() * 180 - 90,
          rnd.nextDouble() * 360 - 180,
        );
        final v = UnitVector.of(point);
        final length = sqrt(v.x * v.x + v.y * v.y + v.z * v.z);
        expect(length, closeTo(1, 1e-12), reason: '$point');
      }
    });

    test('knows the cardinal points', () {
      final origin = UnitVector.of(const GeoPoint(0, 0));
      expect(origin.x, closeTo(1, 1e-12));
      expect(origin.y, closeTo(0, 1e-12));
      expect(origin.z, closeTo(0, 1e-12));

      final northPole = UnitVector.of(const GeoPoint(90, 0));
      expect(northPole.z, closeTo(1, 1e-12));

      final east = UnitVector.of(const GeoPoint(0, 90));
      expect(east.y, closeTo(1, 1e-12));
    });

    test('the chord to itself is zero', () {
      final v = UnitVector.of(const GeoPoint(50.0755, 14.4378));
      expect(v.chordSquaredTo(v), closeTo(0, 1e-20));
    });

    test('antipodes are a full diameter apart', () {
      final a = UnitVector.of(const GeoPoint(0, 0));
      final b = UnitVector.of(const GeoPoint(0, 180));
      expect(a.chordSquaredTo(b), closeTo(4, 1e-12));
    });
  });

  group('chordSquaredForRadius', () {
    test('a zero radius is a zero chord', () {
      expect(chordSquaredForRadius(0), 0);
      expect(chordSquaredForRadius(-5), 0);
    });

    test('clamps at the far side of the world', () {
      expect(chordSquaredForRadius(30000000), 4);
      expect(chordSquaredForRadius(pi * earthRadiusMeters), 4);
    });

    test('grows with the radius', () {
      var previous = 0.0;
      for (final radius in [100.0, 1000.0, 50000.0, 1000000.0]) {
        final chord = chordSquaredForRadius(radius);
        expect(chord, greaterThan(previous));
        previous = chord;
      }
    });
  });

  group('agreement with haversine', () {
    test('the chord test accepts exactly what haversine accepts', () {
      final rnd = Random(9);
      const center = GeoPoint(50.0755, 14.4378);
      final centerVector = UnitVector.of(center);

      for (final radius in [100.0, 1000.0, 25000.0, 500000.0]) {
        final threshold = chordSquaredForRadius(radius);
        var checked = 0;

        for (var i = 0; i < 400; i++) {
          // Sample around the threshold so the boundary gets exercised.
          final bearing = rnd.nextDouble() * 2 * pi;
          final distance = radius * (0.9 + rnd.nextDouble() * 0.2);
          final point = _offset(center, distance, bearing);

          final byHaversine = distanceMeters(center, point) <= radius;
          final byChord =
              UnitVector.of(point).chordSquaredTo(centerVector) <= threshold;

          expect(
            byChord,
            byHaversine,
            reason:
                'radius $radius, point $point, '
                'distance ${distanceMeters(center, point)}',
          );
          checked++;
        }
        expect(checked, 400);
      }
    });
  });
}

/// Moves [from] by [meters] along [bearing] radians on the sphere.
GeoPoint _offset(GeoPoint from, double meters, double bearing) {
  const toRad = pi / 180;
  final angular = meters / earthRadiusMeters;
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
