import 'package:been_here/core/time/local_day.dart';
import 'package:been_here/domain/memories/relative_age.dart';
import 'package:flutter_test/flutter_test.dart';

const _utc = FixedOffsetLocalDay(Duration.zero);

RelativeAge _age(DateTime instant, DateTime now) =>
    relativeAge(instant: instant, now: now, localDay: _utc);

void main() {
  final now = DateTime.utc(2026, 9, 20, 14);

  group('near dates', () {
    test('earlier today', () {
      expect(
        _age(DateTime.utc(2026, 9, 20, 8), now),
        const RelativeAge(AgeUnit.today),
      );
    });

    test('a moment ago is still today', () {
      expect(
        _age(DateTime.utc(2026, 9, 20, 13, 59), now),
        const RelativeAge(AgeUnit.today),
      );
    });

    test('later today does not go negative', () {
      expect(
        _age(DateTime.utc(2026, 9, 20, 23), now),
        const RelativeAge(AgeUnit.today),
      );
    });

    test('yesterday, even ten minutes before midnight', () {
      expect(
        _age(DateTime.utc(2026, 9, 19, 23, 50), now),
        const RelativeAge(AgeUnit.yesterday),
      );
    });

    test('a few days', () {
      expect(
        _age(DateTime.utc(2026, 9, 15), now),
        const RelativeAge(AgeUnit.days, 5),
      );
      expect(
        _age(DateTime.utc(2026, 8, 25), now),
        const RelativeAge(AgeUnit.days, 26),
      );
    });
  });

  group('months', () {
    test('switches from days to months at 30 days', () {
      // 22 August is 29 days back, 21 August is 30.
      expect(
        _age(DateTime.utc(2026, 8, 22), now),
        const RelativeAge(AgeUnit.days, 29),
      );
      expect(
        _age(DateTime.utc(2026, 8, 21), now),
        const RelativeAge(AgeUnit.months, 1),
      );
    });

    test('counts whole calendar months', () {
      expect(
        _age(DateTime.utc(2026, 3, 20), now),
        const RelativeAge(AgeUnit.months, 6),
      );
      expect(
        _age(DateTime.utc(2026, 6, 20), now),
        const RelativeAge(AgeUnit.months, 3),
      );
    });

    test('a day short of the month does not count it', () {
      // 21 March to 20 September is five months and most of a sixth.
      expect(
        _age(DateTime.utc(2026, 3, 21), now),
        const RelativeAge(AgeUnit.months, 5),
      );
    });

    test('never reports zero months', () {
      // 31 days back, but the day of the month has not come round.
      final age = _age(DateTime.utc(2026, 8, 20, 23), now);
      expect(age.unit, AgeUnit.months);
      expect(age.amount, greaterThanOrEqualTo(1));
    });

    test('eleven months is still months', () {
      expect(
        _age(DateTime.utc(2025, 10, 20), now),
        const RelativeAge(AgeUnit.months, 11),
      );
    });
  });

  group('years', () {
    test('exactly a year', () {
      expect(
        _age(DateTime.utc(2025, 9, 20), now),
        const RelativeAge(AgeUnit.years, 1),
      );
    });

    test('a day short of a year is eleven months', () {
      expect(
        _age(DateTime.utc(2025, 9, 21), now),
        const RelativeAge(AgeUnit.months, 11),
      );
    });

    test('the case the whole app is built around', () {
      expect(
        _age(DateTime.utc(2020, 9, 18), now),
        const RelativeAge(AgeUnit.years, 6),
      );
    });

    test('rounds down, never up', () {
      // Eight years and eleven months.
      expect(
        _age(DateTime.utc(2017, 10, 20), now),
        const RelativeAge(AgeUnit.years, 8),
      );
    });
  });

  group('timezone', () {
    test('the local day decides, not the UTC one', () {
      const azores = FixedOffsetLocalDay(Duration(hours: -1));
      // 00:30 UTC on the 20th is still the 19th in the Azores, while `now`
      // (14:00 UTC) is the 20th in both.
      final instant = DateTime.utc(2026, 9, 20, 0, 30);

      expect(
        relativeAge(instant: instant, now: now, localDay: _utc).unit,
        AgeUnit.today,
      );
      expect(
        relativeAge(instant: instant, now: now, localDay: azores).unit,
        AgeUnit.yesterday,
      );
    });
  });
}
