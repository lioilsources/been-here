import 'package:been_here/domain/places/auto_mute.dart';
import 'package:been_here/domain/places/mute_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('autoMuteFor', () {
    test('mutes a place with enough distinct days', () {
      expect(
        autoMuteFor(current: MuteState.none, distinctDays: 30),
        MuteState.auto,
      );
      expect(
        autoMuteFor(current: MuteState.none, distinctDays: 400),
        MuteState.auto,
      );
    });

    test('leaves a place below the threshold alone', () {
      expect(
        autoMuteFor(current: MuteState.none, distinctDays: 29),
        MuteState.none,
      );
      expect(
        autoMuteFor(current: MuteState.none, distinctDays: 0),
        MuteState.none,
      );
    });

    test('can change its mind when a place stops being busy', () {
      // A place that was auto-muted and has since lost photos.
      expect(
        autoMuteFor(current: MuteState.auto, distinctDays: 3),
        MuteState.none,
      );
    });

    test('never overrides a user who muted', () {
      expect(
        autoMuteFor(current: MuteState.userMuted, distinctDays: 0),
        MuteState.userMuted,
      );
    });

    test('never overrides a user who unmuted — the whole point', () {
      // Someone unmuted their home. The auto rule must not put it back.
      expect(
        autoMuteFor(current: MuteState.userUnmuted, distinctDays: 2000),
        MuteState.userUnmuted,
      );
    });

    test('honours a custom threshold', () {
      expect(
        autoMuteFor(
          current: MuteState.none,
          distinctDays: 12,
          thresholdDays: 10,
        ),
        MuteState.auto,
      );
      expect(
        autoMuteFor(
          current: MuteState.none,
          distinctDays: 12,
          thresholdDays: 50,
        ),
        MuteState.none,
      );
    });

    test('is stable when applied twice', () {
      var state = autoMuteFor(current: MuteState.none, distinctDays: 100);
      final again = autoMuteFor(current: state, distinctDays: 100);
      expect(again, state);

      state = autoMuteFor(current: MuteState.none, distinctDays: 1);
      expect(autoMuteFor(current: state, distinctDays: 1), state);
    });
  });
}
