import 'package:been_here/core/geo/geo_point.dart';
import 'package:been_here/core/logger.dart';
import 'package:geocoding/geocoding.dart' as geo;

/// Turns a coordinate into a name a person would use.
///
/// The one thing in this app that can leave the device: the system geocoder
/// is Apple's or Google's, and asking it a question means telling them where
/// the user has been. Off unless the user turns it on, and asked lazily —
/// only for places actually on screen, never for the whole library.
// An interface rather than a bare function: it is the seam a fake is
// substituted at, and where the platform plugin stops.
// ignore: one_member_abstracts
abstract interface class GeocodingService {
  /// A short label, or null if nothing useful came back.
  Future<String?> describe(GeoPoint point);
}

class PlatformGeocodingService implements GeocodingService {
  PlatformGeocodingService();

  static const _log = Logger('GeocodingService');

  final _geocoding = geo.Geocoding();

  @override
  Future<String?> describe(GeoPoint point) async {
    try {
      final marks = await _geocoding.placemarkFromCoordinates(
        point.lat,
        point.lng,
      );
      if (marks.isEmpty) return null;
      return _label(marks.first);
    } on Exception catch (e) {
      // Offline, rate-limited, or nothing there. A place without a name is
      // still a place.
      _log.warning('reverse geocode failed for $point', e);
      return null;
    }
  }

  /// The most specific thing that is still recognisable: a street or
  /// landmark if there is one, otherwise the town.
  static String? _label(geo.Placemark mark) {
    final parts = <String>[
      for (final candidate in [mark.name, mark.thoroughfare, mark.subLocality])
        if (candidate != null && candidate.trim().isNotEmpty) candidate.trim(),
    ];
    final area = [mark.locality, mark.administrativeArea, mark.country]
        .whereType<String>()
        .map((s) => s.trim())
        .firstWhere((s) => s.isNotEmpty, orElse: () => '');

    final specific = parts.isEmpty ? null : parts.first;
    if (specific == null) return area.isEmpty ? null : area;
    if (area.isEmpty || area == specific) return specific;
    return '$specific, $area';
  }
}

/// For tests, and for anyone who would rather the app never asked.
class FakeGeocodingService implements GeocodingService {
  FakeGeocodingService({this.fallback, this.resolve});

  /// Returned for any point [resolve] has no opinion about.
  final String? fallback;

  /// Lets a test answer differently per point. Taking a point rather than a
  /// map key avoids tying assertions to the exact decimals of a double.
  final String? Function(GeoPoint point)? resolve;

  /// Every point this was asked about — which is the thing worth asserting,
  /// since each one is a coordinate that would have left the device.
  final List<GeoPoint> asked = [];

  @override
  Future<String?> describe(GeoPoint point) async {
    asked.add(point);
    return resolve?.call(point) ?? fallback;
  }
}
