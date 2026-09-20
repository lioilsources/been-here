import 'package:been_here/domain/places/mute_state.dart';
import 'package:drift/drift.dart';

/// One row per indexed asset from the system photo library.
///
/// The app never copies pixels — this is an index, and the system library
/// stays the source of truth. [assetId] is the library's own identifier.
///
/// Assets without GPS are indexed too (lat/lng null) so that placing them by
/// hand later needs no reindex. MVP queries ignore them.
@DataClassName('PhotoRow')
// One composite index instead of the two single-column ones the plan named:
// the "what do I have here" query constrains lat and lng together, and a
// (lat, lng) index serves both the range seek and the second bound. Nothing
// ever queries longitude on its own.
@TableIndex(name: 'photos_lat_lng', columns: {#lat, #lng})
@TableIndex(name: 'photos_geohash', columns: {#geohash})
@TableIndex(name: 'photos_place_taken', columns: {#placeId, #takenAt})
@TableIndex(name: 'photos_taken_at', columns: {#takenAt})
class Photos extends Table {
  TextColumn get assetId => text()();

  RealColumn get lat => real().nullable()();

  RealColumn get lng => real().nullable()();

  /// Capture time, unix seconds UTC.
  IntColumn get takenAt => integer()();

  /// Precision-7 geohash of lat/lng (~150 m cell). Null without GPS.
  TextColumn get geohash => text().nullable()();

  /// The same position as a point on the unit sphere. Null without GPS.
  ///
  /// Lets SQLite answer "within r metres" exactly, with arithmetic only —
  /// see `UnitVector` in core/geo. Denormalised on purpose: shipping the
  /// coordinates to Dart to do it there is what made the query slow.
  RealColumn get x => real().nullable()();

  RealColumn get y => real().nullable()();

  RealColumn get z => real().nullable()();

  IntColumn get placeId => integer().nullable().references(
    Places,
    #id,
    onDelete: KeyAction.setNull,
  )();

  /// Always false today: videos are not indexed (product decision). The
  /// column exists so turning them on later is a query change, not a
  /// migration plus full reindex.
  BoolColumn get isVideo => boolean().withDefault(const Constant(false))();

  IntColumn get width => integer()();

  IntColumn get height => integer()();

  /// When this row was last written, unix seconds UTC.
  IntColumn get indexedAt => integer()();

  @override
  Set<Column<Object>> get primaryKey => {assetId};
}

/// A cluster of nearby photos — somewhere the user has been.
@DataClassName('PlaceRow')
@TableIndex(name: 'places_center', columns: {#centerLat, #centerLng})
class Places extends Table {
  IntColumn get id => integer().autoIncrement()();

  RealColumn get centerLat => real()();

  RealColumn get centerLng => real()();

  RealColumn get radiusM => real()();

  IntColumn get photoCount => integer().withDefault(const Constant(0))();

  /// Number of distinct local calendar days with a photo here. Drives the
  /// auto-mute rule.
  IntColumn get distinctDays => integer().withDefault(const Constant(0))();

  IntColumn get firstAt => integer()();

  IntColumn get lastAt => integer()();

  /// Reverse-geocoded name, filled in lazily and only if the user allows it.
  ///
  /// Wiped when the user turns place naming off — it came from a service,
  /// and turning the service off should forget its answers.
  TextColumn get label => text().nullable()();

  /// A name the user typed. Takes precedence over [label], and survives
  /// everything: recomputes, and turning geocoding off. It never came from
  /// anywhere but this phone.
  TextColumn get userLabel => text().nullable()();

  TextColumn get mute =>
      textEnum<MuteState>().withDefault(const Constant('none'))();

  IntColumn get lastNotifiedAt => integer().nullable()();
}

/// Which geohash cell belongs to which place.
///
/// Clustering is recomputed from scratch after every indexing pass, so places
/// come and go; the cells are what let a new cluster be recognised as the
/// same place as an old one, and what assigns photos to places in a single
/// SQL statement.
@DataClassName('PlaceCellRow')
@TableIndex(name: 'place_cells_place', columns: {#placeId})
class PlaceCells extends Table {
  TextColumn get geohash => text()();

  IntColumn get placeId =>
      integer().references(Places, #id, onDelete: KeyAction.cascade)();

  @override
  Set<Column<Object>> get primaryKey => {geohash};
}

/// A then & now pair: an old photo and the one taken to match it.
@DataClassName('RephotoRow')
@TableIndex(name: 'rephotos_original', columns: {#originalAssetId})
class Rephotos extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get originalAssetId => text()();

  TextColumn get newAssetId => text()();

  IntColumn get placeId => integer().nullable().references(
    Places,
    #id,
    onDelete: KeyAction.setNull,
  )();

  IntColumn get createdAt => integer()();
}

/// Every asset id the library reported during the indexing pass in flight.
///
/// Lives in the database rather than in a Dart `Set` for two reasons: a
/// 200k-photo library would cost tens of megabytes of strings, and the pass
/// has to survive the app being killed half-way so that "which rows did the
/// library stop reporting" stays answerable on resume.
@DataClassName('ScanSeenRow')
class ScanSeen extends Table {
  TextColumn get assetId => text()();

  @override
  Set<Column<Object>> get primaryKey => {assetId};
}

/// What the user has chosen. Key/value, because settings are few and the
/// alternative is a migration every time one is added.
@DataClassName('PreferenceRow')
class Preferences extends Table {
  TextColumn get key => text()();

  TextColumn get value => text()();

  @override
  Set<Column<Object>> get primaryKey => {key};
}

/// Key/value scratch space for the indexer: last full scan, last sync,
/// library change token, scan cursor.
@DataClassName('IndexStateRow')
class IndexState extends Table {
  TextColumn get key => text()();

  TextColumn get value => text()();

  @override
  Set<Column<Object>> get primaryKey => {key};
}
