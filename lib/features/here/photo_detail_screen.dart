import 'dart:async';
import 'dart:io';

import 'package:been_here/app/providers.dart';
import 'package:been_here/core/geo/geo_point.dart';
import 'package:been_here/domain/memories/memory.dart';
import 'package:been_here/domain/memories/visit.dart';
import 'package:been_here/features/common/format.dart';
import 'package:been_here/features/here/widgets/photo_thumbnail.dart';
import 'package:been_here/features/rephoto/rephoto_screen.dart';
import 'package:been_here/features/rephoto/then_and_now_screen.dart';
import 'package:been_here/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

/// One photo, full screen, with the rest of the visit a swipe away.
class PhotoDetailScreen extends ConsumerStatefulWidget {
  const PhotoDetailScreen({
    required this.visit,
    required this.center,
    required this.radiusMeters,
    super.key,
    this.initialIndex = 0,
  });

  final Visit visit;
  final GeoPoint center;
  final double radiusMeters;
  final int initialIndex;

  @override
  ConsumerState<PhotoDetailScreen> createState() => _PhotoDetailScreenState();
}

class _PhotoDetailScreenState extends ConsumerState<PhotoDetailScreen> {
  late final PageController _controller = PageController(
    initialPage: widget.initialIndex,
  );
  late int _index = widget.initialIndex;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    // The whole visit, not just the grid preview: a swipe should reach the
    // photos the grid folded into "+N".
    final photos = ref.watch(
      visitPhotosProvider(
        VisitQuery(
          visit: widget.visit,
          center: widget.center,
          radiusMeters: widget.radiusMeters,
        ),
      ),
    );

    return Theme(
      data: ThemeData.dark(useMaterial3: true),
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
          title: photos.maybeWhen(
            data: (list) => list.isEmpty
                ? null
                : Text(
                    l10n.photoDetailOf(_index + 1, list.length),
                    style: const TextStyle(fontSize: 15),
                  ),
            orElse: () => null,
          ),
        ),
        extendBodyBehindAppBar: true,
        body: photos.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (_, _) => Center(
            child: Text(
              l10n.indexFailedTitle,
              style: const TextStyle(color: Colors.white),
            ),
          ),
          data: (list) {
            if (list.isEmpty) {
              return Center(
                child: Text(
                  l10n.hereNothingTitle,
                  style: const TextStyle(color: Colors.white),
                ),
              );
            }
            return Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: _controller,
                    itemCount: list.length,
                    onPageChanged: (i) => setState(() => _index = i),
                    itemBuilder: (context, i) => _FullPhoto(memory: list[i]),
                  ),
                ),
                _Footer(
                  memory: list[_index.clamp(0, list.length - 1)],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

/// Full resolution, with the thumbnail underneath while it loads.
///
/// The original may not be on the device at all — iCloud optimised storage
/// keeps only a small version locally — so this can take a while or fail,
/// and neither is an error worth shouting about.
class _FullPhoto extends ConsumerWidget {
  const _FullPhoto({required this.memory});

  final Memory memory;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final file = ref.watch(originalFileProvider(memory.assetId));
    final path = file.value;

    return InteractiveViewer(
      maxScale: 5,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 180),
        // One image at a time. Showing the thumbnail *behind* the full
        // photo means it fills the letterbox around it, and the result is
        // two pictures on screen at once.
        child: path == null
            ? _Placeholder(
                key: const ValueKey('placeholder'),
                assetId: memory.assetId,
                loading: file.isLoading,
              )
            : Image.file(
                File(path),
                key: ValueKey(path),
                fit: BoxFit.contain,
                width: double.infinity,
                height: double.infinity,
                semanticLabel: AppLocalizations.of(context).photoSemanticLabel(
                  DateFormat.yMMMMd(
                    Localizations.localeOf(context).toLanguageTag(),
                  ).format(memory.takenAt.toLocal()),
                ),
              ),
      ),
    );
  }
}

/// The thumbnail, shown alone until the original arrives.
///
/// Contained rather than cropped: this is the photo, not a tile, and the
/// full-resolution version that replaces it will be contained too — so the
/// swap doesn't jump.
class _Placeholder extends StatelessWidget {
  const _Placeholder({
    required this.assetId,
    required this.loading,
    super.key,
  });

  final String assetId;
  final bool loading;

  @override
  Widget build(BuildContext context) => Stack(
    fit: StackFit.expand,
    children: [
      Center(
        child: PhotoThumbnail(
          assetId: assetId,
          size: 600,
          borderRadius: 0,
          fit: BoxFit.contain,
        ),
      ),
      if (loading)
        const Center(
          child: SizedBox(
            width: 28,
            height: 28,
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
        ),
    ],
  );
}

class _Footer extends ConsumerWidget {
  const _Footer({required this.memory});

  final Memory memory;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final existing = ref.watch(latestRephotoProvider(memory.assetId)).value;

    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
        child: Row(
          children: [
            Expanded(
              child: Text(
                formatDistance(l10n, memory.distanceMeters),
                style: const TextStyle(color: Colors.white70, fontSize: 13),
              ),
            ),
            if (existing != null)
              TextButton.icon(
                onPressed: () => unawaited(
                  ThenAndNowScreen.open(
                    context,
                    thenAssetId: memory.assetId,
                    nowAssetId: existing.newAssetId,
                  ),
                ),
                icon: const Icon(Icons.compare, size: 18),
                label: Text(l10n.rephotoThenAndNow),
              ),
            TextButton.icon(
              onPressed: () => unawaited(
                RephotoScreen.open(context, memory).then(
                  (_) => ref.invalidate(latestRephotoProvider(memory.assetId)),
                ),
              ),
              icon: const Icon(Icons.camera_alt_outlined, size: 18),
              label: Text(l10n.photoDetailRephoto),
            ),
          ],
        ),
      ),
    );
  }
}
