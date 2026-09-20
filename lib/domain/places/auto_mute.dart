import 'package:been_here/domain/places/mute_state.dart';

/// Days with photos beyond which a place is somewhere you live, not somewhere
/// you visit.
///
/// Thirty distinct days over a whole library is a lot: a fortnight's holiday
/// doesn't reach it, a home or an office passes it in a couple of months.
const int defaultAutoMuteDays = 30;

/// What a place's mute state should be after a recompute.
///
/// The user always wins. A place they muted stays muted however few days it
/// has, and a place they unmuted stays visible however many — otherwise
/// "unmute my home" would quietly undo itself the next time the index ran,
/// which is the kind of thing that makes an app feel broken.
MuteState autoMuteFor({
  required MuteState current,
  required int distinctDays,
  int thresholdDays = defaultAutoMuteDays,
}) {
  if (current.isUserDecision) return current;
  return distinctDays >= thresholdDays ? MuteState.auto : MuteState.none;
}
