import 'package:been_here/core/geo/geo_point.dart';
import 'package:meta/meta.dart';

/// One photo as a dot on a map: where it was taken, and enough to find it
/// again when someone taps it.
///
/// Deliberately smaller than a `Memory`: the map draws hundreds of these at
/// once and needs neither the size of the picture nor its distance from
/// anywhere.
@immutable
class MapPhoto {
  const MapPhoto({
    required this.assetId,
    required this.point,
    required this.takenAt,
  });

  final String assetId;
  final GeoPoint point;

  /// UTC. Which visit a dot belongs to is decided by when it was taken.
  final DateTime takenAt;

  @override
  bool operator ==(Object other) =>
      other is MapPhoto &&
      other.assetId == assetId &&
      other.point == point &&
      other.takenAt == takenAt;

  @override
  int get hashCode => Object.hash(assetId, point, takenAt);

  @override
  String toString() => 'MapPhoto($assetId at $point)';
}
