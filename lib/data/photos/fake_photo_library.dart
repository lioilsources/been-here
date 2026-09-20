import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

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
    return images.sublist(offset, end);
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
    // Not a real image; only useful for asserting that something was asked for.
    return Uint8List.fromList(assetId.codeUnits);
  }

  @override
  Future<File?> originalFile(String assetId) async => null;

  Future<void> dispose() => _changes.close();
}
