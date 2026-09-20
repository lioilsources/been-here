import 'dart:typed_data';

import 'package:been_here/core/image/edge_detect.dart';
import 'package:flutter_test/flutter_test.dart';

/// A [width] x [height] image painted by [shade], which returns 0..255.
RgbaImage _image(int width, int height, int Function(int x, int y) shade) {
  final pixels = Uint8List(width * height * 4);
  for (var y = 0; y < height; y++) {
    for (var x = 0; x < width; x++) {
      final value = shade(x, y);
      final i = (y * width + x) * 4;
      pixels[i] = value;
      pixels[i + 1] = value;
      pixels[i + 2] = value;
      pixels[i + 3] = 255;
    }
  }
  return RgbaImage(pixels: pixels, width: width, height: height);
}

int _alphaAt(RgbaImage image, int x, int y) =>
    image.pixels[(y * image.width + x) * 4 + 3];

int _litPixels(RgbaImage image) {
  var lit = 0;
  for (var i = 3; i < image.pixels.length; i += 4) {
    if (image.pixels[i] > 0) lit++;
  }
  return lit;
}

void main() {
  group('detectEdges', () {
    test('a flat image has no edges', () {
      final edges = detectEdges(_image(16, 16, (_, _) => 128));
      expect(_litPixels(edges), 0);
    });

    test('finds a vertical edge, and only there', () {
      // Black on the left, white on the right, splitting at x = 8.
      final edges = detectEdges(_image(16, 16, (x, _) => x < 8 ? 0 : 255));

      // The gradient straddles the boundary, so both sides of it light up.
      expect(_alphaAt(edges, 7, 8), greaterThan(0));
      expect(_alphaAt(edges, 8, 8), greaterThan(0));
      // Well away from it, nothing.
      expect(_alphaAt(edges, 3, 8), 0);
      expect(_alphaAt(edges, 13, 8), 0);
    });

    test('finds a horizontal edge too', () {
      final edges = detectEdges(_image(16, 16, (_, y) => y < 8 ? 0 : 255));

      expect(_alphaAt(edges, 8, 7), greaterThan(0));
      expect(_alphaAt(edges, 8, 8), greaterThan(0));
      expect(_alphaAt(edges, 8, 2), 0);
    });

    test('lines are white so they read over a camera preview', () {
      final edges = detectEdges(_image(16, 16, (x, _) => x < 8 ? 0 : 255));
      const i = (8 * 16 + 8) * 4;

      expect(edges.pixels[i], 255);
      expect(edges.pixels[i + 1], 255);
      expect(edges.pixels[i + 2], 255);
    });

    test('a stronger edge draws a stronger line', () {
      final hard = detectEdges(_image(16, 16, (x, _) => x < 8 ? 0 : 255));
      final soft = detectEdges(
        _image(16, 16, (x, _) => x < 8 ? 100 : 160),
        threshold: 10,
      );

      expect(_alphaAt(hard, 8, 8), greaterThan(_alphaAt(soft, 8, 8)));
    });

    test('the threshold decides what counts as an edge', () {
      // A gentle ramp: every step is small.
      RgbaImage ramp() => _image(16, 16, (x, _) => x * 4);

      expect(_litPixels(detectEdges(ramp(), threshold: 5)), greaterThan(0));
      expect(_litPixels(detectEdges(ramp(), threshold: 200)), 0);
    });

    test('the border stays empty rather than framing the picture', () {
      final edges = detectEdges(_image(16, 16, (x, _) => x < 8 ? 0 : 255));

      for (var x = 0; x < 16; x++) {
        expect(_alphaAt(edges, x, 0), 0, reason: 'top row at $x');
        expect(_alphaAt(edges, x, 15), 0, reason: 'bottom row at $x');
      }
      for (var y = 0; y < 16; y++) {
        expect(_alphaAt(edges, 0, y), 0, reason: 'left column at $y');
        expect(_alphaAt(edges, 15, y), 0, reason: 'right column at $y');
      }
    });

    test('keeps the size it was given', () {
      final edges = detectEdges(_image(9, 5, (x, y) => x * y));
      expect(edges.width, 9);
      expect(edges.height, 5);
      expect(edges.pixels.length, 9 * 5 * 4);
    });

    test('colour weighs the way luminance does', () {
      // Pure green is much brighter than pure blue, so a green/blue split is
      // an edge even though neither is lighter in raw byte value.
      final pixels = Uint8List(16 * 16 * 4);
      for (var y = 0; y < 16; y++) {
        for (var x = 0; x < 16; x++) {
          final i = (y * 16 + x) * 4;
          if (x < 8) {
            pixels[i + 1] = 255; // green
          } else {
            pixels[i + 2] = 255; // blue
          }
          pixels[i + 3] = 255;
        }
      }

      final edges = detectEdges(
        RgbaImage(pixels: pixels, width: 16, height: 16),
      );
      expect(_alphaAt(edges, 8, 8), greaterThan(0));
    });

    test('a one-pixel image is not a crash', () {
      final edges = detectEdges(_image(1, 1, (_, _) => 200));
      expect(_litPixels(edges), 0);
    });
  });
}
