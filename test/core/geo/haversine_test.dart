import 'package:been_here/core/geo/geo_point.dart';
import 'package:been_here/core/geo/haversine.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('distanceMeters', () {
    test('is zero for the same point', () {
      const p = GeoPoint(50.0755, 14.4378);
      expect(distanceMeters(p, p), 0);
    });

    test('matches known city pair', () {
      const prague = GeoPoint(50.0755, 14.4378);
      const brno = GeoPoint(49.1951, 16.6068);
      expect(distanceMeters(prague, brno), closeTo(184332, 50));
    });

    test('matches a transatlantic pair', () {
      const prague = GeoPoint(50.0755, 14.4378);
      const newYork = GeoPoint(40.7128, -74.0060);
      expect(distanceMeters(prague, newYork), closeTo(6572461, 2000));
    });

    test('one degree of latitude is ~111.2 km anywhere', () {
      expect(
        distanceMeters(const GeoPoint(0, 0), const GeoPoint(1, 0)),
        closeTo(111195, 5),
      );
      expect(
        distanceMeters(const GeoPoint(60, 25), const GeoPoint(61, 25)),
        closeTo(111195, 5),
      );
    });

    test('one degree of longitude shrinks towards the poles', () {
      final atEquator = distanceMeters(
        const GeoPoint(0, 0),
        const GeoPoint(0, 1),
      );
      final atSixty = distanceMeters(
        const GeoPoint(60, 0),
        const GeoPoint(60, 1),
      );
      expect(atEquator, closeTo(111195, 5));
      expect(atSixty, closeTo(atEquator / 2, 100));
    });

    test('handles antipodal points without NaN', () {
      final d = distanceMeters(const GeoPoint(0, 0), const GeoPoint(0, 180));
      expect(d.isNaN, isFalse);
      expect(d, closeTo(20015114, 100));
    });

    test('is symmetric', () {
      const a = GeoPoint(50.0755, 14.4378);
      const b = GeoPoint(-33.8688, 151.2093);
      expect(distanceMeters(a, b), closeTo(distanceMeters(b, a), 0.001));
    });

    test('resolves metre-scale differences', () {
      const a = GeoPoint(50, 14);
      const b = GeoPoint(50.000899, 14); // ~100 m north
      expect(distanceMeters(a, b), closeTo(100, 1));
    });
  });

  group('metersPerDegree', () {
    test('latitude is constant', () {
      expect(metersPerDegreeLatitude, closeTo(111195, 5));
    });

    test('longitude follows the cosine of latitude', () {
      expect(metersPerDegreeLongitude(0), closeTo(111195, 5));
      expect(metersPerDegreeLongitude(60), closeTo(55597, 5));
      expect(metersPerDegreeLongitude(90), closeTo(0, 0.01));
    });
  });

  group('normalizeLongitude', () {
    test('leaves in-range values alone', () {
      expect(normalizeLongitude(0), 0);
      expect(normalizeLongitude(179.9), 179.9);
      expect(normalizeLongitude(-180), -180);
    });

    test('wraps past the antimeridian', () {
      expect(normalizeLongitude(181), closeTo(-179, 1e-9));
      expect(normalizeLongitude(-181), closeTo(179, 1e-9));
      expect(normalizeLongitude(540), closeTo(-180, 1e-9));
    });
  });
}
