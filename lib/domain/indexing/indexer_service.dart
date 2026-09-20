import 'dart:async';

import 'package:been_here/core/geo/geohash.dart';
import 'package:been_here/core/geo/unit_vector.dart';
import 'package:been_here/core/logger.dart';
import 'package:been_here/data/db/daos/index_state_dao.dart';
import 'package:been_here/data/db/daos/photos_dao.dart';
import 'package:been_here/data/db/database.dart';
import 'package:been_here/data/photos/photo_library.dart';
import 'package:been_here/domain/indexing/index_progress.dart';
import 'package:drift/drift.dart' show Value;

/// Keeps the local index in step with the system photo library.
///
/// One algorithm covers the first full scan, later incremental syncs and
/// deletion detection: walk the library from the oldest asset to the newest,
/// insert what the index doesn't have, record every id seen, and at the end
/// drop indexed rows the library stopped reporting.
///
/// Properties that fall out of that shape:
///
/// * **Idempotent.** Assets already in the index are skipped, so running
///   twice inserts nothing the second time.
/// * **Resumable.** The offset reached is persisted after every batch, and
///   the seen-ids live in the database, so an interrupted pass continues
///   rather than starting over.
/// * **Cheap where it matters.** The expensive per-asset location read
///   (Android EXIF) happens only for assets actually being inserted.
///
/// The walk is ordered oldest-first because that is the ordering where new
/// photos land at the end and leave earlier offsets alone. If the library
/// shrinks mid-pass the offsets do shift and a few assets can be missed;
/// they get dropped from the index and re-added by the next pass, which is
/// why the next pass is cheap.
class IndexerService {
  IndexerService({
    required this.library,
    required this.photos,
    required this.state,
    this.batchSize = 400,
    this.clock = DateTime.now,
  });

  static const _log = Logger('IndexerService');

  final PhotoLibrary library;
  final PhotosDao photos;
  final IndexStateDao state;
  final DateTime Function() clock;

  /// Assets per library page and per database batch.
  final int batchSize;

  final _progress = StreamController<IndexProgress>.broadcast();
  IndexProgress _current = const IndexProgress.idle();
  bool _cancelled = false;
  Future<IndexProgress>? _inFlight;

  Stream<IndexProgress> get progress => _progress.stream;

  IndexProgress get current => _current;

  /// Runs a pass, or joins the one already running.
  ///
  /// Set [restart] to discard a half-finished pass and walk from the
  /// beginning — what the "reindex" button in settings does.
  Future<IndexProgress> run({bool restart = false}) {
    return _inFlight ??= _run(restart: restart).whenComplete(() {
      _inFlight = null;
    });
  }

  /// Asks the pass in flight to stop after the current batch.
  void cancel() => _cancelled = true;

  Future<void> dispose() => _progress.close();

  Future<IndexProgress> _run({required bool restart}) async {
    _cancelled = false;

    final permission = await library.currentPermission();
    if (!permission.canRead) {
      _log.info('Indexing skipped: permission is ${permission.name}');
      return _emit(
        const IndexProgress(status: IndexStatus.permissionDenied),
      );
    }

    var processed = 0;
    var inserted = 0;
    var total = 0;

    try {
      total = await library.assetCount();
      processed = await _resumeOffset(total: total, restart: restart);
      inserted = 0;

      _emit(
        IndexProgress(
          status: IndexStatus.running,
          processed: processed,
          total: total,
        ),
      );

      while (processed < total) {
        if (_cancelled) {
          _log.info('Indexing cancelled at $processed/$total');
          return _emit(
            IndexProgress(
              status: IndexStatus.cancelled,
              processed: processed,
              total: total,
              inserted: inserted,
            ),
          );
        }

        final page = await library.page(
          offset: processed,
          limit: batchSize,
        );
        if (page.isEmpty) {
          // The library shrank underneath us. Stop walking; the deletion
          // sweep below reconciles, and the next pass re-adds anything the
          // shifted offsets skipped.
          _log.warning('Library ended early at $processed of $total');
          break;
        }

        inserted += await _indexPage(page);
        processed += page.length;

        await state.writeInt(IndexStateKeys.scanCursor, processed);
        _emit(
          IndexProgress(
            status: IndexStatus.running,
            processed: processed,
            total: total,
            inserted: inserted,
          ),
        );
      }

      final deleted = await photos.deleteUnseen();
      await _finishPass();

      _log.info('Indexed $processed assets: +$inserted, -$deleted');
      return _emit(
        IndexProgress(
          status: IndexStatus.completed,
          processed: processed,
          total: total,
          inserted: inserted,
          deleted: deleted,
        ),
      );
    } on Object catch (error, stackTrace) {
      // The cursor and the seen-ids stay on disk, so the next run continues.
      _log.error('Indexing failed at $processed/$total', error, stackTrace);
      return _emit(
        IndexProgress(
          status: IndexStatus.failed,
          processed: processed,
          total: total,
          inserted: inserted,
          errorCode: error.runtimeType.toString(),
        ),
      );
    }
  }

  /// Where to start this run: continue a pass that is still valid, or open a
  /// fresh one.
  Future<int> _resumeOffset({
    required int total,
    required bool restart,
  }) async {
    if (!restart) {
      final cursor = await state.readInt(IndexStateKeys.scanCursor);
      final startedWithTotal = await state.readInt(IndexStateKeys.scanTotal);
      // Offsets only mean anything if the library is the same size as when
      // the pass began.
      if (cursor != null && startedWithTotal == total && cursor <= total) {
        _log.info('Resuming pass at $cursor/$total');
        return cursor;
      }
    }

    await photos.clearSeen();
    await state.writeInt(IndexStateKeys.scanTotal, total);
    await state.writeInt(IndexStateKeys.scanCursor, 0);
    return 0;
  }

  /// Returns how many rows this page added.
  Future<int> _indexPage(List<PhotoAsset> page) async {
    final ids = [for (final asset in page) asset.id];
    await photos.markSeen(ids);
    final known = await photos.existingIds(ids);

    final now = clock().toUtc().millisecondsSinceEpoch ~/ 1000;
    final rows = <PhotosCompanion>[];

    for (final asset in page) {
      if (known.contains(asset.id)) continue;

      // Only now is the expensive read worth it.
      final point = asset.point ?? await library.resolveLocation(asset.id);
      final vector = point == null ? null : UnitVector.of(point);

      rows.add(
        PhotosCompanion.insert(
          assetId: asset.id,
          lat: Value(point?.lat),
          lng: Value(point?.lng),
          takenAt: asset.takenAt.toUtc().millisecondsSinceEpoch ~/ 1000,
          geohash: Value(point == null ? null : encodeGeohash(point)),
          x: Value(vector?.x),
          y: Value(vector?.y),
          z: Value(vector?.z),
          isVideo: Value(asset.isVideo),
          width: asset.width,
          height: asset.height,
          indexedAt: now,
        ),
      );
    }

    await photos.insertMissing(rows);
    return rows.length;
  }

  Future<void> _finishPass() async {
    await photos.clearSeen();
    final now = clock().toUtc().millisecondsSinceEpoch ~/ 1000;
    // Every completed pass walks the whole library, so both stamps move.
    await state.writeInt(IndexStateKeys.lastSync, now);
    await state.writeInt(IndexStateKeys.lastFullScan, now);
    await state.remove(IndexStateKeys.scanCursor);
    await state.remove(IndexStateKeys.scanTotal);
  }

  IndexProgress _emit(IndexProgress progress) {
    _current = progress;
    if (!_progress.isClosed) _progress.add(progress);
    return progress;
  }
}
