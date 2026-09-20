import 'package:been_here/core/geo/bounding_box.dart';
import 'package:been_here/core/geo/geo_point.dart';
import 'package:been_here/core/geo/haversine.dart';
import 'package:been_here/core/geo/unit_vector.dart';
import 'package:been_here/core/time/local_day.dart';
import 'package:been_here/data/db/daos/memories_dao.dart';
import 'package:been_here/domain/memories/memory.dart';
import 'package:been_here/domain/memories/visit.dart';
import 'package:meta/meta.dart';

/// What the app has for one spot.
@immutable
class MemoriesHere {
  const MemoriesHere({
    required this.center,
    required this.radiusMeters,
    required this.visits,
    required this.photoCount,
  });

  const MemoriesHere.empty(this.center, this.radiusMeters)
    : visits = const [],
      photoCount = 0;

  final GeoPoint center;
  final double radiusMeters;

  /// Newest visit first.
  final List<Visit> visits;

  final int photoCount;

  bool get isEmpty => visits.isEmpty;

  Visit? get mostRecent => visits.isEmpty ? null : visits.first;
}

/// The closest thing worth walking to, when there is nothing right here.
@immutable
class NearestMemory {
  const NearestMemory({required this.memory, required this.distanceMeters});

  final Memory memory;
  final double distanceMeters;
}

/// Answers "what did I photograph here, and when".
class MemoriesService {
  MemoriesService({required this.dao, this.localDay = const SystemLocalDay()});

  final MemoriesDao dao;
  final LocalDay localDay;

  /// The visit timeline for a spot.
  ///
  /// Carries counts and dates, not photos — see [photosOf], which the grid
  /// calls per visit as it scrolls.
  Future<MemoriesHere> near(
    GeoPoint center, {
    required double radiusMeters,
  }) async {
    final query = _Circle(center, radiusMeters);
    final seconds = await dao.takenAtWithin(
      boxes: query.boxes,
      center: query.center,
      chordSquared: query.chordSquared,
    );

    final takenAt = [
      for (final s in seconds)
        DateTime.fromMillisecondsSinceEpoch(s * 1000, isUtc: true),
    ];

    return MemoriesHere(
      center: center,
      radiusMeters: radiusMeters,
      visits: groupIntoVisits(takenAt, localDay: localDay),
      photoCount: takenAt.length,
    );
  }

  /// How many photos are within [radiusMeters].
  ///
  /// Counted inside SQLite, so dragging the radius slider costs one cheap
  /// query per step instead of hauling the whole neighbourhood into Dart.
  Future<int> countNear(GeoPoint center, {required double radiusMeters}) {
    final query = _Circle(center, radiusMeters);
    return dao.countWithin(
      boxes: query.boxes,
      center: query.center,
      chordSquared: query.chordSquared,
    );
  }

  /// The photos of one visit, oldest first.
  Future<List<Memory>> photosOf(
    Visit visit, {
    required GeoPoint center,
    required double radiusMeters,
    int? limit,
    int offset = 0,
  }) async {
    final query = _Circle(center, radiusMeters);
    final rows = await dao.photosWithin(
      boxes: query.boxes,
      center: query.center,
      chordSquared: query.chordSquared,
      fromTakenAt: visit.startedAt.millisecondsSinceEpoch ~/ 1000,
      toTakenAt: visit.endedAt.millisecondsSinceEpoch ~/ 1000,
      limit: limit,
      offset: offset,
    );
    return [for (final row in rows) _toMemory(row, center)];
  }

  /// The closest indexed photo outside [fromRadiusMeters], searched in
  /// widening rings so a lonely spot doesn't scan the whole index.
  ///
  /// Phase 3 replaces this with the nearest *place*; a single photo is a
  /// reasonable stand-in until clusters exist.
  Future<NearestMemory?> nearest(
    GeoPoint from, {
    double fromRadiusMeters = 0,
  }) async {
    var radius = fromRadiusMeters < 1000 ? 5000.0 : fromRadiusMeters * 5;
    const halfWayRound = 20100000.0;

    while (true) {
      final query = _Circle(from, radius);
      final row = await dao.closestWithin(
        boxes: query.boxes,
        center: query.center,
        chordSquared: query.chordSquared,
      );
      if (row != null) {
        final memory = _toMemory(row, from);
        return NearestMemory(
          memory: memory,
          distanceMeters: memory.distanceMeters,
        );
      }
      if (radius >= halfWayRound) return null;
      radius = (radius * 5).clamp(0, halfWayRound);
    }
  }

  Memory _toMemory(LocatedPhoto row, GeoPoint center) {
    final point = GeoPoint(row.lat, row.lng);
    return Memory(
      assetId: row.assetId,
      point: point,
      takenAt: DateTime.fromMillisecondsSinceEpoch(
        row.takenAt * 1000,
        isUtc: true,
      ),
      distanceMeters: distanceMeters(center, point),
      width: row.width,
      height: row.height,
    );
  }
}

/// The three things every query needs: the rectangles an index can seek, the
/// centre as a unit vector, and the chord length that is the radius.
@immutable
class _Circle {
  _Circle(GeoPoint center, double radiusMeters)
    : boxes = boundingBoxAround(center, radiusMeters).split(),
      center = UnitVector.of(center),
      chordSquared = chordSquaredForRadius(radiusMeters);

  final List<BoundingBox> boxes;
  final UnitVector center;
  final double chordSquared;
}
