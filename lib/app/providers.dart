import 'package:been_here/data/db/database.dart';
import 'package:been_here/data/photos/photo_library.dart';
import 'package:been_here/data/photos/photo_manager_library.dart';
import 'package:been_here/domain/indexing/index_progress.dart';
import 'package:been_here/domain/indexing/indexer_service.dart';
import 'package:been_here/domain/indexing/library_sync.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// The on-device index. Single instance for the lifetime of the app.
final databaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(db.close);
  return db;
});

/// The system photo library. Overridden with a fake in tests.
final photoLibraryProvider = Provider<PhotoLibrary>((ref) {
  final library = PhotoManagerLibrary();
  ref.onDispose(library.dispose);
  return library;
});

final indexerProvider = Provider<IndexerService>((ref) {
  final db = ref.watch(databaseProvider);
  final indexer = IndexerService(
    library: ref.watch(photoLibraryProvider),
    photos: db.photosDao,
    state: db.indexStateDao,
  );
  ref.onDispose(indexer.dispose);
  return indexer;
});

/// Current indexing state, starting from whatever the indexer already knows
/// so a rebuild doesn't flash an empty state.
final indexProgressProvider = StreamProvider<IndexProgress>((ref) async* {
  final indexer = ref.watch(indexerProvider);
  yield indexer.current;
  yield* indexer.progress;
});

/// Permission as the library currently reports it. Refresh after prompting.
final photoPermissionProvider = FutureProvider<PhotoPermission>((ref) {
  return ref.watch(photoLibraryProvider).currentPermission();
});

/// How many photos are indexed, and how many of them have coordinates.
final indexStatsProvider = FutureProvider<IndexStats>((ref) async {
  // Recomputed whenever a pass reports progress.
  ref.watch(indexProgressProvider);
  final db = ref.watch(databaseProvider);
  final total = await db.photosDao.count();
  final located = await db.photosDao.countWithLocation();
  return IndexStats(total: total, withLocation: located);
});

class IndexStats {
  const IndexStats({required this.total, required this.withLocation});

  final int total;
  final int withLocation;

  bool get isEmpty => total == 0;

  /// 0..100, rounded. Zero when nothing is indexed.
  int get locationPercent =>
      total == 0 ? 0 : (withLocation * 100 / total).round();
}

/// Starts the startup pass and keeps listening for library changes.
///
/// Watch it from the first screen that needs an index; keeping it alive is
/// what keeps the sync running.
final librarySyncProvider = Provider<LibrarySync>((ref) {
  final sync = LibrarySync(
    library: ref.watch(photoLibraryProvider),
    indexer: ref.watch(indexerProvider),
  );
  ref.onDispose(sync.dispose);
  return sync;
});
