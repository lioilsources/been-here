import 'package:been_here/core/logger.dart';
import 'package:been_here/data/db/daos/places_dao.dart';
import 'package:been_here/data/db/database.dart';
import 'package:been_here/domain/places/auto_mute.dart';
import 'package:been_here/domain/places/mute_state.dart';
import 'package:been_here/domain/places/place_cluster.dart';
import 'package:drift/drift.dart' show Value;

/// Turns the photo index into places, and keeps what the user decided about
/// them.
///
/// Clustering is recomputed from scratch after every indexing pass. That
/// sounds wasteful and isn't: the work is proportional to occupied geohash
/// cells, not to photos, and a hundred thousand photos are a few thousand
/// cells. Incremental clustering would buy milliseconds and cost a class of
/// bugs where a place quietly stops matching reality.
///
/// What recomputing must never lose is the user's own decisions. New
/// clusters are matched to old places by how many cells they share, and a
/// matched place keeps its id, its mute state and when it last notified.
class PlacesService {
  PlacesService({
    required this.dao,
    this.autoMuteDays = defaultAutoMuteDays,
    DateTime Function()? clock,
  }) : clock = clock ?? DateTime.now;

  static const _log = Logger('PlacesService');

  final PlacesDao dao;
  final int autoMuteDays;
  final DateTime Function() clock;

  /// Rebuilds every place from the current index.
  Future<int> recompute() async {
    final offset = clock().timeZoneOffset.inSeconds;
    final cells = await dao.cellStats(utcOffsetSeconds: offset);
    final clusters = clusterCells(cells);
    final previousOwners = await dao.cellOwners();

    final matched = _matchToExisting(clusters, previousOwners);
    final keptIds = <int>{};
    final cellToPlace = <String, int>{};

    for (var i = 0; i < clusters.length; i++) {
      final cluster = clusters[i];
      final existingId = matched[i];

      final id = existingId == null
          ? await _insert(cluster)
          : await _update(existingId, cluster);

      keptIds.add(id);
      for (final cell in cluster.cells) {
        cellToPlace[cell] = id;
      }
    }

    final gone = previousOwners.values.toSet().difference(keptIds);
    await dao.deletePlaces(gone);
    await dao.replaceCells(cellToPlace);
    await dao.assignPhotosToPlaces();

    _log.info(
      'Places: ${clusters.length} from ${cells.length} cells '
      '(${gone.length} gone)',
    );
    return clusters.length;
  }

  /// The user's decision. Sticks through every later recompute.
  Future<void> mute(int placeId) => dao.setMute(placeId, MuteState.userMuted);

  Future<void> unmute(int placeId) =>
      dao.setMute(placeId, MuteState.userUnmuted);

  /// Names a place, or clears the name when given null or blank.
  ///
  /// Kept separate from the geocoded label so that turning place naming off
  /// never throws away something the user typed.
  Future<void> rename(int placeId, String? name) =>
      dao.setUserLabel(placeId, name);

  /// Hands the place back to the auto rule.
  Future<void> clearUserDecision(int placeId) async {
    final place = await dao.byId(placeId);
    if (place == null) return;
    await dao.setMute(
      placeId,
      autoMuteFor(
        current: MuteState.none,
        distinctDays: place.distinctDays,
        thresholdDays: autoMuteDays,
      ),
    );
  }

  Future<int> _insert(PlaceCluster cluster) => dao.insertPlace(
    PlacesCompanion.insert(
      centerLat: cluster.center.lat,
      centerLng: cluster.center.lng,
      radiusM: cluster.radiusMeters,
      photoCount: Value(cluster.photoCount),
      distinctDays: Value(cluster.distinctDays),
      visitCount: Value(cluster.visitCount),
      firstAt: cluster.firstAt,
      lastAt: cluster.lastAt,
      mute: Value(
        autoMuteFor(
          current: MuteState.none,
          distinctDays: cluster.distinctDays,
          thresholdDays: autoMuteDays,
        ),
      ),
    ),
  );

  Future<int> _update(int id, PlaceCluster cluster) async {
    final existing = await dao.byId(id);
    final mute = autoMuteFor(
      current: existing?.mute ?? MuteState.none,
      distinctDays: cluster.distinctDays,
      thresholdDays: autoMuteDays,
    );

    await dao.updatePlace(
      id,
      PlacesCompanion(
        centerLat: Value(cluster.center.lat),
        centerLng: Value(cluster.center.lng),
        radiusM: Value(cluster.radiusMeters),
        photoCount: Value(cluster.photoCount),
        distinctDays: Value(cluster.distinctDays),
        visitCount: Value(cluster.visitCount),
        firstAt: Value(cluster.firstAt),
        lastAt: Value(cluster.lastAt),
        mute: Value(mute),
        // The label is a reverse-geocoded name; the place is in the same
        // spot, so it is still right. Clearing it would re-ask the geocoder
        // after every indexing pass.
      ),
    );
    return id;
  }

  /// For each new cluster, the existing place it most overlaps with.
  ///
  /// Two clusters can want the same place — a place that split in two when
  /// new photos filled a gap. The bigger overlap keeps the id and its
  /// history; the other becomes a new place, which is the honest outcome.
  List<int?> _matchToExisting(
    List<PlaceCluster> clusters,
    Map<String, int> previousOwners,
  ) {
    final overlaps = <int, List<(int clusterIndex, int shared)>>{};

    for (var i = 0; i < clusters.length; i++) {
      final counts = <int, int>{};
      for (final cell in clusters[i].cells) {
        final owner = previousOwners[cell];
        if (owner != null) counts[owner] = (counts[owner] ?? 0) + 1;
      }
      for (final entry in counts.entries) {
        overlaps.putIfAbsent(entry.key, () => []).add((i, entry.value));
      }
    }

    final matched = List<int?>.filled(clusters.length, null);
    for (final entry in overlaps.entries) {
      final claims = entry.value..sort((a, b) => b.$2.compareTo(a.$2));
      final winner = claims.first.$1;
      // A cluster can only inherit one place, so skip it if it already won
      // a bigger claim elsewhere.
      if (matched[winner] == null) matched[winner] = entry.key;
    }
    return matched;
  }
}
