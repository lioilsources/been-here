import 'package:been_here/core/geo/geo_point.dart';
import 'package:been_here/core/geo/haversine.dart';
import 'package:been_here/data/photos/fake_photo_library.dart';
import 'package:been_here/data/photos/fixtures.dart';
import 'package:been_here/data/photos/photo_library.dart';
import 'package:flutter_test/flutter_test.dart';

int _distinctUtcDaysNear(
  LibraryFixture fixture,
  GeoPoint center,
  double radiusMeters,
) {
  final days = <int>{};
  for (final asset in fixture.images) {
    final point = asset.point;
    if (point == null) continue;
    if (distanceMeters(point, center) > radiusMeters) continue;
    days.add(asset.takenAt.toUtc().millisecondsSinceEpoch ~/ 86400000);
  }
  return days.length;
}

void main() {
  group('generateLibraryFixture', () {
    late LibraryFixture fixture;

    setUpAll(() {
      fixture = generateLibraryFixture();
    });

    test('generates the requested number of photos plus videos', () {
      expect(fixture.images, hasLength(50000));
      expect(fixture.assets.where((a) => a.isVideo), hasLength(2500));
    });

    test('is deterministic for a given seed', () {
      final a = generateLibraryFixture(photoCount: 2000);
      final b = generateLibraryFixture(photoCount: 2000);
      expect(a.assets.length, b.assets.length);
      for (var i = 0; i < a.assets.length; i++) {
        expect(a.assets[i].id, b.assets[i].id);
        expect(a.assets[i].lat, b.assets[i].lat);
        expect(a.assets[i].takenAt, b.assets[i].takenAt);
      }
      expect(a.home, b.home);
      expect(a.tripPlaces, b.tripPlaces);
    });

    test('a different seed moves the trip places', () {
      final other = generateLibraryFixture(photoCount: 2000, seed: 99);
      expect(other.tripPlaces, isNot(fixture.tripPlaces));
    });

    test('asset ids are unique', () {
      final ids = fixture.assets.map((a) => a.id).toSet();
      expect(ids, hasLength(fixture.assets.length));
    });

    test('home and work are dense enough to trip the auto-mute rule', () {
      expect(
        _distinctUtcDaysNear(fixture, fixture.home, 200),
        greaterThan(1000),
      );
      expect(
        _distinctUtcDaysNear(fixture, fixture.work, 200),
        greaterThan(500),
      );
    });

    test('trip places stay well under the auto-mute threshold', () {
      final dayCounts = fixture.tripPlaces
          .map((p) => _distinctUtcDaysNear(fixture, p, 300))
          .toList();
      expect(dayCounts.where((d) => d > 0), isNotEmpty);
      expect(
        dayCounts.every((d) => d < 30),
        isTrue,
        reason:
            'max distinct days on a trip place: '
            '${dayCounts.reduce((a, b) => a > b ? a : b)}',
      );
    });

    test('about a tenth of the library has no GPS', () {
      final missing = fixture.assets.where((a) => !a.hasLocation).length;
      final ratio = missing / fixture.assets.length;
      expect(ratio, closeTo(0.12, 0.03));
    });

    test('every located asset is a valid coordinate', () {
      for (final asset in fixture.assets) {
        if (!asset.hasLocation) continue;
        expect(GeoPoint(asset.lat!, asset.lng!).isValid, isTrue);
      }
    });

    test('photos span the requested window', () {
      final times = fixture.images.map((a) => a.takenAt).toList()..sort();
      expect(
        times.last.difference(times.first).inDays,
        greaterThan(3000),
      );
    });
  });

  group('FakePhotoLibrary over the fixture', () {
    late FakePhotoLibrary library;
    late LibraryFixture fixture;

    setUp(() {
      fixture = generateLibraryFixture(photoCount: 5000);
      library = FakePhotoLibrary(assets: fixture.assets);
    });

    tearDown(() => library.dispose());

    test('reports images only', () async {
      expect(await library.assetCount(), 5000);
    });

    test('never serves a video', () async {
      final page = await library.page(offset: 0, limit: 5000);
      expect(page.any((a) => a.isVideo), isFalse);
    });

    test('paging is stable and covers everything exactly once', () async {
      final seen = <String>[];
      var offset = 0;
      while (true) {
        final page = await library.page(offset: offset, limit: 500);
        if (page.isEmpty) break;
        seen.addAll(page.map((a) => a.id));
        offset += page.length;
      }
      expect(seen, hasLength(5000));
      expect(seen.toSet(), hasLength(5000));
    });

    test('pages come back ordered by capture time', () async {
      final page = await library.page(offset: 0, limit: 5000);
      for (var i = 1; i < page.length; i++) {
        expect(
          page[i].takenAt.isBefore(page[i - 1].takenAt),
          isFalse,
          reason: 'page not sorted at $i',
        );
      }
    });

    test('reads past the end return empty, not an error', () async {
      expect(await library.page(offset: 99999, limit: 10), isEmpty);
    });

    test('removals show up immediately', () async {
      final first = (await library.page(offset: 0, limit: 1)).single;
      library.removeIds({first.id});
      expect(await library.assetCount(), 4999);
      final again = (await library.page(offset: 0, limit: 1)).single;
      expect(again.id, isNot(first.id));
    });

    test('changes stream fires on mutation', () async {
      final events = <void>[];
      final sub = library.changes.listen(events.add);
      library.addAll([
        PhotoAsset(
          id: 'new',
          takenAt: DateTime.utc(2026, 9, 20),
          width: 100,
          height: 100,
        ),
      ]);
      await Future<void>.delayed(Duration.zero);
      expect(events, hasLength(1));
      await sub.cancel();
    });

    test('failAfterPages interrupts a scan', () async {
      library.failAfterPages = 2;
      await library.page(offset: 0, limit: 10);
      await library.page(offset: 10, limit: 10);
      expect(
        () => library.page(offset: 20, limit: 10),
        throwsA(isA<Exception>()),
      );
    });

    test('permission can be granted by the prompt', () async {
      final restricted = FakePhotoLibrary(
        permission: PhotoPermission.notDetermined,
        permissionAfterRequest: PhotoPermission.limited,
      );
      expect(
        await restricted.currentPermission(),
        PhotoPermission.notDetermined,
      );
      expect(await restricted.requestPermission(), PhotoPermission.limited);
      expect(await restricted.currentPermission(), PhotoPermission.limited);
      await restricted.dispose();
    });
  });

  group('PhotoAsset.point', () {
    test('treats exactly null island as missing', () {
      final asset = PhotoAsset(
        id: 'x',
        lat: 0,
        lng: 0,
        takenAt: _epoch,
        width: 1,
        height: 1,
      );
      expect(asset.hasLocation, isTrue);
      expect(asset.point, isNull);
    });

    test('rejects out-of-range coordinates', () {
      final asset = PhotoAsset(
        id: 'x',
        lat: 91,
        lng: 0,
        takenAt: _epoch,
        width: 1,
        height: 1,
      );
      expect(asset.point, isNull);
    });

    test('keeps a real coordinate', () {
      final asset = PhotoAsset(
        id: 'x',
        lat: 50.0755,
        lng: 14.4378,
        takenAt: _epoch,
        width: 1,
        height: 1,
      );
      expect(asset.point, const GeoPoint(50.0755, 14.4378));
    });
  });
}

final DateTime _epoch = DateTime.utc(2020);
