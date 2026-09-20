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
@TableIndex(name: 'photos_lat', columns: {#lat})
@TableIndex(name: 'photos_lng', columns: {#lng})
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
  TextColumn get label => text().nullable()();

  TextColumn get mute =>
      textEnum<MuteState>().withDefault(const Constant('none'))();

  IntColumn get lastNotifiedAt => integer().nullable()();
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

/// Key/value scratch space for the indexer: last full scan, last sync,
/// library change token, scan cursor.
@DataClassName('IndexStateRow')
class IndexState extends Table {
  TextColumn get key => text()();

  TextColumn get value => text()();

  @override
  Set<Column<Object>> get primaryKey => {key};
}
