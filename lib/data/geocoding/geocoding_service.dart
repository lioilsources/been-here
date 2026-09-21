import 'package:been_here/core/geo/geo_point.dart';
import 'package:been_here/core/logger.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:meta/meta.dart';

/// What came back from a reverse geocode.
///
/// "No name" and "no answer" are different things and the difference decides
/// what to do next: nothing is there, or the question has to be asked again
/// later. Collapsing both into null is what made a fast scroll leave half a
/// list permanently unnamed.
@immutable
sealed class GeocodeResult {
  const GeocodeResult();
}

/// A name for the place.
@immutable
final class GeocodeName extends GeocodeResult {
  const GeocodeName(this.name);

  final String name;
}

/// The geocoder answered, and there is nothing there worth calling a name —
/// a field, a stretch of motorway, the sea.
@immutable
final class GeocodeNothing extends GeocodeResult {
  const GeocodeNothing();
}

/// The geocoder did not answer: offline, or rate-limited. Worth asking again.
@immutable
final class GeocodeUnavailable extends GeocodeResult {
  const GeocodeUnavailable();
}

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
  Future<GeocodeResult> describe(GeoPoint point);
}

class PlatformGeocodingService implements GeocodingService {
  PlatformGeocodingService();

  static const _log = Logger('GeocodingService');

  final _geocoding = geo.Geocoding();

  @override
  Future<GeocodeResult> describe(GeoPoint point) async {
    try {
      final marks = await _geocoding.placemarkFromCoordinates(
        point.lat,
        point.lng,
      );
      if (marks.isEmpty) return const GeocodeNothing();
      final label = _label(marks.first);
      return label == null ? const GeocodeNothing() : GeocodeName(label);
    } on Exception catch (e) {
      // Both platforms throttle an app that asks too quickly, and both fail
      // the same way offline. Neither is permanent.
      _log.warning('reverse geocode failed for $point', e);
      return const GeocodeUnavailable();
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
  FakeGeocodingService({this.fallback, this.resolve, this.failFirst = 0});

  /// Returned for any point [resolve] has no opinion about.
  final String? fallback;

  /// Lets a test answer differently per point. Taking a point rather than a
  /// map key avoids tying assertions to the exact decimals of a double.
  final String? Function(GeoPoint point)? resolve;

  /// How many of the first calls should come back unavailable — a stand-in
  /// for a throttled geocoder.
  int failFirst;

  /// Every point this was asked about — which is the thing worth asserting,
  /// since each one is a coordinate that would have left the device.
  final List<GeoPoint> asked = [];

  /// How many requests were in flight at once. The geocoders throttle, so
  /// the answer has to stay one.
  int concurrent = 0;
  int peakConcurrent = 0;

  @override
  Future<GeocodeResult> describe(GeoPoint point) async {
    asked.add(point);
    concurrent++;
    peakConcurrent = concurrent > peakConcurrent ? concurrent : peakConcurrent;
    try {
      await Future<void>.delayed(Duration.zero);
      if (failFirst > 0) {
        failFirst--;
        return const GeocodeUnavailable();
      }
      final name = resolve?.call(point) ?? fallback;
      return name == null ? const GeocodeNothing() : GeocodeName(name);
    } finally {
      concurrent--;
    }
  }
}
