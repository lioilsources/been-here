import 'package:been_here/data/db/database.dart';
import 'package:been_here/data/db/tables.dart';
import 'package:drift/drift.dart';

part 'rephotos_dao.g.dart';

@DriftAccessor(tables: [Rephotos])
class RephotosDao extends DatabaseAccessor<AppDatabase>
    with _$RephotosDaoMixin {
  RephotosDao(super.attachedDatabase);

  Future<int> record({
    required String originalAssetId,
    required String newAssetId,
    required DateTime at,
    int? placeId,
  }) => into(rephotos).insert(
    RephotosCompanion.insert(
      originalAssetId: originalAssetId,
      newAssetId: newAssetId,
      placeId: Value(placeId),
      createdAt: at.toUtc().millisecondsSinceEpoch ~/ 1000,
    ),
  );

  /// Every answer to one photo, newest first.
  Future<List<RephotoRow>> forOriginal(String originalAssetId) =>
      (select(rephotos)
            ..where((r) => r.originalAssetId.equals(originalAssetId))
            ..orderBy([(r) => OrderingTerm.desc(r.createdAt)]))
          .get();

  Future<List<RephotoRow>> all() => (select(
    rephotos,
  )..orderBy([(r) => OrderingTerm.desc(r.createdAt)])).get();

  Future<int> count() {
    final total = rephotos.id.count();
    return (selectOnly(
      rephotos,
    )..addColumns([total])).map((row) => row.read(total)!).getSingle();
  }
}
