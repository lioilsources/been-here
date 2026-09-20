import 'dart:async';

import 'package:been_here/core/geo/geo_point.dart';
import 'package:been_here/data/db/daos/places_dao.dart';
import 'package:been_here/data/db/database.dart';
import 'package:been_here/data/geocoding/geocoding_service.dart';
import 'package:drift/drift.dart' show Value;

/// Gives places names, lazily and once.
///
/// Lazily because every name costs a coordinate sent to the system geocoder;
/// once because the answer is stored on the place and a recompute keeps it.
/// Places the user never looks at are never asked about.
class PlaceLabeller {
  PlaceLabeller({required this.dao, required this.geocoder});

  final PlacesDao dao;
  final GeocodingService geocoder;

  final _inFlight = <int, Future<String?>>{};

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

    final request = _fetch(place);
    _inFlight[place.id] = request;
    return request;
  }

  Future<String?> _fetch(PlaceRow place) async {
    try {
      final label = await geocoder.describe(
        GeoPoint(place.centerLat, place.centerLng),
      );
      if (label != null && label.isNotEmpty) {
        await dao.updatePlace(place.id, PlacesCompanion(label: Value(label)));
      }
      return label;
    } finally {
      unawaited(_inFlight.remove(place.id));
    }
  }

  /// Forgets every stored name. What "turn place names off" should mean:
  /// not just stop asking, but stop keeping the answers.
  Future<void> forgetAll() => dao.clearLabels();
}
