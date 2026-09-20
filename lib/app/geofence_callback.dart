import 'dart:ui';

import 'package:been_here/core/logger.dart';
import 'package:been_here/data/db/database.dart';
import 'package:been_here/data/location/geofence_service.dart';
import 'package:been_here/data/notifications/local_notification_service.dart';
import 'package:been_here/domain/memories/arrival_service.dart';
import 'package:been_here/features/notifications/arrival_text.dart';
import 'package:been_here/l10n/generated/app_localizations.dart';
import 'package:flutter/widgets.dart';
import 'package:native_geofence/native_geofence.dart' as ng;

const _log = Logger('geofenceCallback');

/// What the system calls when the user walks into one of the watched
/// circles.
///
/// This runs in a **background isolate**, started by the platform, with none
/// of the running app around it: no providers, no open database, no widget
/// tree and so no localisations. Everything it needs is opened here and
/// closed again, and it must stay small — the system gives a woken app only
/// a few seconds.
///
/// Must be top-level and marked as an entry point, or the compiler will
/// strip it and arrivals will silently stop working in release builds.
@pragma('vm:entry-point')
Future<void> onGeofenceArrival(ng.GeofenceCallbackParams params) async {
  if (params.event != ng.GeofenceEvent.enter) return;

  WidgetsFlutterBinding.ensureInitialized();

  final db = AppDatabase();
  final notifications = LocalNotificationService();

  try {
    await notifications.initialize();
    final l10n = await _localizations();

    final arrivals = ArrivalService(
      places: db.placesDao,
      notifications: notifications,
      compose: (arrival) => composeArrival(l10n, arrival),
    );

    for (final fence in params.geofences) {
      final placeId = GeofenceRegion.placeIdOf(fence.id);
      if (placeId == null) continue;
      await arrivals.onArrival(placeId);
    }
  } on Object catch (error, stackTrace) {
    // Throwing here would take the isolate down with no one to see it.
    _log.error('arrival handling failed', error, stackTrace);
  } finally {
    await notifications.dispose();
    await db.close();
  }
}

/// The device's language, falling back to the first one the app supports.
Future<AppLocalizations> _localizations() {
  final device = PlatformDispatcher.instance.locale;
  final supported = AppLocalizations.supportedLocales.firstWhere(
    (locale) => locale.languageCode == device.languageCode,
    orElse: () => AppLocalizations.supportedLocales.first,
  );
  return AppLocalizations.delegate.load(supported);
}
