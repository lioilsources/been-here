import 'package:meta/meta.dart';

enum IndexStatus {
  /// Nothing has run yet in this session.
  idle,

  running,

  /// A pass walked the whole library and finished.
  completed,

  /// Stopped on request. The cursor is kept, so the next run continues
  /// instead of starting over.
  cancelled,

  /// The library refused to be read. Nothing was indexed.
  permissionDenied,

  /// Something threw. The cursor is kept.
  failed,
}

/// Snapshot of an indexing pass, suitable to render directly.
@immutable
class IndexProgress {
  const IndexProgress({
    required this.status,
    this.processed = 0,
    this.total = 0,
    this.inserted = 0,
    this.deleted = 0,
    this.errorCode,
  });

  const IndexProgress.idle() : this(status: IndexStatus.idle);

  final IndexStatus status;

  /// Assets walked so far in this pass.
  final int processed;

  /// Assets the library says it has.
  final int total;

  /// Rows added to the index during this pass.
  final int inserted;

  /// Rows removed because the library no longer reports them.
  final int deleted;

  /// Set when [status] is [IndexStatus.failed].
  final String? errorCode;

  bool get isRunning => status == IndexStatus.running;

  bool get hasFinished =>
      status == IndexStatus.completed ||
      status == IndexStatus.failed ||
      status == IndexStatus.permissionDenied;

  /// 0..1, or 0 when the total is not known yet.
  double get fraction => total <= 0 ? 0 : (processed / total).clamp(0.0, 1.0);

  IndexProgress copyWith({
    IndexStatus? status,
    int? processed,
    int? total,
    int? inserted,
    int? deleted,
    String? errorCode,
  }) => IndexProgress(
    status: status ?? this.status,
    processed: processed ?? this.processed,
    total: total ?? this.total,
    inserted: inserted ?? this.inserted,
    deleted: deleted ?? this.deleted,
    errorCode: errorCode ?? this.errorCode,
  );

  @override
  bool operator ==(Object other) =>
      other is IndexProgress &&
      other.status == status &&
      other.processed == processed &&
      other.total == total &&
      other.inserted == inserted &&
      other.deleted == deleted &&
      other.errorCode == errorCode;

  @override
  int get hashCode =>
      Object.hash(status, processed, total, inserted, deleted, errorCode);

  @override
  String toString() =>
      'IndexProgress(${status.name} $processed/$total '
      '+$inserted -$deleted${errorCode == null ? '' : ' $errorCode'})';
}
