import 'package:meta/meta.dart';

/// How old a photo may be to be drawn on the map: from [newest] back to
/// [oldest], both as an index into [stops].
///
/// The map is a picture of where you have been, and a picture of every
/// photo ever taken in a neighbourhood stops saying anything. This is the
/// window that keeps it to the stretch of time someone is asking about —
/// "the last two weeks", "a fortnight back, but nothing older than two
/// years".
///
/// Discrete rather than continuous: each end lands on a span a person would
/// say out loud, so the label reads as a sentence and the dots are re-queried
/// once per step instead of once per pixel.
@immutable
class AgeWindow {
  const AgeWindow({required this.newest, required this.oldest})
    : assert(newest >= 0, 'newest is an index into stops'),
      assert(oldest < _stopCount, 'oldest is an index into stops'),
      assert(newest < oldest, 'a window is at least one step wide');

  /// A valid window from any two indices: in order, on the track, and at
  /// least one step apart.
  ///
  /// The slider hands over whatever the thumbs are at; this is what keeps
  /// them from meeting. When they would, the end that moved is the one that
  /// gives way — [movedOldest] says which end that was.
  factory AgeWindow.clamp(int a, int b, {bool movedOldest = true}) {
    var newest = a < b ? a : b;
    var oldest = a < b ? b : a;
    newest = newest.clamp(0, unbounded - 1);
    oldest = oldest.clamp(1, unbounded);
    if (oldest <= newest) {
      if (movedOldest) {
        oldest = newest + 1;
      } else {
        newest = oldest - 1;
      }
    }
    return AgeWindow(newest: newest, oldest: oldest);
  }

  /// The stops along the track, in days. The last one has no bound at all.
  static const List<int?> stops = [
    0, // now
    1,
    3,
    7,
    14,
    30,
    90,
    180,
    365,
    730,
    1826,
    3652,
    null, // everything
  ];

  // `stops.length` is not a constant expression, and the asserts above are.
  static const int _stopCount = 13;

  /// Index of the last stop: no lower bound on age.
  static const int unbounded = _stopCount - 1;

  /// The last two years. Every photo ever taken is what the map used to
  /// show, and what it was asked to stop showing.
  static const AgeWindow defaults = AgeWindow(newest: 0, oldest: 9);

  /// Every photo, whatever its age.
  static const AgeWindow all = AgeWindow(newest: 0, oldest: unbounded);

  /// Index of the young end. Zero is "now": nothing is too recent.
  final int newest;

  /// Index of the old end. [unbounded] is "everything": nothing is too old.
  final int oldest;

  bool get isDefault => this == defaults;

  /// Whether the window lets every photo through.
  bool get isAll => newest == 0 && oldest == unbounded;

  /// The `taken_at` bounds for a query, unix seconds UTC, both inclusive.
  ///
  /// Null where that end is open: `to` when the window reaches up to now
  /// (a photo stamped a minute in the future by a skewed clock is still
  /// recent), `from` when it reaches back to the beginning.
  ///
  /// Plain elapsed days, not local calendar days. "Two weeks" on a map of
  /// dots does not need to know where midnight was, and dragging the
  /// time zone in here would buy nothing anyone could see.
  ({int? from, int? to}) bounds(DateTime now) {
    int secondsDaysAgo(int days) =>
        now.subtract(Duration(days: days)).millisecondsSinceEpoch ~/ 1000;

    final youngest = stops[newest];
    final eldest = stops[oldest];
    return (
      from: eldest == null ? null : secondsDaysAgo(eldest),
      to: newest == 0 || youngest == null ? null : secondsDaysAgo(youngest),
    );
  }

  /// Whether a photo taken at [takenAt] falls inside the window as of [now].
  bool contains(DateTime takenAt, DateTime now) {
    final b = bounds(now);
    final seconds = takenAt.millisecondsSinceEpoch ~/ 1000;
    if (b.from != null && seconds < b.from!) return false;
    if (b.to != null && seconds > b.to!) return false;
    return true;
  }

  /// How it is kept in preferences: `"0:9"`.
  String encode() => '$newest:$oldest';

  /// The inverse of [encode], or null for anything that is not a valid
  /// window — an older build, a hand-edited database, a future stop list.
  static AgeWindow? decode(String? value) {
    if (value == null) return null;
    final parts = value.split(':');
    if (parts.length != 2) return null;
    final newest = int.tryParse(parts[0]);
    final oldest = int.tryParse(parts[1]);
    if (newest == null || oldest == null) return null;
    if (newest < 0 || oldest > unbounded || newest >= oldest) return null;
    return AgeWindow(newest: newest, oldest: oldest);
  }

  @override
  bool operator ==(Object other) =>
      other is AgeWindow && other.newest == newest && other.oldest == oldest;

  @override
  int get hashCode => Object.hash(newest, oldest);

  @override
  String toString() => 'AgeWindow(${stops[newest]}..${stops[oldest]} days)';
}
