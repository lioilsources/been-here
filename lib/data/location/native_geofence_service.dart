import 'package:been_here/core/logger.dart';
import 'package:been_here/data/location/geofence_service.dart';
import 'package:been_here/data/location/location_service.dart';
import 'package:flutter/foundation.dart';
import 'package:native_geofence/native_geofence.dart' as ng;

/// Region monitoring through CoreLocation and the Android geofencing client.
///
/// The arrival callback runs in a **background isolate** with none of the
/// app's state: no providers, no open database, no localisations. That is
/// why [onArrival] is a top-level function — see
/// `lib/app/geofence_callback.dart`.
class NativeGeofenceService implements GeofenceService {
  NativeGeofenceService({
    required this.location,
    required this.onArrival,
  });

  static const _log = Logger('GeofenceService');

  final LocationService location;

  /// Must be a top-level or static function: the plugin resolves it by
  /// callback handle in a fresh isolate. Typed structurally because the
  /// package does not export its own typedef.
  final Future<void> Function(ng.GeofenceCallbackParams params) onArrival;

  bool _initialized = false;

  @override
  int get regionLimit => defaultTargetPlatform == TargetPlatform.iOS
      ? iosRegionLimitForPlatform
      : androidRegionLimitForPlatform;

  /// iOS monitors twenty regions per app; Android a hundred.
  static const int iosRegionLimitForPlatform = 20;
  static const int androidRegionLimitForPlatform = 100;

  @override
  Future<bool> isAvailable() async =>
      await location.currentPermission() == LocationPermissionState.always;

  Future<void> _ensureInitialized() async {
    if (_initialized) return;
    await ng.NativeGeofenceManager.instance.initialize();
    _initialized = true;
  }

  @override
  Future<void> register(List<GeofenceRegion> regions) async {
    await _ensureInitialized();
    // Replace wholesale: working out the difference would save a few calls
    // and cost a class of bugs where the system's idea of what is monitored
    // drifts from ours.
    await ng.NativeGeofenceManager.instance.removeAllGeofences();

    for (final region in regions) {
      try {
        await ng.NativeGeofenceManager.instance.createGeofence(
          ng.Geofence(
            id: region.id,
            location: ng.Location(
              latitude: region.center.lat,
              longitude: region.center.lng,
            ),
            radiusMeters: region.radiusMeters,
            triggers: const {ng.GeofenceEvent.enter},
            iosSettings: const ng.IosGeofenceSettings(
              initialTrigger: true,
            ),
            androidSettings: const ng.AndroidGeofenceSettings(
              initialTriggers: {ng.GeofenceEvent.enter},
            ),
          ),
          onArrival,
        );
      } on Object catch (e) {
        // One bad region must not cost us the other nineteen.
        _log.warning('could not watch ${region.id}', e);
      }
    }
  }

  @override
  Future<void> clear() async {
    await _ensureInitialized();
    await ng.NativeGeofenceManager.instance.removeAllGeofences();
  }

  @override
  Future<List<int>> registeredPlaceIds() async {
    await _ensureInitialized();
    final ids = await ng.NativeGeofenceManager.instance
        .getRegisteredGeofenceIds();
    return [for (final id in ids) ?GeofenceRegion.placeIdOf(id)];
  }
}
