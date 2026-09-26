import 'package:been_here/core/geo/map_scale.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const prague = 50.0755;

  test('a radius and a zoom are two ways of saying the same thing', () {
    for (final radius in [100.0, 500.0, 2500.0, 20000.0]) {
      final zoom = zoomForRadius(
        radiusMeters: radius,
        latitude: prague,
        viewportPixels: 400,
      );
      final back = radiusForZoom(
        zoom: zoom,
        latitude: prague,
        viewportPixels: 400,
      );
      expect(back, closeTo(radius, radius * 0.001));
    }
  });

  test('a wider circle means a wider view', () {
    final near = zoomForRadius(
      radiusMeters: 200,
      latitude: prague,
      viewportPixels: 400,
    );
    final far = zoomForRadius(
      radiusMeters: 5000,
      latitude: prague,
      viewportPixels: 400,
    );

    expect(far, lessThan(near));
    // Twenty-five times the radius is a little over four and a half zoom
    // levels — each level doubles.
    expect(near - far, closeTo(4.64, 0.05));
  });

  test('the same circle needs less zoom on a smaller card', () {
    final onACard = zoomForRadius(
      radiusMeters: 500,
      latitude: prague,
      viewportPixels: 170,
    );
    final fullScreen = zoomForRadius(
      radiusMeters: 500,
      latitude: prague,
      viewportPixels: 700,
    );

    expect(onACard, lessThan(fullScreen));
  });

  test('it answers in fractions, not in tile levels', () {
    // The whole point: nudging the radius has to move the map, not wait for
    // the next power of two.
    final a = zoomForRadius(
      radiusMeters: 500,
      latitude: prague,
      viewportPixels: 400,
    );
    final b = zoomForRadius(
      radiusMeters: 560,
      latitude: prague,
      viewportPixels: 400,
    );

    expect(a, isNot(b));
    expect(a - b, closeTo(0.16, 0.02));
  });

  test('latitude matters — mercator stretches towards the poles', () {
    final equator = zoomForRadius(
      radiusMeters: 1000,
      latitude: 0,
      viewportPixels: 400,
    );
    final reykjavik = zoomForRadius(
      radiusMeters: 1000,
      latitude: 64.1,
      viewportPixels: 400,
    );

    // One pixel covers fewer real metres the further north you go, so the
    // same kilometre needs the map pulled *back* to fit.
    expect(reykjavik, lessThan(equator));
  });

  test('it stays inside what the tiles can do', () {
    expect(
      zoomForRadius(radiusMeters: 1, latitude: prague, viewportPixels: 400),
      maxMapZoom,
    );
    expect(
      zoomForRadius(
        radiusMeters: 20000000,
        latitude: prague,
        viewportPixels: 400,
      ),
      minMapZoom,
    );
    // A nonsense radius must not produce a nonsense camera.
    expect(
      zoomForRadius(radiusMeters: 0, latitude: prague, viewportPixels: 400),
      maxMapZoom,
    );
  });
}
