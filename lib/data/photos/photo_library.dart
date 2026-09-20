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
  /// Current permission.
  ///
  /// Must never put a system dialog on screen: the app explains itself first
  /// and prompts second, and a dialog raised behind that explanation is the
  /// fastest route to a permanent "Don't Allow".
  Future<PhotoPermission> currentPermission();

  /// Prompts, if the system still allows it to be asked.
  Future<PhotoPermission> requestPermission();

  /// Number of readable image assets.
  Future<int> assetCount();

  /// A page of assets ordered by [PhotoAsset.takenAt] ascending, ties broken
  /// by [PhotoAsset.id].
  ///
  /// The order must be stable across calls so an interrupted scan can resume
  /// from an offset.
  Future<List<PhotoAsset>> page({required int offset, required int limit});

  /// Location of a single asset, read the expensive way.
  ///
  /// On Android 10+ the coordinates are stripped from the media store and
  /// only EXIF (via `ACCESS_MEDIA_LOCATION`) has them, which costs a file
  /// read per asset. On iOS the value from [page] is already authoritative
  /// and this is only a fallback.
  ///
  /// Call it only for assets actually being written to the index.
  Future<GeoPoint?> resolveLocation(String assetId);

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

  /// Adds a photo to the system library and returns its new asset id.
  ///
  /// The one write this app makes. A rephoto belongs in the user's library
  /// next to the photo it answers, not in a private folder only this app can
  /// open.
  Future<String?> saveImage(
    Uint8List bytes, {
    required String filename,
    GeoPoint? at,
    DateTime? takenAt,
  });
}
