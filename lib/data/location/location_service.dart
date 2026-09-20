import 'package:been_here/core/geo/geo_point.dart';
import 'package:meta/meta.dart';

/// How much location access the app has.
enum LocationPermissionState {
  notDetermined,

  /// Location while the app is in the foreground. Enough for the Here screen.
  whileInUse,

  /// Also in the background. Only needed for geofence notifications, and only
  /// ever asked for after the user has seen what the app does.
  always,

  denied,

  /// Denied and the system will not ask again — only the settings app can
  /// change it.
  deniedForever,

  /// Location services are off device-wide.
  servicesDisabled;

  bool get canLocate => this == whileInUse || this == always;

  /// Whether asking again would produce a prompt rather than nothing.
  bool get isAskable => this == notDetermined || this == denied;
}

/// A fix, with the accuracy the system claimed for it.
@immutable
class LocationFix {
  const LocationFix({
    required this.point,
    required this.accuracyMeters,
    required this.at,
  });

  final GeoPoint point;

  /// Radius of the 68% confidence circle, in metres.
  final double accuracyMeters;

  final DateTime at;

  @override
  String toString() => 'LocationFix($point ±${accuracyMeters.round()}m at $at)';
}

/// Where the user is.
///
/// Deliberately request-response rather than a stream: the app never tracks
/// the user continuously. Arrival detection is the system's job (region
/// monitoring), not a location loop of ours — that is the difference between
/// an app that costs no battery and one that does.
abstract interface class LocationService {
  Future<LocationPermissionState> currentPermission();

  /// Prompts for foreground access.
  Future<LocationPermissionState> requestWhileInUse();

  /// A fresh fix. Null if permission is missing or the fix times out.
  Future<LocationFix?> currentLocation();

  /// The last fix the system already had. Cheap and instant, possibly stale —
  /// good enough to render something while the real fix arrives.
  Future<LocationFix?> lastKnownLocation();
}
