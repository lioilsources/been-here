import 'dart:async';

import 'package:been_here/core/geo/geo_point.dart';
import 'package:been_here/core/logger.dart';
import 'package:been_here/data/db/daos/places_dao.dart';
import 'package:been_here/data/db/database.dart';
import 'package:been_here/data/geocoding/geocoding_service.dart';
import 'package:drift/drift.dart' show Value;

/// Gives places names, lazily, once, and one at a time.
///
/// Lazily because every name costs a coordinate sent to the system geocoder;
/// once because the answer is stored on the place and a recompute keeps it.
/// Places the user never looks at are never asked about.
///
/// One at a time because both platform geocoders throttle an app that asks
/// in bursts, and a list of forty places scrolled quickly *is* a burst: the
/// requests that lose come back empty, and those places stay unnamed for the
/// rest of the session. A queue with a gap between requests turns "some of
/// them, unpredictably" into "all of them, shortly".
class PlaceLabeller {
  PlaceLabeller({
    required this.dao,
    required this.geocoder,
    this.gap = const Duration(milliseconds: 250),
    this.retryAfter = const Duration(seconds: 2),
  });

  static const _log = Logger('PlaceLabeller');

  final PlacesDao dao;
  final GeocodingService geocoder;

  /// How long to wait between two requests.
  final Duration gap;

  /// How long to wait before the one retry an unanswered request gets.
  final Duration retryAfter;

  final _inFlight = <int, Future<String?>>{};

  /// The tail of the queue. Every request waits for it, then becomes it.
  Future<void> _queue = Future<void>.value();

  /// Names [place] if it has no name yet. Returns the name, or null.
  ///
  /// Does nothing unless [enabled] — the caller passes the user's setting, so
  /// there is exactly one place where that decision is read.
  Future<String?> labelFor(PlaceRow place, {required bool enabled}) {
    final existing = place.label;
    if (existing != null && existing.isNotEmpty) {
      return Future<String?>.value(existing);
    }
    if (!enabled) return Future<String?>.value();

    final pending = _inFlight[place.id];
    if (pending != null) return pending;

    final request = _enqueue(place);
    _inFlight[place.id] = request;
    return request;
  }

  /// Puts one lookup at the end of the queue.
  Future<String?> _enqueue(PlaceRow place) {
    final mine = _queue.then((_) => _fetch(place));

    // The next request waits for this one *and* for the gap after it. Errors
    // are swallowed here only to keep the queue moving; _fetch has already
    // handled them.
    _queue = mine
        .then<void>((_) {})
        .catchError((Object _) {})
        .then((_) => Future<void>.delayed(gap));

    return mine;
  }

  Future<String?> _fetch(PlaceRow place) async {
    final point = GeoPoint(place.centerLat, place.centerLng);
    try {
      var result = await geocoder.describe(point);

      // One retry, because "no answer" is usually the geocoder rationing
      // itself rather than anything about this place.
      if (result is GeocodeUnavailable) {
        await Future<void>.delayed(retryAfter);
        result = await geocoder.describe(point);
      }

      switch (result) {
        case GeocodeName(:final name):
          await dao.updatePlace(
            place.id,
            PlacesCompanion(label: Value(name)),
          );
          return name;
        case GeocodeNothing():
          return null;
        case GeocodeUnavailable():
          // Left unnamed and left alone. Nothing is stored, so the next time
          // this place is on screen it is asked about again.
          _log.info('no answer for place ${place.id}; will ask again later');
          return null;
      }
    } finally {
      // Dropping it from the in-flight map is what allows that later ask.
      unawaited(_inFlight.remove(place.id));
    }
  }

  /// Forgets every stored name. What "turn place names off" should mean:
  /// not just stop asking, but stop keeping the answers.
  Future<void> forgetAll() => dao.clearLabels();
}
