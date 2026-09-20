import 'dart:async';

import 'package:meta/meta.dart';

/// One notification, already worded.
@immutable
class MemoryNotification {
  const MemoryNotification({
    required this.placeId,
    required this.title,
    required this.body,
  });

  final int placeId;
  final String title;
  final String body;

  @override
  bool operator ==(Object other) =>
      other is MemoryNotification &&
      other.placeId == placeId &&
      other.title == title &&
      other.body == body;

  @override
  int get hashCode => Object.hash(placeId, title, body);

  @override
  String toString() => 'MemoryNotification($placeId: $title — $body)';
}

/// Local notifications, and the taps that come back from them.
abstract interface class NotificationService {
  /// Prepares channels and handlers. Safe to call more than once.
  Future<void> initialize();

  /// Asks for permission to post notifications.
  Future<bool> requestPermission();

  Future<bool> isPermitted();

  Future<void> show(MemoryNotification notification);

  /// Place ids from notification taps, including the tap that launched the
  /// app from cold.
  Stream<int> get taps;

  /// The tap that launched the app, if it was launched by one.
  Future<int?> launchPlaceId();
}

class FakeNotificationService implements NotificationService {
  FakeNotificationService({this.permitted = true, this.launchedFrom});

  bool permitted;
  int? launchedFrom;

  final List<MemoryNotification> shown = [];
  final _taps = StreamController<int>.broadcast();
  int initializeCalls = 0;

  @override
  Future<void> initialize() async => initializeCalls++;

  @override
  Future<bool> requestPermission() async => permitted;

  @override
  Future<bool> isPermitted() async => permitted;

  @override
  Future<void> show(MemoryNotification notification) async =>
      shown.add(notification);

  @override
  Stream<int> get taps => _taps.stream;

  @override
  Future<int?> launchPlaceId() async => launchedFrom;

  /// Simulates the user tapping a notification.
  void tap(int placeId) => _taps.add(placeId);

  Future<void> dispose() => _taps.close();
}
