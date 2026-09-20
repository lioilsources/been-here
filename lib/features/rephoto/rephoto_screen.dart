import 'dart:async';
import 'dart:ui' as ui;

import 'package:been_here/app/providers.dart';
import 'package:been_here/core/image/edge_detect.dart';
import 'package:been_here/domain/memories/memory.dart';
import 'package:been_here/domain/rephoto/rephoto_service.dart';
import 'package:been_here/l10n/generated/app_localizations.dart';
import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Take the same photo again.
///
/// The old photo sits over the viewfinder so the frame can be matched. Two
/// ways to see it: faded on top, or reduced to its outlines — outlines win
/// when the scene has changed a lot, because a ghost image of a building
/// that is no longer there is worse than useless.
class RephotoScreen extends ConsumerStatefulWidget {
  const RephotoScreen({required this.memory, super.key, this.placeId});

  final Memory memory;
  final int? placeId;

  static Future<void> open(
    BuildContext context,
    Memory memory, {
    int? placeId,
  }) => Navigator.of(context).push(
    MaterialPageRoute<void>(
      builder: (_) => RephotoScreen(memory: memory, placeId: placeId),
    ),
  );

  @override
  ConsumerState<RephotoScreen> createState() => _RephotoScreenState();
}

class _RephotoScreenState extends ConsumerState<RephotoScreen> {
  CameraController? _camera;
  String? _cameraError;

  double _opacity = 0.45;
  bool _edges = false;
  bool _saving = false;

  ui.Image? _overlay;
  ui.Image? _edgeOverlay;

  @override
  void initState() {
    super.initState();
    unawaited(_startCamera());
    unawaited(_loadOverlay());
  }

  @override
  void dispose() {
    unawaited(_camera?.dispose());
    _overlay?.dispose();
    _edgeOverlay?.dispose();
    super.dispose();
  }

  Future<void> _startCamera() async {
    try {
      final cameras = await availableCameras();
      if (cameras.isEmpty) {
        setState(() => _cameraError = 'no camera');
        return;
      }
      final back = cameras.firstWhere(
        (c) => c.lensDirection == CameraLensDirection.back,
        orElse: () => cameras.first,
      );
      final controller = CameraController(
        back,
        ResolutionPreset.high,
        enableAudio: false,
      );
      await controller.initialize();
      if (!mounted) {
        await controller.dispose();
        return;
      }
      setState(() => _camera = controller);
    } on Object catch (e) {
      // A refused camera permission lands here too.
      if (mounted) setState(() => _cameraError = '$e');
    }
  }

  /// Loads the old photo and, alongside it, its outlines.
  Future<void> _loadOverlay() async {
    final bytes = await ref
        .read(photoLibraryProvider)
        .thumbnail(widget.memory.assetId, width: 1200, height: 1200);
    if (bytes == null || !mounted) return;

    final image = await decodeImageFromList(bytes);
    final edges = await _edgesOf(image);
    if (!mounted) {
      image.dispose();
      edges?.dispose();
      return;
    }
    setState(() {
      _overlay = image;
      _edgeOverlay = edges;
    });
  }

  /// Sobel on a downscaled copy: the outlines only have to be good enough to
  /// line a camera up with, and a full-resolution pass would stall the UI.
  static Future<ui.Image?> _edgesOf(ui.Image image) async {
    final data = await image.toByteData();
    if (data == null) return null;

    final edges = await compute(
      _detectEdgesIsolate,
      (
        pixels: data.buffer.asUint8List(),
        width: image.width,
        height: image.height,
      ),
    );

    final completer = Completer<ui.Image>();
    ui.decodeImageFromPixels(
      edges,
      image.width,
      image.height,
      ui.PixelFormat.rgba8888,
      completer.complete,
    );
    return completer.future;
  }

  Future<void> _capture() async {
    final camera = _camera;
    if (camera == null || _saving) return;

    setState(() => _saving = true);
    final l10n = AppLocalizations.of(context);
    try {
      final shot = await camera.takePicture();
      final bytes = await shot.readAsBytes();

      final outcome = await ref
          .read(rephotoServiceProvider)
          .save(
            bytes,
            originalAssetId: widget.memory.assetId,
            at: widget.memory.point,
            placeId: widget.placeId,
          );

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            outcome == RephotoOutcome.saved
                ? l10n.rephotoSaved
                : l10n.rephotoNotSaved,
          ),
        ),
      );
      if (outcome == RephotoOutcome.saved) Navigator.of(context).pop();
    } on Object catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.rephotoNotSaved)));
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final camera = _camera;

    return Theme(
      data: ThemeData.dark(useMaterial3: true),
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
          title: Text(l10n.photoDetailRephoto),
        ),
        extendBodyBehindAppBar: true,
        body: Column(
          children: [
            Expanded(
              child: _cameraError != null
                  ? Center(
                      child: Padding(
                        padding: const EdgeInsets.all(32),
                        child: Text(
                          l10n.rephotoNoCamera,
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: Colors.white70),
                        ),
                      ),
                    )
                  : camera == null
                  ? const Center(child: CircularProgressIndicator())
                  : _Viewfinder(
                      camera: camera,
                      // The old photo's shape, so the new one can be laid
                      // over it later without either being cropped.
                      aspectRatio: widget.memory.aspectRatio,
                      overlay: _edges ? _edgeOverlay : _overlay,
                      opacity: _edges ? 1 : _opacity,
                    ),
            ),
            _Controls(
              opacity: _opacity,
              edges: _edges,
              busy: _saving || camera == null,
              onOpacity: (value) => setState(() => _opacity = value),
              onEdges: (value) => setState(() => _edges = value),
              onCapture: () => unawaited(_capture()),
            ),
          ],
        ),
      ),
    );
  }
}

/// Runs off the UI thread: a megapixel of Sobel is not frame-sized work.
Uint8List _detectEdgesIsolate(
  ({Uint8List pixels, int width, int height}) input,
) => detectEdges(
  RgbaImage(
    pixels: input.pixels,
    width: input.width,
    height: input.height,
  ),
).pixels;

class _Viewfinder extends StatelessWidget {
  const _Viewfinder({
    required this.camera,
    required this.aspectRatio,
    required this.overlay,
    required this.opacity,
  });

  final CameraController camera;
  final double aspectRatio;
  final ui.Image? overlay;
  final double opacity;

  @override
  Widget build(BuildContext context) => Center(
    child: AspectRatio(
      // Locked to the original: matching a frame you cannot see the edges
      // of is guesswork.
      aspectRatio: aspectRatio,
      child: ClipRect(
        child: Stack(
          fit: StackFit.expand,
          children: [
            FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                width: camera.value.previewSize?.height ?? 1,
                height: camera.value.previewSize?.width ?? 1,
                child: CameraPreview(camera),
              ),
            ),
            if (overlay != null)
              Opacity(
                opacity: opacity,
                child: RawImage(image: overlay),
              ),
          ],
        ),
      ),
    ),
  );
}

class _Controls extends StatelessWidget {
  const _Controls({
    required this.opacity,
    required this.edges,
    required this.busy,
    required this.onOpacity,
    required this.onEdges,
    required this.onCapture,
  });

  final double opacity;
  final bool edges;
  final bool busy;
  final ValueChanged<double> onOpacity;
  final ValueChanged<bool> onEdges;
  final VoidCallback onCapture;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
        child: Column(
          children: [
            Row(
              children: [
                const Icon(Icons.opacity, size: 18, color: Colors.white54),
                Expanded(
                  child: Slider(
                    value: opacity,
                    onChanged: edges ? null : onOpacity,
                  ),
                ),
                SegmentedButton<bool>(
                  segments: [
                    ButtonSegment(
                      value: false,
                      label: Text(l10n.rephotoOverlay),
                    ),
                    ButtonSegment(
                      value: true,
                      label: Text(l10n.rephotoEdges),
                    ),
                  ],
                  selected: {edges},
                  onSelectionChanged: (s) => onEdges(s.first),
                ),
              ],
            ),
            const SizedBox(height: 12),
            FilledButton.icon(
              onPressed: busy ? null : onCapture,
              icon: const Icon(Icons.camera),
              label: Text(l10n.rephotoCapture),
            ),
          ],
        ),
      ),
    );
  }
}
