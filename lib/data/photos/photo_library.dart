import 'dart:io';
import 'dart:typed_data';

import 'package:been_here/core/geo/geo_point.dart';
import 'package:meta/meta.dart';

/// One asset as the system photo library describes it, with no plugin types
/// leaking into `domain/`.
@immutable
class PhotoAsset {
  const PhotoAsset({
    required this.id,
    required this.takenAt,
    required this.width,
    required this.height,
    this.lat,
    this.lng,
    this.isVideo = false,
  });

  /// Identifier assigned by PhotoKit / MediaStore.
  final String id;

  final double? lat;
  final double? lng;

  /// Capture time. UTC.
  final DateTime takenAt;

  final int width;
  final int height;
  final bool isVideo;

  bool get hasLocation => lat != null && lng != null;

  /// Location, or null when the asset carries no usable GPS.
  ///
  /// Exactly (0, 0) is treated as missing: cameras and stripped exports write
  /// it far more often than anyone photographs the Gulf of Guinea.
  GeoPoint? get point {
    final latitude = lat;
    final longitude = lng;
    if (latitude == null || longitude == null) return null;
    if (latitude == 0 && longitude == 0) return null;
    final p = GeoPoint(latitude, longitude);
    return p.isValid ? p : null;
  }

  @override
  String toString() => 'PhotoAsset($id, $lat/$lng, $takenAt)';
}

/// How much of the library the app may read.
enum PhotoPermission {
  notDetermined,

  /// iOS 14+ "Selected Photos", Android partial access. The app works, but
  /// only sees what the user picked — worth explaining, never nagging about.
  limited,

  authorized,

  denied,

  /// Blocked by policy (parental controls, MDM). Asking again won't help.
  restricted;

  bool get canRead => this == authorized || this == limited;
}

/// Read-only access to the system photo library.
///
/// Implementations return **images only** — videos are filtered at the source
/// because the product does not index them, and paging past them on a large
/// library is pure cost.
abstract interface class PhotoLibrary {
  /// Current permission without prompting.
  Future<PhotoPermission> currentPermission();

  /// Prompts if the system still allows it.
  Future<PhotoPermission> requestPermission();

  /// Number of readable image assets.
  Future<int> assetCount();

  /// A page of assets ordered by [PhotoAsset.takenAt] ascending, ties broken
  /// by [PhotoAsset.id].
  ///
  /// The order must be stable across calls so an interrupted scan can resume
  /// from an offset.
  Future<List<PhotoAsset>> page({required int offset, required int limit});

  /// Fires when the library changes (asset added, edited or removed).
  Stream<void> get changes;

  /// JPEG/PNG bytes for a grid thumbnail, or null if the asset is gone.
  Future<Uint8List?> thumbnail(
    String assetId, {
    required int width,
    required int height,
  });

  /// Full-resolution file. May need an iCloud download, so it can be slow and
  /// can fail offline.
  Future<File?> originalFile(String assetId);
}
