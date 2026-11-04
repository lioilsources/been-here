import 'package:been_here/domain/memories/age_window.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final now = DateTime.utc(2026, 11, 4, 12);
  int secondsAgo(int days) =>
      now.subtract(Duration(days: days)).millisecondsSinceEpoch ~/ 1000;

  group('stops', () {
    test('the constant count matches the list', () {
      expect(AgeWindow.stops, hasLength(AgeWindow.unbounded + 1));
      expect(AgeWindow.stops.first, 0);
      expect(AgeWindow.stops.last, isNull);
    });

    test('go strictly further back', () {
      final days = AgeWindow.stops.whereType<int>().toList();
      for (var i = 1; i < days.length; i++) {
        expect(days[i], greaterThan(days[i - 1]));
      }
    });
  });

  group('bounds', () {
    test('the default reaches from now back two years', () {
      final b = AgeWindow.defaults.bounds(now);
      expect(b.to, isNull);
      expect(b.from, secondsAgo(730));
    });

    test('everything has no bounds at all', () {
      final b = AgeWindow.all.bounds(now);
      expect(b.from, isNull);
      expect(b.to, isNull);
    });

    test('a window in the middle is closed at both ends', () {
      // Two weeks back, but nothing older than two years.
      const window = AgeWindow(newest: 4, oldest: 9);
      final b = window.bounds(now);
      expect(b.to, secondsAgo(14));
      expect(b.from, secondsAgo(730));
    });

    test('older than a stop is open at the old end', () {
      const window = AgeWindow(newest: 4, oldest: AgeWindow.unbounded);
      final b = window.bounds(now);
      expect(b.to, secondsAgo(14));
      expect(b.from, isNull);
    });
  });

  group('contains', () {
    const window = AgeWindow(newest: 4, oldest: 9);

    test('keeps what is inside', () {
      expect(
        window.contains(now.subtract(const Duration(days: 100)), now),
        isTrue,
      );
    });

    test('drops what is too recent', () {
      expect(
        window.contains(now.subtract(const Duration(days: 3)), now),
        isFalse,
      );
    });

    test('drops what is too old', () {
      expect(
        window.contains(now.subtract(const Duration(days: 1000)), now),
        isFalse,
      );
    });

    test('includes both edges', () {
      expect(
        window.contains(now.subtract(const Duration(days: 14)), now),
        isTrue,
      );
      expect(
        window.contains(now.subtract(const Duration(days: 730)), now),
        isTrue,
      );
    });

    test('up to now lets a photo from a skewed clock through', () {
      expect(
        AgeWindow.defaults.contains(now.add(const Duration(minutes: 5)), now),
        isTrue,
      );
    });
  });

  group('clamp', () {
    test('puts the ends in order', () {
      expect(AgeWindow.clamp(9, 4), const AgeWindow(newest: 4, oldest: 9));
    });

    test('keeps the thumbs a step apart, giving way where they moved', () {
      expect(
        AgeWindow.clamp(5, 5),
        const AgeWindow(newest: 5, oldest: 6),
      );
      expect(
        AgeWindow.clamp(5, 5, movedOldest: false),
        const AgeWindow(newest: 4, oldest: 5),
      );
    });

    test('stays on the track at both ends', () {
      expect(AgeWindow.clamp(-3, 99), AgeWindow.all);
      expect(
        AgeWindow.clamp(0, 0, movedOldest: false),
        const AgeWindow(newest: 0, oldest: 1),
      );
      expect(
        AgeWindow.clamp(AgeWindow.unbounded, AgeWindow.unbounded),
        const AgeWindow(
          newest: AgeWindow.unbounded - 1,
          oldest: AgeWindow.unbounded,
        ),
      );
    });
  });

  group('encode and decode', () {
    test('round trip', () {
      for (final window in [
        AgeWindow.defaults,
        AgeWindow.all,
        const AgeWindow(newest: 4, oldest: 9),
      ]) {
        expect(AgeWindow.decode(window.encode()), window);
      }
    });

    test('anything that is not a window decodes to null', () {
      for (final value in [
        null,
        '',
        'x',
        '1',
        '1:2:3',
        'a:b',
        '5:5',
        '9:4',
        '-1:3',
        '0:13',
      ]) {
        expect(AgeWindow.decode(value), isNull, reason: '$value');
      }
    });
  });

  test('the default is not everything', () {
    expect(AgeWindow.defaults.isDefault, isTrue);
    expect(AgeWindow.defaults.isAll, isFalse);
    expect(AgeWindow.all.isAll, isTrue);
  });
}
