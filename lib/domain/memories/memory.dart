import 'package:been_here/core/geo/geo_point.dart';
import 'package:meta/meta.dart';

/// One indexed photo, seen from somewhere.
@immutable
class Memory {
  const Memory({
    required this.assetId,
    required this.point,
    required this.takenAt,
    required this.distanceMeters,
    required this.width,
    required this.height,
  });

  final String assetId;
  final GeoPoint point;

  /// Capture time, UTC. Turned into a local calendar day only when grouping.
  final DateTime takenAt;

  /// Distance from wherever the query was centred.
  final double distanceMeters;

  final int width;
  final int height;

  double get aspectRatio => height == 0 ? 1 : width / height;

  @override
  bool operator ==(Object other) =>
      other is Memory &&
      other.assetId == assetId &&
      other.takenAt == takenAt &&
      other.distanceMeters == distanceMeters;

  @override
  int get hashCode => Object.hash(assetId, takenAt, distanceMeters);

  @override
  String toString() =>
      'Memory($assetId at $takenAt, '
      '${distanceMeters.round()}m away)';
}
