import 'dart:ui' as ui;

import 'package:been_here/features/rephoto/then_and_now_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// A plain coloured rectangle of the given shape.
Future<ui.Image> _image(int width, int height, Color color) async {
  final recorder = ui.PictureRecorder();
  Canvas(recorder).drawRect(
    Rect.fromLTWH(0, 0, width.toDouble(), height.toDouble()),
    Paint()..color = color,
  );
  final picture = recorder.endRecording();
  final image = await picture.toImage(width, height);
  picture.dispose();
  return image;
}

void main() {
  test('puts both photos at the same height, whatever their shape', () async {
    // Landscape then, portrait now: the pair still has to read as a pair.
    final then = await _image(400, 300, Colors.red);
    final now = await _image(300, 400, Colors.blue);

    final png = await composeThenAndNow(
      then: then,
      now: now,
      thenLabel: 'Then',
      nowLabel: 'Now',
      targetHeight: 600,
    );
    then.dispose();
    now.dispose();

    expect(png, isNotNull);
    // ui rather than painting: decodeImageFromList wants a binding.
    final codec = await ui.instantiateImageCodec(png!);
    final decoded = (await codec.getNextFrame()).image;

    // 24 margin either side, two photos scaled to 600 tall, 16 between.
    expect(decoded.width, 24 * 2 + 800 + 16 + 450);
    // 24 either side, 600 of photo, 56 of label strip.
    expect(decoded.height, 24 * 2 + 600 + 56);
    decoded.dispose();
    codec.dispose();
  });

  test('is a real PNG', () async {
    final then = await _image(100, 100, Colors.red);
    final now = await _image(100, 100, Colors.blue);

    final png = await composeThenAndNow(
      then: then,
      now: now,
      thenLabel: 'Then',
      nowLabel: 'Now',
      targetHeight: 200,
    );
    then.dispose();
    now.dispose();

    expect(png, isNotNull);
    expect(png!.sublist(0, 8), [137, 80, 78, 71, 13, 10, 26, 10]);
  });
}
