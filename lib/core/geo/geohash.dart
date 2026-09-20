import 'package:been_here/core/geo/bounding_box.dart';
import 'package:been_here/core/geo/geo_point.dart';

const String _base32 = '0123456789bcdefghjkmnpqrstuvwxyz';

/// Cell size used for place clustering: ~153 m x ~153 m at the equator.
const int placeGeohashPrecision = 7;

/// Encodes [point] into a geohash of [precision] characters.
String encodeGeohash(GeoPoint point, {int precision = placeGeohashPrecision}) {
  assert(precision > 0 && precision <= 12, 'precision must be 1..12');

  var latMin = -90.0;
  var latMax = 90.0;
  var lngMin = -180.0;
  var lngMax = 180.0;

  final hash = StringBuffer();
  var evenBit = true; // Longitude bits come first.
  var bitCount = 0;
  var charBits = 0;

  final lat = point.lat.clamp(-90.0, 90.0);
  final lng = normalizeLongitude(point.lng);

  while (hash.length < precision) {
    if (evenBit) {
      final mid = (lngMin + lngMax) / 2;
      if (lng >= mid) {
        charBits = (charBits << 1) | 1;
        lngMin = mid;
      } else {
        charBits <<= 1;
        lngMax = mid;
      }
    } else {
      final mid = (latMin + latMax) / 2;
      if (lat >= mid) {
        charBits = (charBits << 1) | 1;
        latMin = mid;
      } else {
        charBits <<= 1;
        latMax = mid;
      }
    }
    evenBit = !evenBit;

    bitCount++;
    if (bitCount == 5) {
      hash.write(_base32[charBits]);
      bitCount = 0;
      charBits = 0;
    }
  }

  return hash.toString();
}

/// The rectangle covered by [hash].
///
/// Throws [FormatException] if [hash] contains a character outside the
/// geohash base32 alphabet.
BoundingBox decodeGeohashBounds(String hash) {
  var latMin = -90.0;
  var latMax = 90.0;
  var lngMin = -180.0;
  var lngMax = 180.0;
  var evenBit = true;

  for (final char in hash.toLowerCase().split('')) {
    final index = _base32.indexOf(char);
    if (index < 0) {
      throw FormatException('Not a geohash character: $char', hash);
    }
    for (var mask = 16; mask > 0; mask >>= 1) {
      final bit = (index & mask) != 0;
      if (evenBit) {
        final mid = (lngMin + lngMax) / 2;
        if (bit) {
          lngMin = mid;
        } else {
          lngMax = mid;
        }
      } else {
        final mid = (latMin + latMax) / 2;
        if (bit) {
          latMin = mid;
        } else {
          latMax = mid;
        }
      }
      evenBit = !evenBit;
    }
  }

  return BoundingBox(
    minLat: latMin,
    maxLat: latMax,
    minLng: lngMin,
    maxLng: lngMax,
  );
}

/// Centre point of the cell [hash] covers.
GeoPoint decodeGeohash(String hash) {
  final bounds = decodeGeohashBounds(hash);
  return GeoPoint(
    (bounds.minLat + bounds.maxLat) / 2,
    (bounds.minLng + bounds.maxLng) / 2,
  );
}

/// The up-to-eight cells touching [hash], same precision.
///
/// Cells beyond a pole have no neighbour and are simply left out, so the
/// result can be shorter than eight near ±90°. Longitude wraps normally, so a
/// cell at the antimeridian does get its neighbours on the other side.
List<String> geohashNeighbors(String hash) {
  final bounds = decodeGeohashBounds(hash);
  final center = decodeGeohash(hash);
  final height = bounds.maxLat - bounds.minLat;
  final width = bounds.maxLng - bounds.minLng;

  final result = <String>[];
  for (var dy = 1; dy >= -1; dy--) {
    for (var dx = -1; dx <= 1; dx++) {
      if (dx == 0 && dy == 0) continue;
      final lat = center.lat + dy * height;
      if (lat > 90 || lat < -90) continue;
      final lng = normalizeLongitude(center.lng + dx * width);
      result.add(encodeGeohash(GeoPoint(lat, lng), precision: hash.length));
    }
  }
  return result;
}
