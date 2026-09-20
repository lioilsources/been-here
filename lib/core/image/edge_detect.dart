import 'dart:math' as math;
import 'dart:typed_data';

/// Raw pixels, four bytes each, row by row.
class RgbaImage {
  RgbaImage({
    required this.pixels,
    required this.width,
    required this.height,
  }) : assert(
         pixels.length == width * height * 4,
         'pixels must be width * height * 4 bytes',
       );

  final Uint8List pixels;
  final int width;
  final int height;

  int get pixelCount => width * height;
}

/// Outlines, for lining a camera up with an old photo.
///
/// The plan calls for "a simple edge detect" and means it: what matters when
/// matching a shot is where the strong lines are — a roofline, a doorway —
/// not a good-looking edge map. Sobel gives that in one pass over the pixels
/// with no dependencies and no decoding beyond what the caller already did.
///
/// Returns white lines on transparent, so it can be laid straight over a
/// camera preview.
RgbaImage detectEdges(
  RgbaImage source, {
  int threshold = 60,
  int lineAlpha = 230,
}) {
  final width = source.width;
  final height = source.height;
  final gray = _grayscale(source);
  final out = Uint8List(width * height * 4);

  // The border has no full neighbourhood, so it stays transparent rather
  // than growing a frame of false edges.
  for (var y = 1; y < height - 1; y++) {
    for (var x = 1; x < width - 1; x++) {
      final topLeft = gray[(y - 1) * width + (x - 1)];
      final top = gray[(y - 1) * width + x];
      final topRight = gray[(y - 1) * width + (x + 1)];
      final left = gray[y * width + (x - 1)];
      final right = gray[y * width + (x + 1)];
      final bottomLeft = gray[(y + 1) * width + (x - 1)];
      final bottom = gray[(y + 1) * width + x];
      final bottomRight = gray[(y + 1) * width + (x + 1)];

      final gx =
          -topLeft + topRight - 2 * left + 2 * right - bottomLeft + bottomRight;
      final gy =
          -topLeft - 2 * top - topRight + bottomLeft + 2 * bottom + bottomRight;

      // Manhattan instead of the true magnitude: a square root per pixel for
      // a difference nobody can see through a camera viewfinder.
      final magnitude = gx.abs() + gy.abs();
      if (magnitude < threshold) continue;

      final strength = math.min(255, magnitude);
      final index = (y * width + x) * 4;
      out[index] = 255;
      out[index + 1] = 255;
      out[index + 2] = 255;
      out[index + 3] = (strength * lineAlpha) ~/ 255;
    }
  }

  return RgbaImage(pixels: out, width: width, height: height);
}

/// Luminance, the way eyes weigh it.
Uint8List _grayscale(RgbaImage source) {
  final gray = Uint8List(source.pixelCount);
  for (var i = 0; i < gray.length; i++) {
    final p = i * 4;
    gray[i] =
        (source.pixels[p] * 77 +
            source.pixels[p + 1] * 150 +
            source.pixels[p + 2] * 29) >>
        8;
  }
  return gray;
}
