import 'package:been_here/core/geo/geo_point.dart';
import 'package:been_here/data/location/location_service.dart';
import 'package:meta/meta.dart';

/// A circle the system will tell us about when the user enters it.
@immutable
class GeofenceRegion {
  const GeofenceRegion({
    required this.placeId,
    required this.center,
    required this.radiusMeters,
  });

  final int placeId;
  final GeoPoint center;
  final double radiusMeters;

  /// The id the system knows this region by.
  String get id => 'place-$placeId';

  static int? placeIdOf(String regionId) =>
      int.tryParse(regionId.replaceFirst('place-', ''));

  @override
  bool operator ==(Object other) =>
      other is GeofenceRegion &&
      other.placeId == placeId &&
      other.center == center &&
      other.radiusMeters == radiusMeters;

  @override
  int get hashCode => Object.hash(placeId, center, radiusMeters);

  @override
  String toString() => 'GeofenceRegion($id, $center, ${radiusMeters}m)';
}

/// Region monitoring, as the system does it.
///
/// The app never watches location itself. This is the whole arrival
/// mechanism: hand the system a handful of circles, and let it wake the app
/// when one is entered. That is what keeps the battery cost at zero and is
/// also why the number of circles is so tightly limited.
abstract interface class GeofenceService {
  /// Whether background location has been granted. Without it the system
  /// will not deliver arrivals, and the app has to work anyway.
  Future<bool> isAvailable();

  /// How many regions this platform will monitor for one app.
  int get regionLimit;

  /// Replaces every registered region with [regions].
  Future<void> register(List<GeofenceRegion> regions);

  /// Stops monitoring everything.
  Future<void> clear();

  /// The regions currently registered, as the system sees them.
  Future<List<int>> registeredPlaceIds();
}

/// In-memory [GeofenceService] for tests, and for platforms where arrivals
/// are not wired up.
class FakeGeofenceService implements GeofenceService {
  FakeGeofenceService({
    this.available = true,
    this.regionLimit = 20,
    this.location,
  });

  /// When given, availability follows the permission the way the real one
  /// does, so a test can grant background location and see regions appear.
  final LocationService? location;

  bool available;

  @override
  final int regionLimit;

  final List<GeofenceRegion> registered = [];

  /// Every call to [register], so a test can see the churn.
  final List<List<GeofenceRegion>> registrations = [];

  int clearCalls = 0;

  @override
  Future<bool> isAvailable() async {
    final service = location;
    if (service == null) return available;
    return await service.currentPermission() == LocationPermissionState.always;
  }

  @override
  Future<void> register(List<GeofenceRegion> regions) async {
    registrations.add(List.unmodifiable(regions));
    registered
      ..clear()
      ..addAll(regions);
  }

  @override
  Future<void> clear() async {
    clearCalls++;
    registered.clear();
  }

  @override
  Future<List<int>> registeredPlaceIds() async => [
    for (final region in registered) region.placeId,
  ];
}
