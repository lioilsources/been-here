import 'package:been_here/core/geo/geo_point.dart';
import 'package:been_here/data/location/location_service.dart';

/// In-memory [LocationService] for tests and for the debug location override
/// — the one that makes it possible to test "what do I have at the castle"
/// from the sofa.
class FakeLocationService implements LocationService {
  FakeLocationService({
    GeoPoint? at,
    this.permission = LocationPermissionState.whileInUse,
    this.permissionAfterRequest,
    this.accuracyMeters = 12,
    this.delay,
    this.failsToFix = false,
    DateTime? fixedAt,
  }) : point = at,
       _fixedAt = fixedAt ?? DateTime.utc(2026, 9, 20, 12);

  /// Where the simulated user is. Setting it is what the debug location
  /// override does.
  GeoPoint? point;
  final DateTime _fixedAt;

  LocationPermissionState permission;
  final LocationPermissionState? permissionAfterRequest;
  final double accuracyMeters;

  /// Artificial latency, so a test can look at the loading state.
  final Duration? delay;

  /// Simulates being indoors: permission is fine, no fix arrives.
  bool failsToFix;

  int currentLocationCalls = 0;

  @override
  Future<LocationPermissionState> currentPermission() async => permission;

  @override
  Future<LocationPermissionState> requestWhileInUse() async =>
      permission = permissionAfterRequest ?? permission;

  @override
  Future<LocationFix?> currentLocation() async {
    currentLocationCalls++;
    if (delay != null) await Future<void>.delayed(delay!);
    if (!permission.canLocate || failsToFix) return null;
    final at = point;
    if (at == null) return null;
    return LocationFix(
      point: at,
      accuracyMeters: accuracyMeters,
      at: _fixedAt,
    );
  }

  @override
  Future<LocationFix?> lastKnownLocation() => currentLocation();
}
