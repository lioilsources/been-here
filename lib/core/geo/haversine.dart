import 'dart:math' as math;

import 'package:been_here/core/geo/geo_point.dart';

/// IUGG mean Earth radius in metres.
const double earthRadiusMeters = 6371008.8;

const double _degToRad = math.pi / 180;

/// Great-circle distance between [a] and [b] in metres.
///
/// Accurate to ~0.5% at any distance, which is far below the precision our
/// radius slider and place clustering need.
double distanceMeters(GeoPoint a, GeoPoint b) {
  final lat1 = a.lat * _degToRad;
  final lat2 = b.lat * _degToRad;
  final dLat = (b.lat - a.lat) * _degToRad;
  final dLng = (b.lng - a.lng) * _degToRad;

  final sinDLat = math.sin(dLat / 2);
  final sinDLng = math.sin(dLng / 2);

  final h =
      sinDLat * sinDLat + math.cos(lat1) * math.cos(lat2) * sinDLng * sinDLng;
  // Clamp guards against h slipping just above 1 through rounding.
  return 2 * earthRadiusMeters * math.asin(math.sqrt(math.min(1, h)));
}

/// Metres per degree of latitude. Constant everywhere on the sphere.
double get metersPerDegreeLatitude => earthRadiusMeters * _degToRad;

/// Metres per degree of longitude at [latitude]. Shrinks towards the poles.
double metersPerDegreeLongitude(double latitude) =>
    earthRadiusMeters * _degToRad * math.cos(latitude * _degToRad);
