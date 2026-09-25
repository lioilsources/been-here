import 'package:been_here/core/geo/geo_point.dart';
import 'package:been_here/core/logger.dart';
import 'package:been_here/data/db/daos/places_dao.dart';
import 'package:been_here/data/location/geofence_service.dart';
import 'package:been_here/data/notifications/notification_service.dart';
import 'package:been_here/domain/memories/notification_rules.dart';
import 'package:been_here/domain/memories/relative_age.dart';
import 'package:been_here/domain/places/geofence_selection.dart';
import 'package:meta/meta.dart';

/// Everything a notification needs to say, before anyone picks the words.
///
/// The service decides; the wording happens in the presentation layer, which
/// is the only part that knows the language.
@immutable
class MemoryArrival {
  const MemoryArrival({
    required this.placeId,
    required this.photoCount,
    required this.age,
    this.name,
  });

  final int placeId;
  final int photoCount;
  final RelativeAge age;
  final String? name;
}

/// Turns a [MemoryArrival] into words.
typedef ArrivalComposer = MemoryNotification Function(MemoryArrival arrival);

/// Keeps the system watching the right handful of places.
class RegionSyncService {
  RegionSyncService({
    required this.places,
    required this.geofence,
    this.rules = const NotificationRules(),
    DateTime Function()? clock,
  }) : clock = clock ?? DateTime.now;

  static const _log = Logger('RegionSyncService');

  final PlacesDao places;
  final GeofenceService geofence;
  final NotificationRules rules;
  final DateTime Function() clock;

  List<NotifiablePlace> _registered = const [];

  /// Asks the system to watch the places worth watching from [from].
  ///
  /// Called when the index changes and when the user moves a meaningful
  /// distance. Does nothing if the choice hasn't changed — re-registering
  /// resets the regions' state, and on iOS there are only twenty of them.
  Future<List<NotifiablePlace>> syncRegions(GeoPoint from) async {
    if (!await geofence.isAvailable()) {
      _log.info('No background location; not watching anything');
      if (_registered.isNotEmpty) {
        await geofence.clear();
        _registered = const [];
      }
      return const [];
    }

    final selection = selectRegions(
      places: await places.notifiable(),
      from: from,
      now: clock(),
      limit: geofence.regionLimit,
      rules: rules,
      // Everyday places do not deserve one of the twenty slots.
      home: await places.home(),
    );

    if (!selectionChanged(_registered, selection)) return _registered;

    await geofence.register([
      for (final place in selection)
        GeofenceRegion(
          placeId: place.placeId,
          center: place.center,
          radiusMeters: place.radiusMeters,
        ),
    ]);
    _registered = selection;

    _log.info('Watching ${selection.length} places');
    return selection;
  }
}

/// What to do when the system says the user has arrived somewhere.
///
/// Deliberately knows nothing about geofences: this runs in a background
/// isolate woken by the system, where the only things available are a fresh
/// database connection and the notification plugin.
class ArrivalService {
  ArrivalService({
    required this.places,
    required this.notifications,
    required this.compose,
    this.rules = const NotificationRules(),
    DateTime Function()? clock,
  }) : clock = clock ?? DateTime.now;

  static const _log = Logger('ArrivalService');

  final PlacesDao places;
  final NotificationService notifications;
  final ArrivalComposer compose;
  final NotificationRules rules;
  final DateTime Function() clock;

  /// The system says the user just arrived at [placeId].
  ///
  /// Re-checks every rule rather than trusting the registration: a place can
  /// have been muted, or photographed again, since it was registered, and a
  /// notification is an interruption that has to be earned at the moment it
  /// happens.
  Future<NotificationDecision> onArrival(int placeId) async {
    final place = await places.notifiableById(placeId);
    if (place == null) {
      _log.warning('Arrived at unknown place $placeId');
      return const NotificationDecision.vetoed(NotificationVeto.muted);
    }

    final now = clock();
    final decision = decideNotification(
      place: place,
      now: now,
      lastNotificationAnywhere: await places.lastNotifiedAnywhere(),
      rules: rules,
      home: await places.home(),
    );

    if (!decision.shouldNotify) {
      _log.info('Arrived at $placeId, staying quiet: ${decision.veto!.name}');
      return decision;
    }

    await notifications.show(
      compose(
        MemoryArrival(
          placeId: place.placeId,
          photoCount: place.photoCount,
          age: relativeAge(instant: place.lastPhotoAt, now: now),
          name: place.name,
        ),
      ),
    );
    await places.markNotified(placeId, now);

    _log.info('Notified about place $placeId');
    return decision;
  }
}
