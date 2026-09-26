import 'dart:math' as math;

/// Metres per pixel at the equator, zoom 0, with 256-pixel tiles. The whole
/// web-mercator scale hangs off this one number: 40 075 016.7 m of equator
/// across 256 px.
const double equatorMetresPerPixel = 156543.03392804097;

/// How much of the shorter side of the map the search circle should cover.
///
/// Not all of it: a circle that touches the edges looks like a mistake, and
/// the ring itself has to stay visible at the sides.
const double circleViewportFraction = 0.72;

/// The smallest and largest zoom the tiles go to.
const double minMapZoom = 2;
const double maxMapZoom = 19;

double _metresPerPixel({required double latitude, required double zoom}) =>
    equatorMetresPerPixel *
    math.cos(latitude * math.pi / 180) /
    math.pow(2, zoom);

/// The zoom at which a circle of [radiusMeters] fills
/// [circleViewportFraction] of a viewport [viewportPixels] across.
///
/// Fractional on purpose. Rounding to whole zoom levels — which is what the
/// tile grid is made of — means the map only reacts to every second or third
/// nudge of the radius, and a control that ignores most of what you do with
/// it feels broken rather than coarse.
double zoomForRadius({
  required double radiusMeters,
  required double latitude,
  required double viewportPixels,
  double fraction = circleViewportFraction,
}) {
  if (radiusMeters <= 0 || viewportPixels <= 0) return maxMapZoom;

  // metresPerPixel has to be: diameter / the pixels we want it to cover.
  final wanted = radiusMeters * 2 / (viewportPixels * fraction);
  final atZoomZero = _metresPerPixel(latitude: latitude, zoom: 0);
  final zoom = math.log(atZoomZero / wanted) / math.ln2;

  return zoom.clamp(minMapZoom, maxMapZoom);
}

/// The radius whose circle fills the viewport at [zoom] — the inverse of
/// [zoomForRadius], so that dragging the map and dragging the radius are two
/// ways of doing the same thing.
double radiusForZoom({
  required double zoom,
  required double latitude,
  required double viewportPixels,
  double fraction = circleViewportFraction,
}) {
  final perPixel = _metresPerPixel(latitude: latitude, zoom: zoom);
  return perPixel * viewportPixels * fraction / 2;
}
