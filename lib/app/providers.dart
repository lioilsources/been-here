import 'package:been_here/core/geo/geo_point.dart';
import 'package:been_here/data/db/database.dart';
import 'package:been_here/data/location/geolocator_location_service.dart';
import 'package:been_here/data/location/location_service.dart';
import 'package:been_here/data/photos/photo_library.dart';
import 'package:been_here/data/photos/photo_manager_library.dart';
import 'package:been_here/domain/indexing/index_progress.dart';
import 'package:been_here/domain/indexing/indexer_service.dart';
import 'package:been_here/domain/indexing/library_sync.dart';
import 'package:been_here/domain/memories/memories_service.dart';
import 'package:been_here/domain/memories/memory.dart';
import 'package:been_here/domain/memories/visit.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meta/meta.dart';

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

// --- Location ---------------------------------------------------------------

final locationServiceProvider = Provider<LocationService>(
  (ref) => GeolocatorLocationService(),
);

final locationPermissionProvider = FutureProvider<LocationPermissionState>(
  (ref) => ref.watch(locationServiceProvider).currentPermission(),
);

/// A pretend position, set from the debug sheet.
///
/// The plan calls for it so the Here screen can be tested from the sofa, and
/// it is the only way to see a memory from a place you are not standing in.
class DebugLocation extends Notifier<GeoPoint?> {
  @override
  GeoPoint? build() => null;

  GeoPoint? get point => state;

  /// Null hands the screen back to the real device location.
  set point(GeoPoint? value) => state = value;
}

final debugLocationProvider = NotifierProvider<DebugLocation, GeoPoint?>(
  DebugLocation.new,
);

/// Where the Here screen is looking: the debug override if there is one,
/// otherwise the device's own fix.
final currentLocationProvider = FutureProvider<GeoPoint?>((ref) async {
  final override = ref.watch(debugLocationProvider);
  if (override != null) return override;

  final permission = await ref.watch(locationPermissionProvider.future);
  if (!permission.canLocate) return null;

  final fix = await ref.watch(locationServiceProvider).currentLocation();
  return fix?.point;
});

// --- Memories ---------------------------------------------------------------

final memoriesServiceProvider = Provider<MemoriesService>(
  (ref) => MemoriesService(dao: ref.watch(databaseProvider).memoriesDao),
);

/// The radius the user is searching in, in metres.
class SearchRadius extends Notifier<double> {
  /// Tight enough to mean "this spot", wide enough to catch a whole square.
  static const double defaultMeters = 500;

  static const double minMeters = 100;
  static const double maxMeters = 50000;

  @override
  double build() => defaultMeters;

  double get meters => state;

  set meters(double value) => state = value.clamp(minMeters, maxMeters);
}

final searchRadiusProvider = NotifierProvider<SearchRadius, double>(
  SearchRadius.new,
);

/// The visit timeline for wherever the screen is looking.
final memoriesHereProvider = FutureProvider<MemoriesHere?>((ref) async {
  final center = await ref.watch(currentLocationProvider.future);
  if (center == null) return null;

  // Rebuilt whenever a pass adds photos, so a first index fills the screen.
  ref.watch(indexProgressProvider);

  return ref
      .watch(memoriesServiceProvider)
      .near(center, radiusMeters: ref.watch(searchRadiusProvider));
});

/// The closest memory when there is nothing in the current radius.
final nearestMemoryProvider = FutureProvider<NearestMemory?>((ref) async {
  final center = await ref.watch(currentLocationProvider.future);
  if (center == null) return null;
  return ref
      .watch(memoriesServiceProvider)
      .nearest(center, fromRadiusMeters: ref.watch(searchRadiusProvider));
});

/// Identifies one visit's photo list. A value type, so Riverpod can cache it.
@immutable
class VisitQuery {
  const VisitQuery({
    required this.visit,
    required this.center,
    required this.radiusMeters,
    this.limit,
  });

  final Visit visit;
  final GeoPoint center;
  final double radiusMeters;

  /// Null asks for the whole visit — what the full-screen viewer needs.
  final int? limit;

  @override
  bool operator ==(Object other) =>
      other is VisitQuery &&
      other.visit == visit &&
      other.center == center &&
      other.radiusMeters == radiusMeters &&
      other.limit == limit;

  @override
  int get hashCode => Object.hash(visit, center, radiusMeters, limit);
}

/// The photos of one visit, loaded when the section scrolls into view.
// ignore: specify_nonobvious_property_types — Riverpod's family type.
final visitPhotosProvider = FutureProvider.family<List<Memory>, VisitQuery>((
  ref,
  query,
) {
  return ref
      .watch(memoriesServiceProvider)
      .photosOf(
        query.visit,
        center: query.center,
        radiusMeters: query.radiusMeters,
        limit: query.limit,
      );
});

/// Path to a photo's full-resolution file, downloading it from iCloud if that
/// is where it lives. Null when the original cannot be produced.
// ignore: specify_nonobvious_property_types — Riverpod's family type.
final originalFileProvider = FutureProvider.family<String?, String>((
  ref,
  assetId,
) async {
  final file = await ref.watch(photoLibraryProvider).originalFile(assetId);
  return file?.path;
});
