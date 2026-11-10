// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'Been Here';

  @override
  String get hereTabLabel => 'Hier';

  @override
  String get placesTabLabel => 'Orte';

  @override
  String get settingsTabLabel => 'Einstellungen';

  @override
  String get hereEmptyTitle => 'Hier hast du noch keine Fotos gemacht';

  @override
  String get hereEmptyBody =>
      'Vergrößere den Suchradius oder komm an einen Ort zurück, an dem du schon warst.';

  @override
  String get hereNotIndexedTitle => 'Noch nichts indexiert';

  @override
  String get hereNotIndexedBody =>
      'Been Here muss deine Mediathek einmal lesen, um zu wissen, wo du schon warst. Nichts verlässt dein Telefon.';

  @override
  String get indexStartAction => 'Meine Fotos indexieren';

  @override
  String get indexPermissionTitle => 'Been Here braucht deine Fotos';

  @override
  String get indexPermissionBody =>
      'Die App liest nur, wo und wann jedes Foto aufgenommen wurde, und behält das auf diesem Telefon.';

  @override
  String get indexPermissionAction => 'Zugriff erlauben';

  @override
  String get indexPermissionDeniedTitle => 'Fotozugriff ist aus';

  @override
  String get indexPermissionDeniedBody =>
      'Ohne ihn kann Been Here dir nichts zeigen. Du kannst ihn in den Systemeinstellungen einschalten.';

  @override
  String get indexLimitedAccessNotice =>
      'Du hast nur ausgewählte Fotos freigegeben, daher sieht Been Here nur diese. Mit vollem Zugriff findet die App jeden Ort, an dem du warst.';

  @override
  String get indexRunningTitle => 'Deine Mediathek wird gelesen';

  @override
  String indexRunningProgress(int processed, int total) {
    return '$processed von $total';
  }

  @override
  String get indexFailedTitle => 'Indexierung angehalten';

  @override
  String get indexFailedBody =>
      'Unterwegs ist etwas schiefgegangen. Ein neuer Versuch macht dort weiter, wo es aufgehört hat.';

  @override
  String indexedPhotoCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Fotos indexiert',
      one: '$count Foto indexiert',
      zero: 'Keine Fotos indexiert',
    );
    return '$_temp0';
  }

  @override
  String indexedLocationCoverage(int percent) {
    return '$percent % davon haben einen Ort';
  }

  @override
  String get commonLoading => 'Wird geladen…';

  @override
  String get commonRetry => 'Erneut versuchen';

  @override
  String get commonCancel => 'Abbrechen';

  @override
  String hereRadiusLabel(String radius) {
    return 'Im Umkreis von $radius';
  }

  @override
  String herePhotoCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Fotos',
      one: '$count Foto',
      zero: 'Keine Fotos',
    );
    return '$_temp0';
  }

  @override
  String hereVisitCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Besuche',
      one: '$count Besuch',
    );
    return '$_temp0';
  }

  @override
  String distanceMeters(int meters) {
    return '$meters m';
  }

  @override
  String distanceKilometers(String km) {
    return '$km km';
  }

  @override
  String get ageToday => 'Heute';

  @override
  String get ageYesterday => 'Gestern';

  @override
  String ageDaysAgo(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Vor $days Tagen',
    );
    return '$_temp0';
  }

  @override
  String ageMonthsAgo(int months) {
    String _temp0 = intl.Intl.pluralLogic(
      months,
      locale: localeName,
      other: 'Vor $months Monaten',
      one: 'Vor einem Monat',
    );
    return '$_temp0';
  }

  @override
  String ageYearsAgo(int years) {
    String _temp0 = intl.Intl.pluralLogic(
      years,
      locale: localeName,
      other: 'Vor $years Jahren',
      one: 'Vor einem Jahr',
    );
    return '$_temp0';
  }

  @override
  String get locationPermissionTitle => 'Wo bist du?';

  @override
  String get locationPermissionBody =>
      'Been Here vergleicht deine Position mit den Orten, an denen deine Fotos entstanden sind. Der Vergleich passiert auf diesem Telefon.';

  @override
  String get locationPermissionAction => 'Meinen Standort verwenden';

  @override
  String get locationDeniedTitle => 'Standort ist aus';

  @override
  String get locationDeniedBody =>
      'Ohne ihn weiß die App nicht, was du hier hast. Du kannst ihn in den Systemeinstellungen einschalten.';

  @override
  String get locationUnavailableTitle => 'Noch keine Position';

  @override
  String get locationUnavailableBody =>
      'Dein Telefon weiß noch nicht, wo es ist. In Gebäuden kann das einen Moment dauern.';

  @override
  String get locationServicesDisabledTitle => 'Ortungsdienste sind aus';

  @override
  String get locationServicesDisabledBody =>
      'Schalte sie in den Systemeinstellungen ein und komm zurück.';

  @override
  String get hereNothingTitle => 'Hier hast du noch keine Fotos gemacht';

  @override
  String get hereNothingBody =>
      'Versuch einen größeren Radius oder komm an einen Ort zurück, an dem du schon warst.';

  @override
  String hereNearestHint(String distance) {
    return 'Deine nächste Erinnerung ist $distance entfernt.';
  }

  @override
  String get photoDetailRephoto => 'Neu fotografieren';

  @override
  String get photoDetailRephotoSoon =>
      'Neu fotografieren kommt in einer späteren Version.';

  @override
  String photoDetailOf(int index, int total) {
    return '$index von $total';
  }

  @override
  String get debugLocationTitle => 'Debug-Standort';

  @override
  String get debugLocationBody =>
      'Tu so, als wärst du woanders, damit sich der Hier-Bildschirm vom Sofa aus testen lässt.';

  @override
  String get debugLocationLatitude => 'Breitengrad';

  @override
  String get debugLocationLongitude => 'Längengrad';

  @override
  String get debugLocationApply => 'Dorthin';

  @override
  String get debugLocationClear => 'Echten Standort verwenden';

  @override
  String get debugLocationActive => 'Debug-Standort aktiv';

  @override
  String get commonClose => 'Schließen';

  @override
  String get placesEmptyTitle => 'Noch keine Orte';

  @override
  String get placesEmptyBody =>
      'Orte erscheinen, sobald deine Fotos indexiert sind.';

  @override
  String get placesSortLabel => 'Sortieren nach';

  @override
  String get placesSortLongestAgo => 'Am längsten her';

  @override
  String get placesSortMostPhotos => 'Meiste Fotos';

  @override
  String get placesSortNearest => 'Am nächsten';

  @override
  String placesMutedSection(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count stummgeschaltete Orte',
      one: '$count stummgeschalteter Ort',
    );
    return '$_temp0';
  }

  @override
  String get placesMute => 'Stummschalten';

  @override
  String get placesUnmute => 'Stummschaltung aufheben';

  @override
  String get placesUseAutoRule => 'Automatisch entscheiden';

  @override
  String get placesAutoMutedNote =>
      'Automatisch stummgeschaltet – du bist fast jeden Tag hier';

  @override
  String get placesUserMutedNote => 'Von dir stummgeschaltet';

  @override
  String get placesUserUnmutedNote => 'Von dir sichtbar gehalten';

  @override
  String placesDayCount(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days Tage',
      one: '$days Tag',
    );
    return '$_temp0';
  }

  @override
  String get settingsPlaceNamesTitle => 'Orte benennen';

  @override
  String get settingsPlaceNamesBody =>
      'Bittet das System, die Koordinaten eines Ortes in einen Namen zu verwandeln. Diese Koordinate geht an Apple oder Google – es ist das Einzige in dieser App, das dein Telefon verlässt. Standardmäßig aus; beim erneuten Ausschalten werden alle Namen vergessen.';

  @override
  String get settingsAutoMuteTitle => 'Alltagsorte stummschalten nach';

  @override
  String get settingsAutoMuteBody =>
      'Ein Ort mit Fotos an so vielen verschiedenen Tagen ist ein Ort, an dem du lebst, nicht einer, den du besuchst.';

  @override
  String settingsAutoMuteValue(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days Tagen',
    );
    return '$_temp0';
  }

  @override
  String get settingsIndexTitle => 'Fotoindex';

  @override
  String get settingsReindex => 'Komplett neu indexieren';

  @override
  String get settingsPrivacyTitle => 'Was auf diesem Telefon bleibt';

  @override
  String get settingsPrivacyBody =>
      'Deine Fotos, wo sie entstanden sind, und alles, was diese App daraus ableitet. Es gibt kein Konto, keinen Server und keine Analyse.';

  @override
  String get placesName => 'Diesen Ort benennen';

  @override
  String get placesRename => 'Umbenennen';

  @override
  String get placesNameDialogTitle => 'Name des Ortes';

  @override
  String get placesNameHint => 'Bei Oma, der See, das Büro…';

  @override
  String get placesNameSave => 'Speichern';

  @override
  String get placesNameClear => 'Namen entfernen';

  @override
  String placesSummary(String age, String photos) {
    return '$age · $photos';
  }

  @override
  String get notificationTitle => 'Hier warst du schon einmal';

  @override
  String notificationBody(String age, String photos) {
    return 'Zuletzt warst du $age hier. $photos.';
  }

  @override
  String get alwaysLocationTitle => 'Lass Been Here für dich aufpassen';

  @override
  String get alwaysLocationBody =>
      'Mit Standort im Hintergrund kann dein Telefon Been Here Bescheid geben, wenn du an einem Ort ankommst, den du schon einmal fotografiert hast – und die App kann es dir einmal sagen, ohne dass du etwas öffnest.\n\nDie App verfolgt dich nie. Dein Telefon beobachtet eine Handvoll Kreise und weckt die App nur, wenn du einen davon betrittst. Nichts über deinen Aufenthaltsort verlässt dieses Gerät.';

  @override
  String get alwaysLocationAction => 'Ankünfte einschalten';

  @override
  String get alwaysLocationLater => 'Nicht jetzt';

  @override
  String get alwaysLocationDeniedBody =>
      'Standort im Hintergrund ist aus, daher bleiben Ankünfte still. Alles andere funktioniert wie bisher; du kannst ihn jederzeit in den Systemeinstellungen einschalten.';

  @override
  String get settingsArrivalsTitle => 'Ankünfte';

  @override
  String get settingsArrivalsOn =>
      'Been Here sagt dir Bescheid, wenn du an einem Ort ankommst, den du länger nicht fotografiert hast.';

  @override
  String get settingsArrivalsOff =>
      'Been Here bleibt still. Beim Einschalten wird nach Standort im Hintergrund gefragt.';

  @override
  String get settingsMemoryAgeTitle => 'Nur Orte erwähnen, älter als';

  @override
  String settingsMemoryAgeValue(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days Tage',
      one: '$days Tag',
    );
    return '$_temp0';
  }

  @override
  String get settingsPlaceCooldownTitle => 'Danach diesen Ort ruhig lassen für';

  @override
  String get settingsDailyLimitTitle => 'Und überhaupt nichts sagen für';

  @override
  String settingsDailyLimitValue(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours Stunden',
      one: '$hours Stunde',
      zero: 'keine Zeit',
    );
    return '$_temp0';
  }

  @override
  String get settingsThresholdsBody =>
      'Senke diese Werte, um Ankünfte auszuprobieren, ohne ein halbes Jahr zu warten.';

  @override
  String get placesTestArrival => 'Hier eine Ankunft testen';

  @override
  String get arrivalTestNotified => 'Mitteilung gesendet';

  @override
  String get arrivalTestMuted => 'Nichts: Der Ort ist stummgeschaltet';

  @override
  String get arrivalTestTooFewPhotos => 'Nichts: zu wenige Fotos hier';

  @override
  String get arrivalTestTooRecent =>
      'Nichts: Du hast hier erst vor Kurzem fotografiert';

  @override
  String get arrivalTestPlaceCooldown =>
      'Nichts: Dieser Ort hat sich vor Kurzem gemeldet';

  @override
  String get arrivalTestDailyLimit =>
      'Nichts: Heute hat sich schon etwas anderes gemeldet';

  @override
  String get alwaysLocationNeedsSettingsBody =>
      'Dein Telefon hat den Standort auf „Beim Verwenden“ gelassen. iOS bietet die Wahl innerhalb einer App nicht noch einmal an, daher muss der Standort in den Systemeinstellungen auf „Immer“ gestellt werden – dann funktionieren Ankünfte.';

  @override
  String get commonOpenSettings => 'Einstellungen öffnen';

  @override
  String get settingsArrivalsPending =>
      'Fast: Der Standort steht noch auf „Beim Verwenden“. Stell ihn in den Systemeinstellungen auf „Immer“.';

  @override
  String get placesSortVisits => 'Meiste Besuche';

  @override
  String get placesSortAscending => 'Umgekehrte Reihenfolge';

  @override
  String placesVisitCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Besuche',
      one: '$count Besuch',
      zero: 'nie',
    );
    return '$_temp0';
  }

  @override
  String get settingsMapTitle => 'Orte auf einer Karte zeigen';

  @override
  String get settingsMapBody =>
      'Kartenkacheln werden beim Verschieben und Zoomen von OpenStreetMap geladen, sodass dieser Server laufend sieht, wohin du schaust. Anders als ein Ortsname, der nur einmal abgefragt wird, geht das so lange weiter, wie die Karte offen ist. Standardmäßig aus.';

  @override
  String get placesShowMap => 'Karte';

  @override
  String get placesShowList => 'Liste';

  @override
  String get placesMapAttribution => '© OpenStreetMap-Mitwirkende';

  @override
  String get rephotoOverlay => 'Überblenden';

  @override
  String get rephotoEdges => 'Umriss';

  @override
  String get rephotoCapture => 'Aufnehmen';

  @override
  String get rephotoSaved => 'In deinen Fotos gespeichert';

  @override
  String get rephotoNotSaved =>
      'Speichern fehlgeschlagen. Das Hinzufügen von Fotos ist vielleicht ausgeschaltet.';

  @override
  String get rephotoNoCamera =>
      'Keine Kamera verfügbar. Been Here braucht die Kamera, um ein Foto aufzunehmen, das einem alten antwortet.';

  @override
  String get rephotoThenAndNow => 'Damals & heute';

  @override
  String get rephotoShare => 'Teilen';

  @override
  String get rephotoThen => 'Damals';

  @override
  String get rephotoNow => 'Heute';

  @override
  String get rephotoShareFailed =>
      'Das Bild zum Teilen konnte nicht erstellt werden.';

  @override
  String get onboardingSkip => 'Überspringen';

  @override
  String get onboardingNext => 'Weiter';

  @override
  String get onboardingWhatTitle => 'Fotos von dem Fleck, auf dem du stehst';

  @override
  String get onboardingWhatBody =>
      'Komm an einen Ort, den du schon fotografiert hast, und Been Here zeigt dir, was du dort aufgenommen hast – Besuch für Besuch, das Älteste zuerst.';

  @override
  String get onboardingPrivacyTitle => 'Nichts verlässt dein Telefon';

  @override
  String get onboardingPrivacyBody =>
      'Kein Konto, kein Server, keine Analyse. Been Here liest deine Mediathek auf dem Gerät und legt daneben einen kleinen Index an. Deine Fotos und wo sie entstanden sind, bleiben, wo sie sind.';

  @override
  String get onboardingPrivacyFootnote =>
      'Zwei Dinge können das Netz erreichen, und beide sind aus, bis du sie einschaltest: Ortsnamen und die Karte.';

  @override
  String get onboardingPhotosTitle => 'Die App braucht deine Fotos';

  @override
  String get onboardingPhotosBody =>
      'Been Here merkt sich, welches Foto wo aufgenommen wurde. Es kopiert oder verschiebt nie etwas – es merkt sich IDs und Koordinaten und liest die Bilder selbst nur, wenn es sie dir zeigt.';

  @override
  String get onboardingPhotosAction => 'Fotos erlauben';

  @override
  String get onboardingDone => 'Los geht\'s';

  @override
  String get settingsAboutTitle => 'Über';

  @override
  String settingsVersion(String version, String build) {
    return 'Version $version ($build)';
  }

  @override
  String get settingsSourceTitle => 'Quellcode';

  @override
  String get settingsShowIntro => 'Einführung erneut zeigen';

  @override
  String photoSemanticLabel(String date) {
    return 'Foto vom $date';
  }

  @override
  String photoOpenSemanticLabel(int index, int total, String date) {
    return 'Foto $index von $total, $date';
  }

  @override
  String get placesActionsLabel => 'Was mit diesem Ort tun';

  @override
  String get radiusSemanticLabel => 'Suchradius';

  @override
  String get hereMapTitle => 'Hier in der Nähe';

  @override
  String get hereOpenInMaps => 'In Karten öffnen';

  @override
  String get hereBackToMe => 'Zurück zu meinem Standort';

  @override
  String get herePlaceFallbackTitle => 'Ein Ort, den du kennst';

  @override
  String get arrivalTestNearHome =>
      'Zu nah an zu Hause, um eine Neuigkeit zu sein.';

  @override
  String get settingsHomeRadiusTitle => 'Still bleiben im Umkreis von';

  @override
  String settingsHomeRadiusValue(num km) {
    String _temp0 = intl.Intl.pluralLogic(
      km,
      locale: localeName,
      other: '$km km um zu Hause',
      one: '$km km um zu Hause',
      zero: 'keinem Abstand – nie still',
    );
    return '$_temp0';
  }

  @override
  String get settingsHomeRadiusBody =>
      'Der Alltag spielt sich nahe zu Hause ab, und genau dort ist ein Telefon, das ihn kommentiert, am wenigsten willkommen. Orte, die näher liegen, werden nie beobachtet.';

  @override
  String get settingsQuietTitle => 'Warum es still ist';

  @override
  String settingsQuietWatching(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Orte werden beobachtet',
      one: '$count Ort wird beobachtet',
      zero: 'Kein Ort wird beobachtet',
    );
    return '$_temp0';
  }

  @override
  String settingsQuietNearest(String distance) {
    return 'Nächster beobachteter Ort: $distance';
  }

  @override
  String get settingsQuietNothingWatched =>
      'Nichts wird beobachtet, also kann auch keine Ankunft kommen.';

  @override
  String settingsQuietLastNotified(String when) {
    return 'Letzte Mitteilung: $when';
  }

  @override
  String get settingsQuietNever => 'nie';

  @override
  String settingsQuietBreakdown(int total, String reasons) {
    return 'Von $total Orten: $reasons';
  }

  @override
  String settingsQuietReasonMuted(Object count) {
    return '$count stummgeschaltet';
  }

  @override
  String settingsQuietReasonNearHome(Object count) {
    return '$count nahe zu Hause';
  }

  @override
  String settingsQuietReasonTooFewPhotos(Object count) {
    return '$count mit zu wenigen Fotos';
  }

  @override
  String settingsQuietReasonTooRecent(Object count) {
    return '$count vor Kurzem fotografiert';
  }

  @override
  String settingsQuietReasonPlaceCooldown(Object count) {
    return '$count noch in der Ruhezeit';
  }

  @override
  String settingsQuietReasonEligible(Object count) {
    return '$count lohnen sich';
  }

  @override
  String get ageSemanticLabel => 'Alter der Fotos';

  @override
  String get ageStopNow => 'jetzt';

  @override
  String get ageStopDay => '1 Tag';

  @override
  String get ageStop3Days => '3 Tage';

  @override
  String get ageStopWeek => '1 Woche';

  @override
  String get ageStop2Weeks => '2 Wochen';

  @override
  String get ageStopMonth => '1 Monat';

  @override
  String get ageStop3Months => '3 Monate';

  @override
  String get ageStop6Months => '6 Monate';

  @override
  String get ageStopYear => '1 Jahr';

  @override
  String get ageStop2Years => '2 Jahre';

  @override
  String get ageStop5Years => '5 Jahre';

  @override
  String get ageStop10Years => '10 Jahre';

  @override
  String get ageStopAll => 'alle';

  @override
  String get ageWindowAll => 'Alle Fotos';

  @override
  String ageWindowNewerThan(String stop) {
    return 'Bis $stop alt';
  }

  @override
  String ageWindowOlderThan(String stop) {
    return 'Älter als $stop';
  }

  @override
  String ageWindowBetween(String newest, String oldest) {
    return '$newest bis $oldest alt';
  }

  @override
  String get ageWindowReset => 'Zurücksetzen';

  @override
  String mapDotCountCapped(int count) {
    return '$count+ Fotos';
  }
}
