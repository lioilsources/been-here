/// Why a place is (or is not) excluded from memories and notifications.
///
/// The plan lists three values (`none` / `auto` / `user`), but the rule
/// "the auto rule never overrides the user, not even an un-mute" needs the
/// user's decision to carry its direction. So `user` is split in two and a
/// plain `none` keeps meaning "nobody has decided yet".
enum MuteState {
  /// Nobody decided. The auto rule is free to claim this place.
  none,

  /// Muted by the auto rule — too many distinct days (home, office, school).
  auto,

  /// The user muted it explicitly.
  userMuted,

  /// The user unmuted it explicitly. Stays visible even if the auto rule
  /// would mute it.
  userUnmuted;

  bool get isMuted => this == MuteState.auto || this == MuteState.userMuted;

  /// True when the user has made a call, which the auto rule must respect.
  bool get isUserDecision =>
      this == MuteState.userMuted || this == MuteState.userUnmuted;
}
