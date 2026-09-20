import 'dart:math' as math;

import 'package:been_here/core/geo/bounding_box.dart';
import 'package:been_here/core/geo/geo_point.dart';
import 'package:been_here/core/geo/geohash.dart';
import 'package:been_here/core/geo/haversine.dart';
import 'package:been_here/core/geo/unit_vector.dart';
import 'package:been_here/domain/memories/visit.dart';
import 'package:meta/meta.dart';

/// Smallest and largest a place is allowed to be.
///
/// A single photo would otherwise be a place of radius zero, and a component
/// spanning a whole valley would be a place you could never arrive at.
const double minPlaceRadiusMeters = 100;
const double maxPlaceRadiusMeters = 500;

/// What one geohash cell holds, as the database can summarise it.
///
/// Clustering works from these rather than from photos: a hundred thousand
/// photos collapse into a few thousand cells, and the whole recompute then
/// fits in memory and in a few milliseconds.
@immutable
class CellStats {
  const CellStats({
    required this.geohash,
    required this.photoCount,
    required this.firstAt,
    required this.lastAt,
    required this.sumX,
    required this.sumY,
    required this.sumZ,
    required this.days,
  });

  final String geohash;
  final int photoCount;

  /// Unix seconds UTC.
  final int firstAt;
  final int lastAt;

  /// Summed unit vectors of the photos in this cell, for the centroid.
  final double sumX;
  final double sumY;
  final double sumZ;

  /// Local day numbers this cell has photos on.
  final Set<int> days;
}

/// A place: one or more adjacent cells that hold photos.
@immutable
class PlaceCluster {
  const PlaceCluster({
    required this.cells,
    required this.center,
    required this.radiusMeters,
    required this.photoCount,
    required this.distinctDays,
    required this.visitCount,
    required this.firstAt,
    required this.lastAt,
  });

  /// The geohash cells this place is made of, sorted. Doubles as its
  /// identity across recomputes.
  final List<String> cells;

  final GeoPoint center;
  final double radiusMeters;
  final int photoCount;

  /// Distinct local days with a photo here — what the auto-mute rule reads.
  final int distinctDays;

  /// How many separate times you came here.
  ///
  /// Runs of consecutive days count once: a week's holiday is one visit, not
  /// seven. Same rule as the Here timeline, so the two never disagree.
  final int visitCount;

  /// Unix seconds UTC.
  final int firstAt;
  final int lastAt;

  @override
  String toString() =>
      'PlaceCluster($center ±${radiusMeters.round()}m, $photoCount photos, '
      '$visitCount visits over $distinctDays days, ${cells.length} cells)';
}

/// Groups occupied cells into places.
///
/// Adjacent occupied cells (the eight around each one) belong together; the
/// result is the connected components of that graph. Simple on purpose — the
/// plan keeps DBSCAN in reserve for when this stops being good enough.
List<PlaceCluster> clusterCells(Iterable<CellStats> cells) {
  final byHash = {for (final cell in cells) cell.geohash: cell};
  if (byHash.isEmpty) return const [];

  final parent = <String, String>{for (final hash in byHash.keys) hash: hash};

  String find(String hash) {
    var root = hash;
    while (parent[root] != root) {
      root = parent[root]!;
    }
    // Path compression, so a long chain of cells doesn't make this quadratic.
    var current = hash;
    while (parent[current] != root) {
      final next = parent[current]!;
      parent[current] = root;
      current = next;
    }
    return root;
  }

  void union(String a, String b) {
    final rootA = find(a);
    final rootB = find(b);
    if (rootA != rootB) parent[rootB] = rootA;
  }

  for (final hash in byHash.keys) {
    for (final neighbor in geohashNeighbors(hash)) {
      if (byHash.containsKey(neighbor)) union(hash, neighbor);
    }
  }

  final components = <String, List<CellStats>>{};
  for (final entry in byHash.entries) {
    components.putIfAbsent(find(entry.key), () => []).add(entry.value);
  }

  final places = <PlaceCluster>[];
  for (final component in components.values) {
    final place = _toPlace(component);
    if (place != null) places.add(place);
  }

  places.sort((a, b) => b.photoCount.compareTo(a.photoCount));
  return places;
}

PlaceCluster? _toPlace(List<CellStats> component) {
  var sumX = 0.0;
  var sumY = 0.0;
  var sumZ = 0.0;
  var photoCount = 0;
  var firstAt = component.first.firstAt;
  var lastAt = component.first.lastAt;
  final days = <int>{};

  for (final cell in component) {
    sumX += cell.sumX;
    sumY += cell.sumY;
    sumZ += cell.sumZ;
    photoCount += cell.photoCount;
    firstAt = math.min(firstAt, cell.firstAt);
    lastAt = math.max(lastAt, cell.lastAt);
    days.addAll(cell.days);
  }

  final center = centroidOfSum(sumX, sumY, sumZ);
  if (center == null) return null;

  final cells = [for (final cell in component) cell.geohash]..sort();

  return PlaceCluster(
    cells: cells,
    center: center,
    radiusMeters: _radiusOf(center, cells),
    photoCount: photoCount,
    distinctDays: days.length,
    visitCount: countVisits(days),
    firstAt: firstAt,
    lastAt: lastAt,
  );
}

/// How many separate visits a set of day numbers represents.
///
/// Consecutive days belong to the same visit, the same way the Here timeline
/// groups them — otherwise a long weekend at the cottage would read as three
/// trips.
int countVisits(Set<int> days) {
  if (days.isEmpty) return 0;
  final sorted = days.toList()..sort();

  var visits = 1;
  for (var i = 1; i < sorted.length; i++) {
    if (sorted[i] - sorted[i - 1] > maxVisitGapDays) visits++;
  }
  return visits;
}

/// Far enough out to cover every cell, then clamped.
///
/// Measured to the cells' corners rather than to the photos: the photos are
/// never loaded, and a cell is only ~150 m across, so the overshoot is
/// smaller than the clamp anyway.
double _radiusOf(GeoPoint center, List<String> cells) {
  var radius = 0.0;
  for (final cell in cells) {
    final bounds = decodeGeohashBounds(cell);
    for (final corner in _cornersOf(bounds)) {
      radius = math.max(radius, distanceMeters(center, corner));
    }
  }
  return radius.clamp(minPlaceRadiusMeters, maxPlaceRadiusMeters);
}

List<GeoPoint> _cornersOf(BoundingBox box) => [
  GeoPoint(box.minLat, box.minLng),
  GeoPoint(box.minLat, box.maxLng),
  GeoPoint(box.maxLat, box.minLng),
  GeoPoint(box.maxLat, box.maxLng),
];
