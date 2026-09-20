import 'package:meta/meta.dart';

/// A WGS84 coordinate. Latitude in [-90, 90], longitude in [-180, 180].
@immutable
class GeoPoint {
  const GeoPoint(this.lat, this.lng);

  final double lat;
  final double lng;

  /// True when both components are inside the valid WGS84 range.
  bool get isValid =>
      lat >= -90 &&
      lat <= 90 &&
      lng >= -180 &&
      lng <= 180 &&
      !lat.isNaN &&
      !lng.isNaN;

  @override
  bool operator ==(Object other) =>
      other is GeoPoint && other.lat == lat && other.lng == lng;

  @override
  int get hashCode => Object.hash(lat, lng);

  @override
  String toString() =>
      'GeoPoint(${lat.toStringAsFixed(6)}, ${lng.toStringAsFixed(6)})';
}

/// Normalises [lng] into [-180, 180), wrapping across the antimeridian.
double normalizeLongitude(double lng) {
  if (lng >= -180 && lng < 180) return lng;
  final wrapped = (lng + 180) % 360;
  return (wrapped < 0 ? wrapped + 360 : wrapped) - 180;
}
