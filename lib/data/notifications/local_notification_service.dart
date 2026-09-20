import 'dart:async';
import 'dart:io';

import 'package:been_here/core/logger.dart';
import 'package:been_here/data/notifications/notification_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

/// Local notifications through the system.
///
/// Nothing here is scheduled or remote: a notification exists only because
/// the system told the app it had arrived somewhere.
class LocalNotificationService implements NotificationService {
  LocalNotificationService();

  static const _log = Logger('NotificationService');

  /// One channel, because the app has one thing to say.
  static const _channelId = 'memories';
  static const _channelName = 'Memories';

  final _plugin = FlutterLocalNotificationsPlugin();
  final _taps = StreamController<int>.broadcast();
  bool _initialized = false;

  @override
  Future<void> initialize() async {
    if (_initialized) return;
    _initialized = true;

    await _plugin.initialize(
      settings: const InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/ic_launcher'),
        // Permission is asked for separately, after the user has seen what
        // the app does — not on the first launch.
        iOS: DarwinInitializationSettings(
          requestAlertPermission: false,
          requestBadgePermission: false,
          requestSoundPermission: false,
        ),
      ),
      onDidReceiveNotificationResponse: _onTap,
    );
  }

  void _onTap(NotificationResponse response) {
    final placeId = int.tryParse(response.payload ?? '');
    if (placeId != null) _taps.add(placeId);
  }

  @override
  Future<bool> requestPermission() async {
    if (Platform.isIOS) {
      final granted = await _plugin
          .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin
          >()
          ?.requestPermissions(alert: true, badge: true, sound: true);
      return granted ?? false;
    }
    final granted = await _plugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.requestNotificationsPermission();
    return granted ?? false;
  }

  @override
  Future<bool> isPermitted() async {
    final enabled = await _plugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.areNotificationsEnabled();
    // iOS gives no cheap read of the current state; assume asking is needed
    // only once and let a failed post be the signal.
    return enabled ?? true;
  }

  @override
  Future<void> show(MemoryNotification notification) async {
    await initialize();
    try {
      await _plugin.show(
        id: notification.placeId,
        title: notification.title,
        body: notification.body,
        notificationDetails: const NotificationDetails(
          android: AndroidNotificationDetails(_channelId, _channelName),
          iOS: DarwinNotificationDetails(),
        ),
        // The place to open when it is tapped.
        payload: '${notification.placeId}',
      );
    } on Exception catch (e) {
      _log.warning('could not post notification', e);
    }
  }

  @override
  Stream<int> get taps => _taps.stream;

  @override
  Future<int?> launchPlaceId() async {
    final details = await _plugin.getNotificationAppLaunchDetails();
    if (details == null || !details.didNotificationLaunchApp) return null;
    return int.tryParse(details.notificationResponse?.payload ?? '');
  }

  Future<void> dispose() => _taps.close();
}
