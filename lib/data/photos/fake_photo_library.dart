import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:been_here/core/geo/geo_point.dart';
import 'package:been_here/data/photos/photo_library.dart';

/// In-memory [PhotoLibrary] for tests, benchmarks and the simulator.
///
/// Mirrors the real contract closely enough to be worth trusting: it returns
/// images only, keeps a stable order, and can fail or stall on demand so the
/// indexer's resume path gets exercised.
class FakePhotoLibrary implements PhotoLibrary {
  FakePhotoLibrary({
    List<PhotoAsset> assets = const [],
    this.permission = PhotoPermission.authorized,
    this.permissionAfterRequest,
    this.pageDelay,
    this.locationsOnlyViaResolve = false,
  }) : _assets = [...assets];

  final List<PhotoAsset> _assets;
  final _changes = StreamController<void>.broadcast();

  /// Current permission. Mutable so a test can revoke access mid-run.
  PhotoPermission permission;

  /// What [requestPermission] grants. Null means the prompt changes nothing.
  final PhotoPermission? permissionAfterRequest;

  /// Artificial latency per [page] call.
  Duration? pageDelay;

  /// When set, the next [page] call past this many calls throws. Lets a test
  /// interrupt a scan mid-way and check that it resumes.
  int? failAfterPages;

  /// Number of [page] calls served, for asserting batching behaviour.
  int pageCalls = 0;

  /// Number of [resolveLocation] calls, so a test can prove the expensive
  /// path is not taken for assets that are already indexed.
  int resolveLocationCalls = 0;

  /// Simulates Android 10+, where listing gives no coordinates at all and
  /// only the per-asset EXIF read has them.
  final bool locationsOnlyViaResolve;

  List<PhotoAsset>? _sortedImages;

  List<PhotoAsset> get _images =>
      _sortedImages ??= (_assets.where((a) => !a.isVideo).toList()
        ..sort((a, b) {
          final byTime = a.takenAt.compareTo(b.takenAt);
          return byTime != 0 ? byTime : a.id.compareTo(b.id);
        }));

  void _invalidate() {
    _sortedImages = null;
    _changes.add(null);
  }

  /// Everything the library holds, videos included.
  List<PhotoAsset> get allAssets => List.unmodifiable(_assets);

  void addAll(Iterable<PhotoAsset> assets) {
    _assets.addAll(assets);
    _invalidate();
  }

  void removeWhere(bool Function(PhotoAsset) test) {
    _assets.removeWhere(test);
    _invalidate();
  }

  void removeIds(Set<String> ids) => removeWhere((a) => ids.contains(a.id));

  @override
  Future<PhotoPermission> currentPermission() async => permission;

  @override
  Future<PhotoPermission> requestPermission() async =>
      permission = permissionAfterRequest ?? permission;

  @override
  Future<int> assetCount() async => _images.length;

  @override
  Future<List<PhotoAsset>> page({
    required int offset,
    required int limit,
  }) async {
    pageCalls++;
    if (failAfterPages != null && pageCalls > failAfterPages!) {
      throw const FileSystemException('fake library failure');
    }
    if (pageDelay != null) await Future<void>.delayed(pageDelay!);

    final images = _images;
    if (offset >= images.length) return const [];
    final end = (offset + limit).clamp(0, images.length);
    final slice = images.sublist(offset, end);
    if (!locationsOnlyViaResolve) return slice;
    return [
      for (final a in slice)
        PhotoAsset(
          id: a.id,
          takenAt: a.takenAt,
          width: a.width,
          height: a.height,
          isVideo: a.isVideo,
        ),
    ];
  }

  @override
  Future<GeoPoint?> resolveLocation(String assetId) async {
    resolveLocationCalls++;
    for (final asset in _assets) {
      if (asset.id == assetId) return asset.point;
    }
    return null;
  }

  @override
  Stream<void> get changes => _changes.stream;

  @override
  Future<Uint8List?> thumbnail(
    String assetId, {
    required int width,
    required int height,
  }) async {
    if (!_assets.any((a) => a.id == assetId)) return null;
    return _placeholderPng;
  }

  @override
  Future<File?> originalFile(String assetId) async => null;

  /// Everything handed to [saveImage], so a test can check what was written.
  final List<({Uint8List bytes, String filename, GeoPoint? at})> saved = [];

  /// Stands in for a library that won't take new photos — on iOS, "add only"
  /// access refused.
  bool refuseSaves = false;

  @override
  Future<String?> saveImage(
    Uint8List bytes, {
    required String filename,
    GeoPoint? at,
    DateTime? takenAt,
  }) async {
    if (refuseSaves) return null;
    saved.add((bytes: bytes, filename: filename, at: at));
    final id = 'saved-${saved.length}';
    addAll([
      PhotoAsset(
        id: id,
        lat: at?.lat,
        lng: at?.lng,
        takenAt: takenAt ?? DateTime.now().toUtc(),
        width: 1000,
        height: 1000,
      ),
    ]);
    return id;
  }

  Future<void> dispose() => _changes.close();
}

/// A 2x2 PNG.
///
/// Real bytes rather than a stand-in: widget tests decode whatever the
/// library hands back, and anything that is not an image blows up inside
/// Flutter's image pipeline rather than in the test.
final Uint8List _placeholderPng = base64Decode(
  'iVBORw0KGgoAAAANSUhEUgAAAAIAAAACCAIAAAD91JpzAAAAEE'
  'lEQVR42mOYle0FRAwQCgAl8gU9V1T9GwAAAABJRU5ErkJggg==',
);
