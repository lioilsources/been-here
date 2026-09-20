import 'package:been_here/data/db/database.dart';
import 'package:been_here/data/db/tables.dart';
import 'package:drift/drift.dart';

part 'photos_dao.g.dart';

@DriftAccessor(tables: [Photos, ScanSeen])
class PhotosDao extends DatabaseAccessor<AppDatabase> with _$PhotosDaoMixin {
  PhotosDao(super.attachedDatabase);

  Future<int> count() {
    final total = photos.assetId.count();
    return (selectOnly(
      photos,
    )..addColumns([total])).map((row) => row.read(total)!).getSingle();
  }

  /// How many indexed photos carry usable coordinates. Drives the "X % of
  /// your photos have a location" line in settings.
  Future<int> countWithLocation() {
    final total = photos.assetId.count();
    return (selectOnly(photos)
          ..addColumns([total])
          ..where(photos.lat.isNotNull() & photos.lng.isNotNull()))
        .map((row) => row.read(total)!)
        .getSingle();
  }

  /// Which of [candidates] the index already knows.
  Future<Set<String>> existingIds(List<String> candidates) async {
    if (candidates.isEmpty) return const {};
    final rows =
        await (selectOnly(photos)
              ..addColumns([photos.assetId])
              ..where(photos.assetId.isIn(candidates)))
            .get();
    return rows.map((row) => row.read(photos.assetId)!).toSet();
  }

  /// Inserts rows the index does not have yet.
  ///
  /// Deliberately "or ignore", not "or replace": an existing row may already
  /// carry a `place_id` from clustering, and re-indexing must never throw
  /// that away. Photos edited in the system library are not re-read — that is
  /// out of MVP scope.
  Future<void> insertMissing(List<PhotosCompanion> rows) {
    if (rows.isEmpty) return Future.value();
    return batch(
      (b) => b.insertAll(photos, rows, mode: InsertMode.insertOrIgnore),
    );
  }

  Future<void> markSeen(List<String> ids) {
    if (ids.isEmpty) return Future.value();
    return batch(
      (b) => b.insertAll(
        scanSeen,
        [for (final id in ids) ScanSeenCompanion.insert(assetId: id)],
        mode: InsertMode.insertOrIgnore,
      ),
    );
  }

  Future<void> clearSeen() => delete(scanSeen).go();

  Future<int> seenCount() {
    final total = scanSeen.assetId.count();
    return (selectOnly(
      scanSeen,
    )..addColumns([total])).map((row) => row.read(total)!).getSingle();
  }

  /// Removes indexed photos the library no longer reports.
  ///
  /// Runs entirely inside SQLite so the id set never has to exist in Dart
  /// memory. Only meaningful right after a pass walked the whole library.
  Future<int> deleteUnseen() => customUpdate(
    'DELETE FROM photos '
    'WHERE asset_id NOT IN (SELECT asset_id FROM scan_seen)',
    updates: {photos},
    updateKind: UpdateKind.delete,
  );

  Future<List<PhotoRow>> all() => select(photos).get();

  Future<PhotoRow?> byId(String assetId) => (select(
    photos,
  )..where((p) => p.assetId.equals(assetId))).getSingleOrNull();

  Future<void> deleteAll() => delete(photos).go();
}
