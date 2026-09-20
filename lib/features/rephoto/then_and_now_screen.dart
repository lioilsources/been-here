import 'dart:async';
import 'dart:io';

import 'package:been_here/app/providers.dart';
import 'package:been_here/features/here/widgets/photo_thumbnail.dart';
import 'package:been_here/features/rephoto/then_and_now_image.dart';
import 'package:been_here/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

/// The same place, twice, with a handle to wipe between them.
///
/// A slider rather than two pictures side by side: the point is what changed,
/// and you only see that when the two are in the same place on screen.
class ThenAndNowScreen extends ConsumerStatefulWidget {
  const ThenAndNowScreen({
    required this.thenAssetId,
    required this.nowAssetId,
    super.key,
  });

  final String thenAssetId;
  final String nowAssetId;

  static Future<void> open(
    BuildContext context, {
    required String thenAssetId,
    required String nowAssetId,
  }) => Navigator.of(context).push(
    MaterialPageRoute<void>(
      builder: (_) => ThenAndNowScreen(
        thenAssetId: thenAssetId,
        nowAssetId: nowAssetId,
      ),
    ),
  );

  @override
  ConsumerState<ThenAndNowScreen> createState() => _ThenAndNowScreenState();
}

class _ThenAndNowScreenState extends ConsumerState<ThenAndNowScreen> {
  double _split = 0.5;
  bool _sharing = false;

  Future<void> _share() async {
    setState(() => _sharing = true);
    final l10n = AppLocalizations.of(context);

    try {
      final library = ref.read(photoLibraryProvider);
      final thenBytes = await library.thumbnail(
        widget.thenAssetId,
        width: 2000,
        height: 2000,
      );
      final nowBytes = await library.thumbnail(
        widget.nowAssetId,
        width: 2000,
        height: 2000,
      );
      if (thenBytes == null || nowBytes == null) throw StateError('no bytes');

      final then = await decodeImageFromList(thenBytes);
      final now = await decodeImageFromList(nowBytes);

      final png = await composeThenAndNow(
        then: then,
        now: now,
        thenLabel: l10n.rephotoThen,
        nowLabel: l10n.rephotoNow,
      );
      then.dispose();
      now.dispose();
      if (png == null) throw StateError('no image');

      // Through a file rather than raw bytes: the share sheet hands other
      // apps a file, and a temporary one is cleaned up by the system.
      final dir = await getTemporaryDirectory();
      final file = File(
        '${dir.path}/then-and-now-'
        '${DateTime.now().millisecondsSinceEpoch}.png',
      );
      await file.writeAsBytes(png);

      await SharePlus.instance.share(
        ShareParams(files: [XFile(file.path)]),
      );
    } on Object catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.rephotoShareFailed)));
    } finally {
      if (mounted) setState(() => _sharing = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Theme(
      data: ThemeData.dark(useMaterial3: true),
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
          title: Text(l10n.rephotoThenAndNow),
          actions: [
            IconButton(
              onPressed: _sharing ? null : () => unawaited(_share()),
              icon: _sharing
                  ? const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.ios_share),
              tooltip: l10n.rephotoShare,
            ),
          ],
        ),
        extendBodyBehindAppBar: true,
        body: Column(
          children: [
            Expanded(
              child: _Wipe(
                thenAssetId: widget.thenAssetId,
                nowAssetId: widget.nowAssetId,
                split: _split,
                onSplit: (value) => setState(() => _split = value),
              ),
            ),
            SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
                child: Row(
                  children: [
                    Text(
                      l10n.rephotoThen,
                      style: const TextStyle(color: Colors.white70),
                    ),
                    Expanded(
                      child: Slider(
                        value: _split,
                        onChanged: (value) => setState(() => _split = value),
                      ),
                    ),
                    Text(
                      l10n.rephotoNow,
                      style: const TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Wipe extends StatelessWidget {
  const _Wipe({
    required this.thenAssetId,
    required this.nowAssetId,
    required this.split,
    required this.onSplit,
  });

  final String thenAssetId;
  final String nowAssetId;
  final double split;
  final ValueChanged<double> onSplit;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (context, constraints) {
      final width = constraints.maxWidth;

      void drag(Offset position) =>
          onSplit((position.dx / width).clamp(0.0, 1.0));

      return GestureDetector(
        // Dragging anywhere on the picture moves the seam; reaching for the
        // slider to compare two photos breaks the comparison.
        onHorizontalDragUpdate: (d) => drag(d.localPosition),
        onTapDown: (d) => drag(d.localPosition),
        child: Stack(
          fit: StackFit.expand,
          children: [
            PhotoThumbnail(
              assetId: nowAssetId,
              size: 1200,
              borderRadius: 0,
              fit: BoxFit.contain,
            ),
            ClipRect(
              clipper: _LeftOf(split),
              child: PhotoThumbnail(
                assetId: thenAssetId,
                size: 1200,
                borderRadius: 0,
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
              left: width * split - 1,
              top: 0,
              bottom: 0,
              child: const ColoredBox(
                color: Colors.white70,
                child: SizedBox(width: 2),
              ),
            ),
          ],
        ),
      );
    },
  );
}

class _LeftOf extends CustomClipper<Rect> {
  const _LeftOf(this.split);

  final double split;

  @override
  Rect getClip(Size size) =>
      Rect.fromLTWH(0, 0, size.width * split, size.height);

  @override
  bool shouldReclip(_LeftOf oldClipper) => oldClipper.split != split;
}
