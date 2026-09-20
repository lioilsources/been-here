import 'package:been_here/data/db/database.dart';
import 'package:been_here/data/db/tables.dart';
import 'package:been_here/domain/places/mute_state.dart';
import 'package:been_here/domain/places/place_cluster.dart';
import 'package:drift/drift.dart';

part 'places_dao.g.dart';

@DriftAccessor(tables: [Places, PlaceCells, Photos])
class PlacesDao extends DatabaseAccessor<AppDatabase> with _$PlacesDaoMixin {
  PlacesDao(super.attachedDatabase);

  /// One row per occupied geohash cell, summarised.
  ///
  /// A hundred thousand photos collapse to a few thousand cells here, which
  /// is what makes recomputing every place from scratch affordable enough
  /// that incremental clustering isn't worth its complexity.
  ///
  /// [utcOffsetSeconds] buckets capture times into local days. A fixed offset
  /// misplaces photos taken within an hour of midnight in the other half of
  /// the year — which cannot move a thirty-day threshold, and is the price of
  /// counting days inside SQLite instead of hauling every photo into Dart.
  Future<List<CellStats>> cellStats({required int utcOffsetSeconds}) async {
    final aggregates = await customSelect(
      'SELECT geohash, COUNT(*) AS photos, '
      'MIN(taken_at) AS first_at, MAX(taken_at) AS last_at, '
      'SUM(x) AS sx, SUM(y) AS sy, SUM(z) AS sz '
      'FROM photos WHERE geohash IS NOT NULL AND x IS NOT NULL '
      'GROUP BY geohash',
      readsFrom: {photos},
    ).get();
    if (aggregates.isEmpty) return const [];

    final dayRows = await customSelect(
      'SELECT DISTINCT geohash, '
      'CAST((taken_at + ?1) / 86400 AS INTEGER) AS day '
      'FROM photos WHERE geohash IS NOT NULL AND x IS NOT NULL',
      variables: [Variable.withInt(utcOffsetSeconds)],
      readsFrom: {photos},
    ).get();

    final days = <String, Set<int>>{};
    for (final row in dayRows) {
      days
          .putIfAbsent(row.read<String>('geohash'), () => <int>{})
          .add(row.read<int>('day'));
    }

    return [
      for (final row in aggregates)
        CellStats(
          geohash: row.read<String>('geohash'),
          photoCount: row.read<int>('photos'),
          firstAt: row.read<int>('first_at'),
          lastAt: row.read<int>('last_at'),
          sumX: row.read<double>('sx'),
          sumY: row.read<double>('sy'),
          sumZ: row.read<double>('sz'),
          days: days[row.read<String>('geohash')] ?? const {},
        ),
    ];
  }

  /// Which place each cell currently belongs to.
  Future<Map<String, int>> cellOwners() async {
    final rows = await select(placeCells).get();
    return {for (final row in rows) row.geohash: row.placeId};
  }

  Future<List<PlaceRow>> all() =>
      (select(places)..orderBy([(p) => OrderingTerm.desc(p.photoCount)])).get();

  Future<PlaceRow?> byId(int id) =>
      (select(places)..where((p) => p.id.equals(id))).getSingleOrNull();

  Future<int> insertPlace(PlacesCompanion place) => into(places).insert(place);

  Future<void> updatePlace(int id, PlacesCompanion changes) =>
      (update(places)..where((p) => p.id.equals(id))).write(changes);

  Future<void> deletePlaces(Iterable<int> ids) async {
    if (ids.isEmpty) return;
    await (delete(places)..where((p) => p.id.isIn(ids))).go();
  }

  /// Replaces the cell map wholesale.
  Future<void> replaceCells(Map<String, int> cellToPlace) async {
    await delete(placeCells).go();
    if (cellToPlace.isEmpty) return;
    await batch(
      (b) => b.insertAll(placeCells, [
        for (final entry in cellToPlace.entries)
          PlaceCellsCompanion.insert(
            geohash: entry.key,
            placeId: entry.value,
          ),
      ]),
    );
  }

  /// Points every photo at the place its cell belongs to, in one statement.
  Future<void> assignPhotosToPlaces() => customUpdate(
    'UPDATE photos SET place_id = '
    '(SELECT place_id FROM place_cells WHERE place_cells.geohash = '
    'photos.geohash)',
    updates: {photos},
  );

  Future<void> setMute(int placeId, MuteState mute) =>
      updatePlace(placeId, PlacesCompanion(mute: Value(mute)));

  /// Drops every reverse-geocoded name.
  Future<void> clearLabels() =>
      update(places).write(const PlacesCompanion(label: Value(null)));

  Future<int> count() {
    final total = places.id.count();
    return (selectOnly(
      places,
    )..addColumns([total])).map((row) => row.read(total)!).getSingle();
  }
}
