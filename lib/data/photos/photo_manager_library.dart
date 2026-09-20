import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:been_here/core/geo/geo_point.dart';
import 'package:been_here/core/logger.dart';
import 'package:been_here/data/photos/photo_library.dart';
import 'package:flutter/services.dart' show MethodCall, PlatformException;
import 'package:photo_manager/photo_manager.dart';

/// [PhotoLibrary] backed by PhotoKit (iOS) and MediaStore (Android).
class PhotoManagerLibrary implements PhotoLibrary {
  PhotoManagerLibrary();

  static const _log = Logger('PhotoManagerLibrary');

  /// Images only, oldest first.
  ///
  /// The order has to be stable across calls, because the indexer pages
  /// through it by offset. Ascending creation date is the one ordering where
  /// new photos land at the end and leave earlier offsets untouched.
  static final _filter = FilterOptionGroup(
    orders: const [OrderOption(asc: true)],
  );

  StreamController<void>? _changes;
  void Function(MethodCall)? _changeCallback;

  /// Images plus the media-location permission, without which Android 10+
  /// strips GPS out of everything it hands us.
  static const _permissionOption = PermissionRequestOption(
    androidPermission: AndroidPermission(
      type: RequestType.image,
      mediaLocation: true,
    ),
  );

  /// Reads the current state **without** prompting.
  ///
  /// Using the requesting call here would put the system dialog on screen
  /// before the user has seen our own explanation of why we want it — the
  /// fastest way to a permanent "Don't Allow".
  @override
  Future<PhotoPermission> currentPermission() async => _map(
    await PhotoManager.getPermissionState(
      requestOption: _permissionOption,
    ),
  );

  @override
  Future<PhotoPermission> requestPermission() async => _map(
    await PhotoManager.requestPermissionExtend(
      requestOption: _permissionOption,
    ),
  );

  @override
  Future<int> assetCount() => PhotoManager.getAssetCount(
    type: RequestType.image,
    filterOption: _filter,
  );

  @override
  Future<List<PhotoAsset>> page({
    required int offset,
    required int limit,
  }) async {
    if (limit <= 0) return const [];
    final entities = await PhotoManager.getAssetListRange(
      start: offset,
      end: offset + limit,
      type: RequestType.image,
      filterOption: _filter,
    );
    return entities.map(_toAsset).toList();
  }

  @override
  Future<GeoPoint?> resolveLocation(String assetId) async {
    final entity = await AssetEntity.fromId(assetId);
    if (entity == null) return null;
    try {
      final latLng = await entity.latlngAsync();
      return _pointOf(latLng?.latitude, latLng?.longitude);
    } on PlatformException catch (e) {
      // A single unreadable file must not abort a whole scan.
      _log.warning('latlng read failed for $assetId', e);
      return null;
    }
  }

  @override
  Stream<void> get changes {
    final existing = _changes;
    if (existing != null) return existing.stream;

    final controller = StreamController<void>.broadcast(
      onListen: PhotoManager.startChangeNotify,
      onCancel: PhotoManager.stopChangeNotify,
    );
    void callback(MethodCall _) => controller.add(null);
    PhotoManager.addChangeCallback(callback);
    _changeCallback = callback;
    _changes = controller;
    return controller.stream;
  }

  @override
  Future<Uint8List?> thumbnail(
    String assetId, {
    required int width,
    required int height,
  }) async {
    final entity = await AssetEntity.fromId(assetId);
    if (entity == null) return null;
    return entity.thumbnailDataWithSize(ThumbnailSize(width, height));
  }

  @override
  Future<File?> originalFile(String assetId) async {
    final entity = await AssetEntity.fromId(assetId);
    // Can trigger an iCloud download, so this is the slow path by design.
    return entity?.file;
  }

  Future<void> dispose() async {
    final callback = _changeCallback;
    if (callback != null) {
      PhotoManager.removeChangeCallback(callback);
      _changeCallback = null;
    }
    await _changes?.close();
    _changes = null;
  }

  PhotoAsset _toAsset(AssetEntity entity) {
    final point = _pointOf(entity.latitude, entity.longitude);
    return PhotoAsset(
      id: entity.id,
      lat: point?.lat,
      lng: point?.lng,
      takenAt: entity.createDateTime.toUtc(),
      width: entity.width,
      height: entity.height,
      isVideo: entity.type == AssetType.video,
    );
  }

  /// Null unless both components are present, in range, and not the (0, 0)
  /// that stripped metadata reports.
  static GeoPoint? _pointOf(double? lat, double? lng) {
    if (lat == null || lng == null) return null;
    if (lat == 0 && lng == 0) return null;
    final point = GeoPoint(lat, lng);
    return point.isValid ? point : null;
  }

  static PhotoPermission _map(PermissionState state) => switch (state) {
    PermissionState.notDetermined => PhotoPermission.notDetermined,
    PermissionState.restricted => PhotoPermission.restricted,
    PermissionState.denied => PhotoPermission.denied,
    PermissionState.authorized => PhotoPermission.authorized,
    PermissionState.limited => PhotoPermission.limited,
  };
}
