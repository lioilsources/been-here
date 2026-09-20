import 'dart:async';

import 'package:been_here/core/logger.dart';
import 'package:been_here/data/photos/photo_library.dart';
import 'package:been_here/domain/indexing/indexer_service.dart';

/// Keeps the index in step while the app is open.
///
/// One pass when the app starts, and another whenever the system library
/// reports a change. Library change callbacks arrive in bursts — a single
/// save can fire several — so they are debounced into one pass.
class LibrarySync {
  LibrarySync({
    required this.library,
    required this.indexer,
    this.debounce = const Duration(seconds: 2),
  });

  static const _log = Logger('LibrarySync');

  final PhotoLibrary library;
  final IndexerService indexer;
  final Duration debounce;

  StreamSubscription<void>? _subscription;
  Timer? _timer;
  bool _started = false;

  /// Runs the startup pass and starts listening. Safe to call more than once.
  Future<void> start() async {
    if (_started) return;
    _started = true;

    _subscription = library.changes.listen(
      (_) => _schedule(),
      onError: (Object e) => _log.warning('library change stream failed', e),
    );

    await indexer.run();
  }

  void _schedule() {
    _timer?.cancel();
    _timer = Timer(debounce, () {
      _log.info('Library changed, syncing');
      unawaited(indexer.run());
    });
  }

  Future<void> dispose() async {
    _timer?.cancel();
    _timer = null;
    await _subscription?.cancel();
    _subscription = null;
    _started = false;
  }
}
