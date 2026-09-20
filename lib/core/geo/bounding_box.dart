import 'dart:math' as math;

import 'package:been_here/core/geo/geo_point.dart';
import 'package:been_here/core/geo/haversine.dart';
import 'package:meta/meta.dart';

/// An axis-aligned latitude/longitude rectangle used to pre-filter photos
/// through the `lat`/`lng` indexes before the exact haversine pass.
///
/// A box may wrap across the antimeridian, in which case [minLng] is greater
/// than [maxLng]. Use [split] before turning it into a SQL `BETWEEN`.
@immutable
class BoundingBox {
  const BoundingBox({
    required this.minLat,
    required this.maxLat,
    required this.minLng,
    required this.maxLng,
  });

  final double minLat;
  final double maxLat;
  final double minLng;
  final double maxLng;

  /// True when the box spans the ±180° meridian.
  bool get crossesAntimeridian => minLng > maxLng;

  /// One or two non-wrapping boxes covering the same area.
  List<BoundingBox> split() {
    if (!crossesAntimeridian) return [this];
    return [
      BoundingBox(
        minLat: minLat,
        maxLat: maxLat,
        minLng: minLng,
        maxLng: 180,
      ),
      BoundingBox(
        minLat: minLat,
        maxLat: maxLat,
        minLng: -180,
        maxLng: maxLng,
      ),
    ];
  }

  bool contains(GeoPoint p) {
    if (p.lat < minLat || p.lat > maxLat) return false;
    if (crossesAntimeridian) {
      return p.lng >= minLng || p.lng <= maxLng;
    }
    return p.lng >= minLng && p.lng <= maxLng;
  }

  @override
  bool operator ==(Object other) =>
      other is BoundingBox &&
      other.minLat == minLat &&
      other.maxLat == maxLat &&
      other.minLng == minLng &&
      other.maxLng == maxLng;

  @override
  int get hashCode => Object.hash(minLat, maxLat, minLng, maxLng);

  @override
  String toString() => 'BoundingBox($minLat..$maxLat, $minLng..$maxLng)';
}

/// Smallest box guaranteed to contain every point within [radiusMeters]
/// of [center].
///
/// Near a pole, or when the radius is large enough to wrap the globe, the
/// longitude span widens to the full -180..180 range rather than producing a
/// box that would miss points.
BoundingBox boundingBoxAround(GeoPoint center, double radiusMeters) {
  final radius = math.max(0, radiusMeters);
  final latDelta = radius / metersPerDegreeLatitude;

  final minLat = (center.lat - latDelta).clamp(-90, 90).toDouble();
  final maxLat = (center.lat + latDelta).clamp(-90, 90).toDouble();

  // Longitude degrees per metre are worst (largest) at the latitude of the
  // box edge closest to a pole, so widen using that edge.
  final worstLat = math.max(minLat.abs(), maxLat.abs());
  if (worstLat >= 90) {
    return BoundingBox(
      minLat: minLat,
      maxLat: maxLat,
      minLng: -180,
      maxLng: 180,
    );
  }

  final metersPerDegree = metersPerDegreeLongitude(worstLat);
  if (metersPerDegree <= 0) {
    return BoundingBox(
      minLat: minLat,
      maxLat: maxLat,
      minLng: -180,
      maxLng: 180,
    );
  }

  final lngDelta = radius / metersPerDegree;
  if (lngDelta >= 180) {
    return BoundingBox(
      minLat: minLat,
      maxLat: maxLat,
      minLng: -180,
      maxLng: 180,
    );
  }

  return BoundingBox(
    minLat: minLat,
    maxLat: maxLat,
    minLng: normalizeLongitude(center.lng - lngDelta),
    maxLng: normalizeLongitude(center.lng + lngDelta),
  );
}
