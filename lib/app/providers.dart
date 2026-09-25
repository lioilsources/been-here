import 'package:been_here/app/geofence_callback.dart';
import 'package:been_here/core/geo/geo_point.dart';
import 'package:been_here/core/geo/haversine.dart';
import 'package:been_here/data/db/database.dart';
import 'package:been_here/data/geocoding/geocoding_service.dart';
import 'package:been_here/data/location/geofence_service.dart';
import 'package:been_here/data/location/geolocator_location_service.dart';
import 'package:been_here/data/location/location_service.dart';
import 'package:been_here/data/location/native_geofence_service.dart';
import 'package:been_here/data/notifications/local_notification_service.dart';
import 'package:been_here/data/notifications/notification_service.dart';
import 'package:been_here/data/photos/photo_library.dart';
import 'package:been_here/data/photos/photo_manager_library.dart';
import 'package:been_here/domain/indexing/index_progress.dart';
import 'package:been_here/domain/indexing/indexer_service.dart';
import 'package:been_here/domain/indexing/library_sync.dart';
import 'package:been_here/domain/memories/arrival_service.dart';
import 'package:been_here/domain/memories/memories_service.dart';
import 'package:been_here/domain/memories/memory.dart';
import 'package:been_here/domain/memories/notification_rules.dart';
import 'package:been_here/domain/memories/visit.dart';
import 'package:been_here/domain/places/place_labels.dart';
import 'package:been_here/domain/places/places_service.dart';
import 'package:been_here/domain/rephoto/rephoto_service.dart';
import 'package:been_here/domain/settings/app_settings.dart';
import 'package:been_here/features/notifications/arrival_text.dart';
import 'package:been_here/l10n/generated/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meta/meta.dart';
import 'package:package_info_plus/package_info_plus.dart';

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

/// A number that changes only when the index has changed enough to be worth
/// asking the database again. See [indexGeneration] for why.
///
/// The progress bar itself still follows [indexProgressProvider], so it
/// stays live while the queries behind it settle.
final indexGenerationProvider = Provider<int>((ref) {
  final progress =
      ref.watch(indexProgressProvider).value ?? const IndexProgress.idle();
  return indexGeneration(progress);
});

/// How many photos are indexed, and how many of them have coordinates.
final indexStatsProvider = FutureProvider<IndexStats>((ref) async {
  // Recomputed when the index has actually changed, not once per page.
  ref.watch(indexGenerationProvider);
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
    afterPass: () async {
      await ref.read(placesServiceProvider).recompute();
      ref.invalidate(placesProvider);

      // The places changed, so what is worth watching may have too.
      final here = await ref.read(currentLocationProvider.future);
      if (here != null) await ref.read(regionSyncProvider).syncRegions(here);
    },
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

/// Why the Here screen is looking somewhere other than at the phone.
enum ViewpointSource {
  /// It isn't. This is the phone's own fix.
  device,

  /// The debug sheet, so the screen can be tested from the sofa.
  debug,

  /// A place that was opened, from the list, the map, or a notification.
  place,

  /// The middle of a map the user dragged.
  map,
}

/// Where the Here screen is looking, and why.
///
/// The why matters as much as the where: a place has a name and a way back,
/// a dragged map has a way back, and a debug coordinate should keep saying
/// it is a debug coordinate. One object rather than three flags that have to
/// be kept in step.
@immutable
class Viewpoint {
  const Viewpoint.device()
    : point = null,
      source = ViewpointSource.device,
      placeId = null;

  const Viewpoint.debug(GeoPoint this.point)
    : source = ViewpointSource.debug,
      placeId = null;

  const Viewpoint.place(GeoPoint this.point, int this.placeId)
    : source = ViewpointSource.place;

  const Viewpoint.map(GeoPoint this.point)
    : source = ViewpointSource.map,
      placeId = null;

  /// Null means the device's own location.
  final GeoPoint? point;
  final ViewpointSource source;

  /// Set only when [source] is [ViewpointSource.place].
  final int? placeId;

  bool get isOverride => point != null;

  @override
  bool operator ==(Object other) =>
      other is Viewpoint &&
      other.point == point &&
      other.source == source &&
      other.placeId == placeId;

  @override
  int get hashCode => Object.hash(point, source, placeId);

  @override
  String toString() => 'Viewpoint(${source.name}, $point)';
}

class ViewpointController extends Notifier<Viewpoint> {
  @override
  Viewpoint build() => const Viewpoint.device();

  GeoPoint? get point => state.point;

  void toPlace(GeoPoint point, int placeId) =>
      state = Viewpoint.place(point, placeId);

  void toDebug(GeoPoint point) => state = Viewpoint.debug(point);

  /// Dragging the map is a way of asking "and what about over there?".
  void toMapCentre(GeoPoint point) => state = Viewpoint.map(point);

  /// Hands the screen back to the phone.
  void toDevice() => state = const Viewpoint.device();
}

final viewpointProvider = NotifierProvider<ViewpointController, Viewpoint>(
  ViewpointController.new,
);

/// The place the Here screen is looking at, when it got there by opening one.
final viewedPlaceProvider = Provider<int?>(
  (ref) => ref.watch(viewpointProvider.select((v) => v.placeId)),
);

/// Where the Here screen is looking: the override if there is one, otherwise
/// the device's own fix.
final currentLocationProvider = FutureProvider<GeoPoint?>((ref) async {
  final override = ref.watch(viewpointProvider.select((v) => v.point));
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

  // Rebuilt as a pass adds photos, so a first index fills the screen — but
  // in steps, not once per page.
  ref.watch(indexGenerationProvider);

  return ref
      .watch(memoriesServiceProvider)
      .near(center, radiusMeters: ref.watch(searchRadiusProvider));
});

/// Where the photos in the current radius are. Only ever read by the map.
final memoryPointsProvider = FutureProvider<List<GeoPoint>>((ref) async {
  final center = await ref.watch(currentLocationProvider.future);
  if (center == null) return const [];

  ref.watch(indexGenerationProvider);

  return ref
      .watch(memoriesServiceProvider)
      .pointsNear(
        center,
        radiusMeters: ref.watch(searchRadiusProvider),
        // Fewer than the query would allow: these are redrawn while the
        // radius slider moves, and at a dot every three pixels nobody can
        // tell eight hundred from two thousand.
        limit: 800,
      );
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

// --- Settings ---------------------------------------------------------------

final settingsStoreProvider = Provider<SettingsStore>(
  (ref) => SettingsStore(ref.watch(databaseProvider).preferencesDao),
);

/// What the user has chosen. Everything that reads a threshold reads it here.
class SettingsController extends AsyncNotifier<AppSettings> {
  @override
  Future<AppSettings> build() => ref.watch(settingsStoreProvider).read();

  Future<void> setAutoMuteDays(int days) async {
    await ref.read(settingsStoreProvider).setAutoMuteDays(days);
    ref.invalidateSelf();
    // The threshold changed, so every place's mute state may have.
    await ref.read(placesServiceProvider).recompute();
    ref.invalidate(placesProvider);
  }

  Future<void> setMemoryAgeDays(int days) async {
    await ref.read(settingsStoreProvider).setMemoryAgeDays(days);
    ref.invalidateSelf();
  }

  Future<void> setPlaceCooldownDays(int days) async {
    await ref.read(settingsStoreProvider).setPlaceCooldownDays(days);
    ref.invalidateSelf();
  }

  Future<void> setDailyLimitHours(int hours) async {
    await ref.read(settingsStoreProvider).setDailyLimitHours(hours);
    ref.invalidateSelf();
  }

  Future<void> setMapEnabled({required bool enabled}) async {
    await ref.read(settingsStoreProvider).setMapEnabled(enabled: enabled);
    ref.invalidateSelf();
  }

  Future<void> setHomeRadiusKm(int km) async {
    await ref.read(settingsStoreProvider).setHomeRadiusKm(km);
    ref.invalidateSelf();
    // What is worth watching just changed.
    final here = await ref.read(currentLocationProvider.future);
    if (here != null) await ref.read(regionSyncProvider).syncRegions(here);
  }

  Future<void> setOnboardingSeen({required bool seen}) async {
    await ref.read(settingsStoreProvider).setOnboardingSeen(seen: seen);
    ref.invalidateSelf();
  }

  Future<void> setPlaceNames({required bool enabled}) async {
    await ref
        .read(settingsStoreProvider)
        .setPlaceNamesEnabled(enabled: enabled);
    // Turning it off forgets the names, not just stops asking for new ones.
    if (!enabled) await ref.read(placeLabellerProvider).forgetAll();
    ref
      ..invalidateSelf()
      ..invalidate(placesProvider);
  }
}

final settingsProvider = AsyncNotifierProvider<SettingsController, AppSettings>(
  SettingsController.new,
);

/// Version and build number, for the about section.
final packageInfoProvider = FutureProvider<PackageInfo>(
  (ref) => PackageInfo.fromPlatform(),
);

// --- Places -----------------------------------------------------------------

final geocodingServiceProvider = Provider<GeocodingService>(
  (ref) => PlatformGeocodingService(),
);

final placeLabellerProvider = Provider<PlaceLabeller>(
  (ref) => PlaceLabeller(
    dao: ref.watch(databaseProvider).placesDao,
    geocoder: ref.watch(geocodingServiceProvider),
  ),
);

final placesServiceProvider = Provider<PlacesService>((ref) {
  final settings = ref.watch(settingsProvider).value ?? const AppSettings();
  return PlacesService(
    dao: ref.watch(databaseProvider).placesDao,
    autoMuteDays: settings.autoMuteDays,
  );
});

enum PlacesSort { longestAgo, mostPhotos, mostVisits, nearest }

/// Which way round the sort runs.
///
/// Every one of these questions has a useful opposite — the place you were
/// at most recently, the one you have been to once — so the direction is a
/// switch rather than four more entries in the menu.
class PlacesSortAscending extends Notifier<bool> {
  @override
  bool build() => false;

  bool get value => state;

  set value(bool ascending) => state = ascending;
}

final placesSortAscendingProvider = NotifierProvider<PlacesSortAscending, bool>(
  PlacesSortAscending.new,
);

class PlacesSortOrder extends Notifier<PlacesSort> {
  @override
  PlacesSort build() => PlacesSort.longestAgo;

  PlacesSort get order => state;

  set order(PlacesSort value) => state = value;
}

final placesSortProvider = NotifierProvider<PlacesSortOrder, PlacesSort>(
  PlacesSortOrder.new,
);

/// Every place, in the order the user asked for.
final placesProvider = FutureProvider<List<PlaceRow>>((ref) async {
  // Places are derived from the index, so they follow it — in steps.
  ref.watch(indexGenerationProvider);

  final rows = await ref.watch(databaseProvider).placesDao.all();
  final sort = ref.watch(placesSortProvider);
  final from = sort == PlacesSort.nearest
      ? await ref.watch(currentLocationProvider.future)
      : null;

  final sorted = [...rows];
  switch (sort) {
    case PlacesSort.longestAgo:
      sorted.sort((a, b) => a.lastAt.compareTo(b.lastAt));
    case PlacesSort.mostPhotos:
      sorted.sort((a, b) => b.photoCount.compareTo(a.photoCount));
    case PlacesSort.mostVisits:
      sorted.sort((a, b) => b.visitCount.compareTo(a.visitCount));
    case PlacesSort.nearest:
      if (from == null) {
        sorted.sort((a, b) => b.photoCount.compareTo(a.photoCount));
      } else {
        double distance(PlaceRow p) =>
            distanceMeters(from, GeoPoint(p.centerLat, p.centerLng));
        sorted.sort((a, b) => distance(a).compareTo(distance(b)));
      }
  }

  return ref.watch(placesSortAscendingProvider)
      ? sorted.reversed.toList()
      : sorted;
});

/// A place's name, asked for only when it is on screen and only if the user
/// turned naming on.
// ignore: specify_nonobvious_property_types — Riverpod's family type.
final placeLabelProvider = FutureProvider.family<String?, int>((
  ref,
  placeId,
) async {
  final settings = await ref.watch(settingsProvider.future);
  final place = await ref.watch(databaseProvider).placesDao.byId(placeId);
  if (place == null) return null;

  // A name the user typed always wins, and skips the geocoder entirely.
  final own = place.userLabel;
  if (own != null && own.isNotEmpty) return own;

  return ref
      .watch(placeLabellerProvider)
      .labelFor(place, enabled: settings.placeNamesEnabled);
});

// --- Arrivals ---------------------------------------------------------------

final notificationServiceProvider = Provider<NotificationService>((ref) {
  final service = LocalNotificationService();
  ref.onDispose(service.dispose);
  return service;
});

final geofenceServiceProvider = Provider<GeofenceService>(
  (ref) => NativeGeofenceService(
    location: ref.watch(locationServiceProvider),
    onArrival: onGeofenceArrival,
  ),
);

final notificationRulesProvider = Provider<NotificationRules>((ref) {
  final settings = ref.watch(settingsProvider).value ?? const AppSettings();
  return settings.notificationRules;
});

final regionSyncProvider = Provider<RegionSyncService>(
  (ref) => RegionSyncService(
    places: ref.watch(databaseProvider).placesDao,
    geofence: ref.watch(geofenceServiceProvider),
    rules: ref.watch(notificationRulesProvider),
  ),
);

/// Runs the whole arrival path for [placeId] as if the system had reported
/// it, and reports what the rules decided.
///
/// Built here rather than held in a provider because it needs the strings,
/// and the caller is a widget that already has them. The real arrival runs
/// in a background isolate and builds its own.
Future<NotificationDecision> testArrival(
  WidgetRef ref,
  AppLocalizations l10n,
  int placeId,
) {
  final service = ArrivalService(
    places: ref.read(databaseProvider).placesDao,
    notifications: ref.read(notificationServiceProvider),
    compose: (arrival) => composeArrival(l10n, arrival),
    rules: ref.read(notificationRulesProvider),
  );
  return service.onArrival(placeId);
}

/// Why nothing is arriving.
///
/// "No notifications ever" has a dozen innocent explanations and one
/// alarming one, and from the outside they look identical. This counts them:
/// how many places the system is actually watching, and what stopped the
/// rest.
@immutable
class ArrivalDiagnosis {
  const ArrivalDiagnosis({
    required this.totalPlaces,
    required this.watching,
    required this.vetoes,
    this.nearestWatchedMeters,
    this.lastNotifiedAt,
  });

  final int totalPlaces;

  /// Places the system is monitoring right now, as it reports them — not as
  /// the app believes it registered them.
  final int watching;

  /// How many places each veto accounts for. Eligible places are the ones
  /// missing from here.
  final Map<NotificationVeto, int> vetoes;

  final double? nearestWatchedMeters;
  final DateTime? lastNotifiedAt;

  int get eligible =>
      totalPlaces - vetoes.values.fold(0, (sum, count) => sum + count);
}

final arrivalDiagnosisProvider = FutureProvider<ArrivalDiagnosis>((ref) async {
  // Recounted whenever the places or the thresholds change.
  ref.watch(placesProvider);
  final rules = ref.watch(notificationRulesProvider);

  final dao = ref.watch(databaseProvider).placesDao;
  final places = await dao.notifiable();
  final home = await dao.home();
  final now = DateTime.now();

  final vetoes = <NotificationVeto, int>{};
  for (final place in places) {
    final veto = monitoringVeto(
      place: place,
      now: now,
      rules: rules,
      home: home,
    );
    if (veto != null) vetoes[veto] = (vetoes[veto] ?? 0) + 1;
  }

  final watched = await ref.watch(geofenceServiceProvider).registeredPlaceIds();
  final here = await ref.watch(currentLocationProvider.future);

  double? nearest;
  if (here != null && watched.isNotEmpty) {
    for (final place in places) {
      if (!watched.contains(place.placeId)) continue;
      final metres = distanceMeters(here, place.center);
      if (nearest == null || metres < nearest) nearest = metres;
    }
  }

  return ArrivalDiagnosis(
    totalPlaces: places.length,
    watching: watched.length,
    vetoes: vetoes,
    nearestWatchedMeters: nearest,
    lastNotifiedAt: await dao.lastNotifiedAnywhere(),
  );
});

/// Whether the app can be woken on arrival at all.
final arrivalsAvailableProvider = FutureProvider<bool>((ref) {
  // Re-read after any permission prompt.
  ref.watch(locationPermissionProvider);
  return ref.watch(geofenceServiceProvider).isAvailable();
});

/// Three states, not two.
///
/// The middle one is the whole point: iOS frequently answers an in-app
/// request for background location by keeping "While Using" and never
/// raising the prompt again. Reporting that as simply "off" leaves the user
/// tapping a button that cannot work, which is exactly what it did.
enum ArrivalsStatus { on, needsSystemSettings, off }

final arrivalsStatusProvider = FutureProvider<ArrivalsStatus>((ref) async {
  final permission = await ref.watch(locationPermissionProvider.future);
  return switch (permission) {
    LocationPermissionState.always => ArrivalsStatus.on,
    LocationPermissionState.whileInUse => ArrivalsStatus.needsSystemSettings,
    _ => ArrivalsStatus.off,
  };
});

/// True once the user has actually seen memories.
///
/// The gate on asking for background location: the plan is explicit that the
/// bigger permission is only worth asking for after the app has shown what
/// it is for, and App Review will ask the same question.
final hasSeenMemoriesProvider = FutureProvider<bool>((ref) async {
  ref.watch(seenMemoriesTickProvider);
  final values = await ref.watch(databaseProvider).preferencesDao.readAll();
  return values['seen_memories'] == 'true';
});

/// Bumped when the flag is written, so the provider above re-reads.
class SeenMemoriesTick extends Notifier<int> {
  @override
  int build() => 0;

  void bump() => state = state + 1;
}

final seenMemoriesTickProvider = NotifierProvider<SeenMemoriesTick, int>(
  SeenMemoriesTick.new,
);

/// Records that memories have been shown. Idempotent and cheap.
Future<void> markMemoriesSeen(WidgetRef ref) async {
  if (ref.read(hasSeenMemoriesProvider).value ?? false) return;
  await ref
      .read(databaseProvider)
      .preferencesDao
      .write('seen_memories', 'true');
  ref.read(seenMemoriesTickProvider.notifier).bump();
}

/// Whether to offer background location right now.
final shouldOfferArrivalsProvider = FutureProvider<bool>((ref) async {
  if (!(await ref.watch(hasSeenMemoriesProvider.future))) return false;
  if (await ref.watch(arrivalsAvailableProvider.future)) return false;

  final values = await ref.watch(databaseProvider).preferencesDao.readAll();
  // "Not now" means not now, not never — but it does mean stop asking until
  // the user brings it up themselves in settings.
  return values['arrivals_declined'] != 'true';
});

Future<void> declineArrivals(WidgetRef ref) async {
  await ref
      .read(databaseProvider)
      .preferencesDao
      .write('arrivals_declined', 'true');
  ref.invalidate(shouldOfferArrivalsProvider);
}

/// Which tab the shell is showing. A provider so that tapping a place, or a
/// notification, can bring the Here screen forward from anywhere.
class SelectedTab extends Notifier<int> {
  @override
  int build() => 0;

  set index(int value) => state = value;

  int get index => state;
}

final selectedTabProvider = NotifierProvider<SelectedTab, int>(
  SelectedTab.new,
);

/// Opens the Here screen at [placeId], as a notification tap should.
///
/// Reuses the viewpoint override rather than inventing a second way to look
/// somewhere else, and widens the radius to the place so its photos are
/// actually in view.
Future<bool> openPlace(WidgetRef ref, int placeId) async {
  final place = await ref.read(databaseProvider).placesDao.byId(placeId);
  if (place == null) return false;

  ref
      .read(viewpointProvider.notifier)
      .toPlace(GeoPoint(place.centerLat, place.centerLng), placeId);
  ref.read(searchRadiusProvider.notifier).meters = place.radiusM * 2;
  ref.read(selectedTabProvider.notifier).index = 0;
  return true;
}

/// Notification taps, including the one that launched the app.
final notificationTapsProvider = StreamProvider<int>((ref) async* {
  final notifications = ref.watch(notificationServiceProvider);
  await notifications.initialize();

  final launch = await notifications.launchPlaceId();
  if (launch != null) yield launch;

  yield* notifications.taps;
});

// --- Rephoto ----------------------------------------------------------------

final rephotoServiceProvider = Provider<RephotoService>(
  (ref) => RephotoService(
    library: ref.watch(photoLibraryProvider),
    rephotos: ref.watch(databaseProvider).rephotosDao,
  ),
);

/// The newest answer to a photo, if there is one.
// ignore: specify_nonobvious_property_types — Riverpod's family type.
final latestRephotoProvider = FutureProvider.family<RephotoRow?, String>(
  (
    ref,
    assetId,
  ) => ref.watch(rephotoServiceProvider).latestFor(assetId),
);
