import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/painting.dart';

/// Space between the two halves, and around the whole thing.
const double _gap = 16;
const double _margin = 24;
const double _labelHeight = 56;

/// Draws the two photos side by side, labelled, as one shareable image.
///
/// Composed here rather than by screenshotting the comparison widget: a
/// screenshot would carry the phone's pixel density, the theme and whatever
/// happened to be on screen, and would be capped at the screen's resolution.
/// This is the picture itself.
Future<Uint8List?> composeThenAndNow({
  required ui.Image then,
  required ui.Image now,
  required String thenLabel,
  required String nowLabel,
  double targetHeight = 1400,
}) async {
  // Both halves get the same height, so they read as a pair however
  // differently they were framed.
  final thenWidth = targetHeight * then.width / then.height;
  final nowWidth = targetHeight * now.width / now.height;

  final width = _margin * 2 + thenWidth + _gap + nowWidth;
  final height = _margin * 2 + targetHeight + _labelHeight;

  final recorder = ui.PictureRecorder();
  final canvas = Canvas(recorder)
    ..drawRect(
      Rect.fromLTWH(0, 0, width, height),
      Paint()..color = const Color(0xFF161210),
    );

  void draw(ui.Image image, double left, double drawWidth, String label) {
    canvas
      ..drawImageRect(
        image,
        Rect.fromLTWH(
          0,
          0,
          image.width.toDouble(),
          image.height.toDouble(),
        ),
        Rect.fromLTWH(left, _margin, drawWidth, targetHeight),
        Paint()..filterQuality = FilterQuality.high,
      )
      ..drawParagraph(
        _label(label, drawWidth),
        Offset(left, _margin + targetHeight + 14),
      );
  }

  draw(then, _margin, thenWidth, thenLabel);
  draw(now, _margin + thenWidth + _gap, nowWidth, nowLabel);

  final picture = recorder.endRecording();
  final image = await picture.toImage(width.round(), height.round());
  picture.dispose();

  final data = await image.toByteData(format: ui.ImageByteFormat.png);
  image.dispose();
  return data?.buffer.asUint8List();
}

ui.Paragraph _label(String text, double width) {
  final builder =
      ui.ParagraphBuilder(
          ui.ParagraphStyle(
            textAlign: TextAlign.center,
            fontSize: 26,
            fontWeight: FontWeight.w600,
          ),
        )
        ..pushStyle(ui.TextStyle(color: const Color(0xFFF6EFE9)))
        ..addText(text);

  return builder.build()..layout(ui.ParagraphConstraints(width: width));
}
