import 'dart:typed_data';

import 'package:been_here/core/geo/geo_point.dart';
import 'package:been_here/core/logger.dart';
import 'package:been_here/data/db/daos/rephotos_dao.dart';
import 'package:been_here/data/db/database.dart';
import 'package:been_here/data/photos/photo_library.dart';

/// What happened to a rephoto.
enum RephotoOutcome {
  saved,

  /// The library refused it — usually because adding photos isn't allowed.
  couldNotSave,
}

/// Keeping a then & now pair.
///
/// The new photo goes into the system library, not into a folder only this
/// app can see: it is a photo the user took, and it should turn up in Photos
/// like any other. The app only remembers which old photo it answers.
class RephotoService {
  RephotoService({
    required this.library,
    required this.rephotos,
    DateTime Function()? clock,
  }) : clock = clock ?? DateTime.now;

  static const _log = Logger('RephotoService');

  final PhotoLibrary library;
  final RephotosDao rephotos;
  final DateTime Function() clock;

  /// Saves [bytes] as the answer to [originalAssetId].
  Future<RephotoOutcome> save(
    Uint8List bytes, {
    required String originalAssetId,
    GeoPoint? at,
    int? placeId,
  }) async {
    final now = clock();
    final newAssetId = await library.saveImage(
      bytes,
      filename: 'been-here-${now.millisecondsSinceEpoch}.jpg',
      at: at,
      takenAt: now,
    );

    if (newAssetId == null) {
      _log.warning('library would not accept the rephoto');
      return RephotoOutcome.couldNotSave;
    }

    await rephotos.record(
      originalAssetId: originalAssetId,
      newAssetId: newAssetId,
      placeId: placeId,
      at: now,
    );
    _log.info('Rephoto of $originalAssetId saved as $newAssetId');
    return RephotoOutcome.saved;
  }

  /// The most recent answer to a photo, if it has one.
  Future<RephotoRow?> latestFor(String originalAssetId) async {
    final all = await rephotos.forOriginal(originalAssetId);
    return all.isEmpty ? null : all.first;
  }
}
