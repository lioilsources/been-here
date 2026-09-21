import 'package:been_here/core/geo/bounding_box.dart';
import 'package:been_here/core/geo/unit_vector.dart';
import 'package:been_here/data/db/database.dart';
import 'package:been_here/data/db/tables.dart';
import 'package:drift/drift.dart';

part 'memories_dao.g.dart';

/// The minimum a photo has to carry to be drawn in a grid.
typedef LocatedPhoto = ({
  String assetId,
  double lat,
  double lng,
  int takenAt,
  int width,
  int height,
});

/// The "what do I have here" query.
///
/// Every method here is the same shape: the `(lat, lng)` index narrows to a
/// rectangle, then a squared-chord comparison against the unit-sphere columns
/// cuts the exact circle — see [UnitVector] for why that is exact rather than
/// an approximation.
///
/// The methods differ only in how much they carry back across the channel,
/// and that turns out to be the whole cost of the query: on a hundred
/// thousand rows, counting a dense neighbourhood takes about 10 ms, fetching
/// its timestamps about 19 ms, and fetching whole rows with their asset ids
/// about 60 ms. So the screen counts and groups without ever loading the
/// photos, and loads a visit's photos only when it is on screen.
@DriftAccessor(tables: [Photos])
class MemoriesDao extends DatabaseAccessor<AppDatabase>
    with _$MemoriesDaoMixin {
  MemoriesDao(super.attachedDatabase);

  /// How many located photos are inside the circle.
  Future<int> countWithin({
    required List<BoundingBox> boxes,
    required UnitVector center,
    required double chordSquared,
  }) async {
    if (boxes.isEmpty) return 0;
    final circle = _circle(boxes, center, chordSquared);
    final row = await customSelect(
      'SELECT count(*) AS c FROM photos WHERE ${circle.where}',
      variables: circle.variables,
      readsFrom: {photos},
    ).getSingle();
    return row.read<int>('c');
  }

  /// Capture times of every photo inside the circle, unix seconds UTC,
  /// oldest first.
  ///
  /// One integer per photo is all the visit grouping needs.
  ///
  /// Hand-written SQL rather than drift's query builder, and it is worth the
  /// asymmetry: on a dense neighbourhood this returns tens of thousands of
  /// rows, and building drift's typed result objects for them costs more than
  /// the query itself — 66 ms versus 19 ms for the same 16.5k photos.
  Future<List<int>> takenAtWithin({
    required List<BoundingBox> boxes,
    required UnitVector center,
    required double chordSquared,
  }) async {
    if (boxes.isEmpty) return const [];
    final circle = _circle(boxes, center, chordSquared);
    final rows = await customSelect(
      'SELECT taken_at FROM photos WHERE ${circle.where} ORDER BY taken_at',
      variables: circle.variables,
      readsFrom: {photos},
    ).get();
    return [for (final row in rows) row.read<int>('taken_at')];
  }

  /// Where the photos inside the circle are, and nothing else.
  ///
  /// Two doubles per photo: a map needs no asset ids, no sizes and no dates,
  /// and this is the one query that can be asked for thousands of rows at
  /// once. Newest first, so a [limit] keeps the most recent ones.
  Future<List<({double lat, double lng})>> pointsWithin({
    required List<BoundingBox> boxes,
    required UnitVector center,
    required double chordSquared,
    int limit = 2000,
  }) async {
    if (boxes.isEmpty) return const [];
    final circle = _circle(boxes, center, chordSquared);
    final rows = await customSelect(
      'SELECT lat, lng FROM photos WHERE ${circle.where} '
      'ORDER BY taken_at DESC LIMIT ?',
      variables: [...circle.variables, Variable.withInt(limit)],
      readsFrom: {photos},
    ).get();
    return [
      for (final row in rows)
        (lat: row.read<double>('lat'), lng: row.read<double>('lng')),
    ];
  }

  /// The rectangles an index can seek plus the exact circle, as SQL.
  ({String where, List<Variable<Object>> variables}) _circle(
    List<BoundingBox> boxes,
    UnitVector center,
    double chordSquared,
  ) {
    final variables = <Variable<Object>>[];
    final clauses = <String>[];

    for (final box in boxes) {
      clauses.add('(lat >= ? AND lat <= ? AND lng >= ? AND lng <= ?)');
      variables
        ..add(Variable.withReal(box.minLat))
        ..add(Variable.withReal(box.maxLat))
        ..add(Variable.withReal(box.minLng))
        ..add(Variable.withReal(box.maxLng));
    }

    variables
      ..add(Variable.withReal(center.x))
      ..add(Variable.withReal(center.x))
      ..add(Variable.withReal(center.y))
      ..add(Variable.withReal(center.y))
      ..add(Variable.withReal(center.z))
      ..add(Variable.withReal(center.z))
      ..add(Variable.withReal(chordSquared));

    return (
      where:
          '(${clauses.join(' OR ')}) AND '
          '(x - ?) * (x - ?) + (y - ?) * (y - ?) + (z - ?) * (z - ?) <= ?',
      variables: variables,
    );
  }

  /// Photos inside the circle, optionally limited to a time range.
  ///
  /// Ordered oldest first, which is the order a visit is read in.
  Future<List<LocatedPhoto>> photosWithin({
    required List<BoundingBox> boxes,
    required UnitVector center,
    required double chordSquared,
    int? fromTakenAt,
    int? toTakenAt,
    int? limit,
    int offset = 0,
  }) async {
    if (boxes.isEmpty) return const [];

    var where = _within(boxes, center, chordSquared);
    if (fromTakenAt != null) {
      where = where & photos.takenAt.isBiggerOrEqualValue(fromTakenAt);
    }
    if (toTakenAt != null) {
      where = where & photos.takenAt.isSmallerOrEqualValue(toTakenAt);
    }

    final query = selectOnly(photos)
      ..addColumns([
        photos.assetId,
        photos.lat,
        photos.lng,
        photos.takenAt,
        photos.width,
        photos.height,
      ])
      ..where(where)
      ..orderBy([OrderingTerm.asc(photos.takenAt)]);
    if (limit != null) query.limit(limit, offset: offset);

    final rows = await query.get();
    return [
      for (final row in rows)
        (
          assetId: row.read(photos.assetId)!,
          lat: row.read(photos.lat)!,
          lng: row.read(photos.lng)!,
          takenAt: row.read(photos.takenAt)!,
          width: row.read(photos.width)!,
          height: row.read(photos.height)!,
        ),
    ];
  }

  /// The single closest photo inside the circle, or null if there is none.
  Future<LocatedPhoto?> closestWithin({
    required List<BoundingBox> boxes,
    required UnitVector center,
    required double chordSquared,
  }) async {
    if (boxes.isEmpty) return null;

    final distance = _chordSquared(center);
    final query = selectOnly(photos)
      ..addColumns([
        photos.assetId,
        photos.lat,
        photos.lng,
        photos.takenAt,
        photos.width,
        photos.height,
        distance,
      ])
      ..where(_within(boxes, center, chordSquared))
      ..orderBy([OrderingTerm.asc(distance)])
      ..limit(1);

    final row = await query.getSingleOrNull();
    if (row == null) return null;
    return (
      assetId: row.read(photos.assetId)!,
      lat: row.read(photos.lat)!,
      lng: row.read(photos.lng)!,
      takenAt: row.read(photos.takenAt)!,
      width: row.read(photos.width)!,
      height: row.read(photos.height)!,
    );
  }

  Expression<bool> _within(
    List<BoundingBox> boxes,
    UnitVector center,
    double chordSquared,
  ) {
    var inAnyBox = _inBox(boxes.first);
    for (final box in boxes.skip(1)) {
      inAnyBox = inAnyBox | _inBox(box);
    }
    return inAnyBox & _chordSquared(center).isSmallerOrEqualValue(chordSquared);
  }

  Expression<bool> _inBox(BoundingBox box) =>
      photos.lat.isBiggerOrEqualValue(box.minLat) &
      photos.lat.isSmallerOrEqualValue(box.maxLat) &
      photos.lng.isBiggerOrEqualValue(box.minLng) &
      photos.lng.isSmallerOrEqualValue(box.maxLng);

  /// `(x-cx)² + (y-cy)² + (z-cz)²` as SQL.
  Expression<double> _chordSquared(UnitVector center) {
    Expression<double> squaredDelta(
      GeneratedColumn<double> column,
      double value,
    ) {
      final delta = column - Variable<double>(value);
      return delta * delta;
    }

    return squaredDelta(photos.x, center.x) +
        squaredDelta(photos.y, center.y) +
        squaredDelta(photos.z, center.z);
  }
}
