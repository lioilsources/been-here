import 'dart:async';
import 'dart:typed_data';

import 'package:been_here/app/providers.dart';
import 'package:been_here/data/photos/photo_library.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Keeps recently shown thumbnails in memory.
///
/// Scrolling a grid back and forth would otherwise ask PhotoKit for the same
/// bytes over and over. Bounded and least-recently-used, because a photo
/// library has no upper size and a cache without a limit is a leak.
class ThumbnailCache {
  ThumbnailCache({this.maxEntries = 300});

  final int maxEntries;
  final _entries = <String, Uint8List?>{};
  final _inFlight = <String, Future<Uint8List?>>{};

  Uint8List? cached(String key) => _entries[key];

  bool contains(String key) => _entries.containsKey(key);

  Future<Uint8List?> load(
    PhotoLibrary library,
    String assetId, {
    required int size,
  }) {
    final key = '$assetId@$size';
    if (_entries.containsKey(key)) {
      // Touch it so it moves to the front of the eviction order.
      final value = _entries.remove(key);
      _entries[key] = value;
      return Future<Uint8List?>.value(value);
    }

    final pending = _inFlight[key];
    if (pending != null) return pending;

    final request = library
        .thumbnail(assetId, width: size, height: size)
        .then((bytes) {
          _entries[key] = bytes;
          if (_entries.length > maxEntries) {
            _entries.remove(_entries.keys.first);
          }
          // remove() hands back the stored future; we only want the entry
          // gone.
          // ignore: discarded_futures
          _inFlight.remove(key);
          return bytes;
        })
        .catchError((Object _) {
          // As above: the removed value is a future nobody waits for.
          // ignore: discarded_futures
          _inFlight.remove(key);
          return null;
        });
    _inFlight[key] = request;
    return request;
  }

  void clear() {
    _entries.clear();
    _inFlight.clear();
  }
}

final thumbnailCacheProvider = Provider<ThumbnailCache>(
  (ref) => ThumbnailCache(),
);

/// A square thumbnail for one indexed photo.
class PhotoThumbnail extends ConsumerStatefulWidget {
  const PhotoThumbnail({
    required this.assetId,
    super.key,
    this.size = 200,
    this.borderRadius = 8,
    this.fit = BoxFit.cover,
  });

  final String assetId;

  /// Pixel size to ask the library for. Not the layout size.
  final int size;

  final double borderRadius;

  /// Cropped in a grid, contained when it is the photo itself.
  final BoxFit fit;

  @override
  ConsumerState<PhotoThumbnail> createState() => _PhotoThumbnailState();
}

class _PhotoThumbnailState extends ConsumerState<PhotoThumbnail> {
  Uint8List? _bytes;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    unawaited(_load());
  }

  @override
  void didUpdateWidget(PhotoThumbnail oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.assetId != widget.assetId) unawaited(_load());
  }

  Future<void> _load() async {
    final cache = ref.read(thumbnailCacheProvider);
    final key = '${widget.assetId}@${widget.size}';

    if (cache.contains(key)) {
      setState(() {
        _bytes = cache.cached(key);
        _loading = false;
      });
      return;
    }

    setState(() => _loading = true);
    final bytes = await cache.load(
      ref.read(photoLibraryProvider),
      widget.assetId,
      size: widget.size,
    );
    if (!mounted) return;
    setState(() {
      _bytes = bytes;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bytes = _bytes;

    return ClipRRect(
      borderRadius: BorderRadius.circular(widget.borderRadius),
      child: ColoredBox(
        color: theme.colorScheme.surfaceContainerHighest,
        child: switch ((bytes, _loading)) {
          (final Uint8List data, _) => Image.memory(
            data,
            fit: widget.fit,
            width: double.infinity,
            height: double.infinity,
            gaplessPlayback: true,
          ),
          (null, true) => const SizedBox.expand(),
          // The asset is gone, or the library refused it. Say so quietly
          // rather than showing a broken frame.
          (null, false) => Center(
            child: Icon(
              Icons.image_not_supported_outlined,
              size: 18,
              color: theme.colorScheme.outline,
            ),
          ),
        },
      ),
    );
  }
}
