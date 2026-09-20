import 'package:been_here/core/geo/geo_point.dart';
import 'package:been_here/core/logger.dart';
import 'package:been_here/data/location/location_service.dart';
import 'package:geolocator/geolocator.dart' as geo;

class GeolocatorLocationService implements LocationService {
  GeolocatorLocationService();

  static const _log = Logger('GeolocatorLocationService');

  /// A city-block fix is plenty: the tightest radius the app offers is 100 m,
  /// and asking for `best` costs battery for precision nobody sees.
  static const _settings = geo.LocationSettings(
    accuracy: geo.LocationAccuracy.high,
    timeLimit: Duration(seconds: 15),
  );

  @override
  Future<LocationPermissionState> currentPermission() async {
    if (!await geo.Geolocator.isLocationServiceEnabled()) {
      return LocationPermissionState.servicesDisabled;
    }
    return _map(await geo.Geolocator.checkPermission());
  }

  @override
  Future<LocationPermissionState> requestWhileInUse() async {
    if (!await geo.Geolocator.isLocationServiceEnabled()) {
      return LocationPermissionState.servicesDisabled;
    }
    return _map(await geo.Geolocator.requestPermission());
  }

  @override
  Future<LocationFix?> currentLocation() async {
    if (!(await currentPermission()).canLocate) return null;
    try {
      return _toFix(
        await geo.Geolocator.getCurrentPosition(locationSettings: _settings),
      );
    } on Exception catch (e) {
      // Indoors, airplane mode, a timeout — all ordinary, none fatal.
      _log.warning('current location unavailable', e);
      return null;
    }
  }

  @override
  Future<LocationFix?> lastKnownLocation() async {
    if (!(await currentPermission()).canLocate) return null;
    try {
      final position = await geo.Geolocator.getLastKnownPosition();
      return position == null ? null : _toFix(position);
    } on Exception catch (e) {
      _log.warning('last known location unavailable', e);
      return null;
    }
  }

  static LocationFix _toFix(geo.Position position) => LocationFix(
    point: GeoPoint(position.latitude, position.longitude),
    accuracyMeters: position.accuracy,
    at: position.timestamp,
  );

  /// Note what iOS collapses: CoreLocation's *not determined* and
  /// *restricted* both reach Dart as `denied`, so a denied state there does
  /// not mean the user said no — it usually means nobody has asked yet. The
  /// UI has to keep offering to ask.
  static LocationPermissionState _map(geo.LocationPermission permission) =>
      switch (permission) {
        geo.LocationPermission.denied => LocationPermissionState.denied,
        geo.LocationPermission.deniedForever =>
          LocationPermissionState.deniedForever,
        geo.LocationPermission.whileInUse => LocationPermissionState.whileInUse,
        geo.LocationPermission.always => LocationPermissionState.always,
        geo.LocationPermission.unableToDetermine =>
          LocationPermissionState.notDetermined,
      };
}
