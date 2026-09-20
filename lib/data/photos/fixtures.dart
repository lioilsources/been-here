import 'dart:math';

import 'package:been_here/core/geo/geo_point.dart';
import 'package:been_here/core/geo/haversine.dart';
import 'package:been_here/data/photos/photo_library.dart';
import 'package:meta/meta.dart';

/// A generated photo library plus the ground truth about it, so tests can
/// assert that clustering finds the places we actually planted.
@immutable
class LibraryFixture {
  const LibraryFixture({
    required this.assets,
    required this.home,
    required this.work,
    required this.tripPlaces,
  });

  /// Everything the fake library holds, videos included.
  final List<PhotoAsset> assets;

  /// The two dense everyday clusters. These must end up auto-muted.
  final GeoPoint home;
  final GeoPoint work;

  /// Trip destinations. These must not be auto-muted.
  final List<GeoPoint> tripPlaces;

  Iterable<PhotoAsset> get images => assets.where((a) => !a.isVideo);

  Iterable<PhotoAsset> get locatedImages => images.where((a) => a.hasLocation);
}

/// Builds a deterministic library that looks like a real one: two places the
/// user is at constantly, a few dozen places they visited a handful of times,
/// scattered noise, and a slice of photos with no GPS at all.
///
/// [photoCount] counts photos only; videos are generated on top of it.
LibraryFixture generateLibraryFixture({
  int photoCount = 50000,
  int seed = 42,
  double noGpsRatio = 0.12,
  double videoRatio = 0.05,
  int spanDays = 3650,
  DateTime? now,
}) {
  final rnd = Random(seed);
  final end = (now ?? DateTime.utc(2026, 9, 20)).toUtc();
  final origin = end.subtract(Duration(days: spanDays));

  const home = GeoPoint(50.075538, 14.437800); // Prague, Old Town Square
  const work = GeoPoint(50.100900, 14.393200); // ~5 km away

  final tripPlaces = <GeoPoint>[
    for (var i = 0; i < 40; i++)
      GeoPoint(
        36 + rnd.nextDouble() * 24, // 36..60 °N — Europe-ish
        -6 + rnd.nextDouble() * 30, // -6..24 °E
      ),
  ];

  final assets = <PhotoAsset>[];
  var nextId = 0;
  String newId() => 'asset_${(nextId++).toString().padLeft(7, '0')}';

  void emit(GeoPoint? at, DateTime takenAt, {bool isVideo = false}) {
    final landscape = rnd.nextBool();
    assets.add(
      PhotoAsset(
        id: newId(),
        lat: at?.lat,
        lng: at?.lng,
        takenAt: takenAt,
        width: landscape ? 4032 : 3024,
        height: landscape ? 3024 : 4032,
        isVideo: isVideo,
      ),
    );
  }

  DateTime dayTime(int dayOffset) => origin.add(
    Duration(
      days: dayOffset,
      hours: 7 + rnd.nextInt(14),
      minutes: rnd.nextInt(60),
      seconds: rnd.nextInt(60),
    ),
  );

  final homeCount = (photoCount * 0.40).round();
  final workCount = (photoCount * 0.18).round();
  final noiseCount = (photoCount * 0.10).round();
  final tripCount = photoCount - homeCount - workCount - noiseCount;

  // Home: most days over the whole decade.
  final homeDays = _pickDays(rnd, 1400, spanDays);
  for (var i = 0; i < homeCount; i++) {
    emit(
      _jitter(rnd, home, 60),
      dayTime(homeDays[rnd.nextInt(homeDays.length)]),
    );
  }

  // Work: weekdays only, and only the last six years.
  final workDays = _pickDays(
    rnd,
    900,
    spanDays,
    from: spanDays - 2190,
    weekdaysOnlyFrom: origin,
  );
  for (var i = 0; i < workCount; i++) {
    emit(
      _jitter(rnd, work, 90),
      dayTime(workDays[rnd.nextInt(workDays.length)]),
    );
  }

  // Trips: each place visited a few times, each visit one to three
  // consecutive days.
  final weights = [
    for (var i = 0; i < tripPlaces.length; i++) 1 + rnd.nextInt(5),
  ];
  final weightSum = weights.reduce((a, b) => a + b);
  var emittedTrips = 0;
  for (var i = 0; i < tripPlaces.length; i++) {
    final place = tripPlaces[i];
    final quota = i == tripPlaces.length - 1
        ? tripCount - emittedTrips
        : (tripCount * weights[i] / weightSum).round();
    if (quota <= 0) continue;

    final visits = 1 + rnd.nextInt(4);
    final perVisit = (quota / visits).ceil();
    for (var v = 0; v < visits && emittedTrips < tripCount; v++) {
      final startDay = rnd.nextInt(spanDays - 3);
      final visitDays = 1 + rnd.nextInt(3);
      for (var p = 0; p < perVisit && emittedTrips < tripCount; p++) {
        emit(
          _jitter(rnd, place, 150),
          dayTime(startDay + rnd.nextInt(visitDays)),
        );
        emittedTrips++;
      }
    }
  }

  // Noise: single photos nowhere in particular.
  for (var i = 0; i < noiseCount; i++) {
    emit(
      GeoPoint(35 + rnd.nextDouble() * 25, -10 + rnd.nextDouble() * 40),
      dayTime(rnd.nextInt(spanDays)),
    );
  }

  // Videos on top — the library holds them, the app must not index them.
  final videoCount = (photoCount * videoRatio).round();
  for (var i = 0; i < videoCount; i++) {
    emit(
      _jitter(rnd, rnd.nextBool() ? home : tripPlaces[rnd.nextInt(40)], 100),
      dayTime(rnd.nextInt(spanDays)),
      isVideo: true,
    );
  }

  // Strip GPS from a slice of them, the way old cameras and re-shared photos
  // arrive. Bias towards older assets, which is where it really happens.
  final noGpsTarget = (assets.length * noGpsRatio).round();
  var stripped = 0;
  final order = List<int>.generate(assets.length, (i) => i)..shuffle(rnd);
  for (final index in order) {
    if (stripped >= noGpsTarget) break;
    final asset = assets[index];
    final age = end.difference(asset.takenAt).inDays / spanDays;
    if (rnd.nextDouble() > 0.3 + age * 0.7) continue;
    assets[index] = PhotoAsset(
      id: asset.id,
      takenAt: asset.takenAt,
      width: asset.width,
      height: asset.height,
      isVideo: asset.isVideo,
    );
    stripped++;
  }

  return LibraryFixture(
    assets: assets,
    home: home,
    work: work,
    tripPlaces: tripPlaces,
  );
}

GeoPoint _jitter(Random rnd, GeoPoint center, double radiusMeters) {
  final angle = rnd.nextDouble() * 2 * pi;
  // sqrt keeps the sample uniform over the disc instead of clumping at
  // the centre.
  final distance = sqrt(rnd.nextDouble()) * radiusMeters;
  final dLat = distance * cos(angle) / metersPerDegreeLatitude;
  final perDegreeLng = metersPerDegreeLongitude(center.lat);
  final dLng = perDegreeLng == 0 ? 0.0 : distance * sin(angle) / perDegreeLng;
  return GeoPoint(center.lat + dLat, normalizeLongitude(center.lng + dLng));
}

/// [count] distinct day offsets in `[from, span)`, sorted.
List<int> _pickDays(
  Random rnd,
  int count,
  int span, {
  int from = 0,
  DateTime? weekdaysOnlyFrom,
}) {
  final picked = <int>{};
  final range = span - from;
  var guard = 0;
  while (picked.length < count && guard < count * 20) {
    guard++;
    final day = from + rnd.nextInt(range);
    if (weekdaysOnlyFrom != null) {
      final weekday = weekdaysOnlyFrom.add(Duration(days: day)).weekday;
      if (weekday == DateTime.saturday || weekday == DateTime.sunday) continue;
    }
    picked.add(day);
  }
  return picked.toList()..sort();
}
