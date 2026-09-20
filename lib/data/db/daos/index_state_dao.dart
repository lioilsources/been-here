import 'package:been_here/data/db/database.dart';
import 'package:been_here/data/db/tables.dart';
import 'package:drift/drift.dart';

part 'index_state_dao.g.dart';

/// Keys used by the indexer. Stable strings — they outlive app versions.
abstract final class IndexStateKeys {
  /// Unix seconds of the last pass that walked the whole library.
  static const String lastFullScan = 'last_full_scan';

  /// Unix seconds of the last completed pass of any kind.
  static const String lastSync = 'last_sync';

  /// How far the pass in flight got, as an offset into the library listing.
  static const String scanCursor = 'scan_cursor';

  /// Library asset count when the pass in flight started. If the count has
  /// moved since, the offsets are no longer trustworthy and the pass restarts.
  static const String scanTotal = 'scan_total';
}

@DriftAccessor(tables: [IndexState])
class IndexStateDao extends DatabaseAccessor<AppDatabase>
    with _$IndexStateDaoMixin {
  IndexStateDao(super.attachedDatabase);

  Future<String?> read(String key) async {
    final row = await (select(
      indexState,
    )..where((t) => t.key.equals(key))).getSingleOrNull();
    return row?.value;
  }

  Future<void> write(String key, String value) => into(indexState).insert(
    IndexStateCompanion.insert(key: key, value: value),
    mode: InsertMode.insertOrReplace,
  );

  Future<void> remove(String key) =>
      (delete(indexState)..where((t) => t.key.equals(key))).go();

  Future<int?> readInt(String key) async {
    final value = await read(key);
    return value == null ? null : int.tryParse(value);
  }

  Future<void> writeInt(String key, int value) => write(key, '$value');
}
