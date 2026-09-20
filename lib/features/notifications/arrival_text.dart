import 'package:been_here/data/notifications/notification_service.dart';
import 'package:been_here/domain/memories/arrival_service.dart';
import 'package:been_here/features/common/format.dart';
import 'package:been_here/l10n/generated/app_localizations.dart';

/// Wording for an arrival.
///
/// Lives here rather than in `domain/` because it is the only part that
/// needs to know the language, and it has to work in a background isolate
/// where there is no widget tree to read one from.
MemoryNotification composeArrival(
  AppLocalizations l10n,
  MemoryArrival arrival,
) => MemoryNotification(
  placeId: arrival.placeId,
  title: arrival.name ?? l10n.notificationTitle,
  body: l10n.notificationBody(
    formatRelativeAge(l10n, arrival.age),
    l10n.herePhotoCount(arrival.photoCount),
  ),
);
