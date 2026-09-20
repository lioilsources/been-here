import 'package:meta/meta.dart';

/// Outcome of an operation that fails in ways the UI has to react to, such as
/// a denied permission. Plain exceptions stay exceptions; this is for expected
/// branches, not for bugs.
@immutable
sealed class Result<T> {
  const Result();

  const factory Result.ok(T value) = Ok<T>;

  const factory Result.failure(String code, {String? message}) = Failure<T>;

  bool get isOk => this is Ok<T>;

  /// The value, or null when this is a [Failure].
  T? get valueOrNull => switch (this) {
    Ok<T>(:final value) => value,
    Failure<T>() => null,
  };

  R when<R>({
    required R Function(T value) ok,
    required R Function(Failure<T> failure) failure,
  }) => switch (this) {
    Ok<T>(:final value) => ok(value),
    final Failure<T> f => failure(f),
  };
}

@immutable
final class Ok<T> extends Result<T> {
  const Ok(this.value);

  final T value;

  @override
  bool operator ==(Object other) => other is Ok<T> && other.value == value;

  @override
  int get hashCode => Object.hash(Ok<T>, value);

  @override
  String toString() => 'Ok($value)';
}

@immutable
final class Failure<T> extends Result<T> {
  const Failure(this.code, {this.message});

  /// Stable identifier the UI can switch on, e.g. `photo_permission_denied`.
  final String code;

  /// Developer-facing detail. Never shown to the user untranslated.
  final String? message;

  @override
  bool operator ==(Object other) =>
      other is Failure<T> && other.code == code && other.message == message;

  @override
  int get hashCode => Object.hash(Failure<T>, code, message);

  @override
  String toString() => 'Failure($code${message == null ? '' : ': $message'})';
}
