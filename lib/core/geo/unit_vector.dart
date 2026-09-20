import 'dart:math' as math;

import 'package:been_here/core/geo/geo_point.dart';
import 'package:been_here/core/geo/haversine.dart';
import 'package:meta/meta.dart';

/// A point on the unit sphere.
///
/// Stored alongside every located photo so that "is this within r metres"
/// becomes six multiplications in SQL instead of a trigonometric function
/// SQLite may not have, or twenty thousand rows crossing into Dart just to be
/// thrown away.
///
/// It is not an approximation: comparing squared chord length is exactly
/// equivalent to comparing great-circle distance on a sphere, which is the
/// same model haversine uses.
@immutable
class UnitVector {
  const UnitVector(this.x, this.y, this.z);

  factory UnitVector.of(GeoPoint point) {
    final lat = point.lat * _degToRad;
    final lng = point.lng * _degToRad;
    final cosLat = math.cos(lat);
    return UnitVector(
      cosLat * math.cos(lng),
      cosLat * math.sin(lng),
      math.sin(lat),
    );
  }

  static const double _degToRad = math.pi / 180;

  final double x;
  final double y;
  final double z;

  /// Squared straight-line distance through the sphere to [other].
  double chordSquaredTo(UnitVector other) {
    final dx = x - other.x;
    final dy = y - other.y;
    final dz = z - other.z;
    return dx * dx + dy * dy + dz * dz;
  }

  @override
  bool operator ==(Object other) =>
      other is UnitVector && other.x == x && other.y == y && other.z == z;

  @override
  int get hashCode => Object.hash(x, y, z);

  @override
  String toString() => 'UnitVector($x, $y, $z)';
}

/// The squared chord length that corresponds to a great-circle distance of
/// [radiusMeters].
///
/// A point is within the radius exactly when its squared chord to the centre
/// is at most this. Radii past half the circumference cover the whole sphere,
/// where the chord stops growing, so they clamp to the maximum of 4.
double chordSquaredForRadius(double radiusMeters) {
  if (radiusMeters <= 0) return 0;
  const halfCircumference = math.pi * earthRadiusMeters;
  if (radiusMeters >= halfCircumference) return 4;
  final chord = 2 * math.sin(radiusMeters / (2 * earthRadiusMeters));
  return chord * chord;
}

/// The point a set of unit vectors averages to.
///
/// Averaging latitude and longitude directly breaks at the antimeridian —
/// 179° and -179° average to 0°, the wrong side of the planet — and misbehaves
/// near the poles. Summing the vectors and normalising does not.
///
/// Returns null when the vectors cancel out, which needs points spread over
/// the whole globe and cannot happen inside one cluster.
GeoPoint? centroidOfSum(double sumX, double sumY, double sumZ) {
  final length = math.sqrt(sumX * sumX + sumY * sumY + sumZ * sumZ);
  if (length < 1e-12) return null;

  final z = (sumZ / length).clamp(-1.0, 1.0);
  return GeoPoint(
    math.asin(z) / UnitVector._degToRad,
    math.atan2(sumY, sumX) / UnitVector._degToRad,
  );
}
