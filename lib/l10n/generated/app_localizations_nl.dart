// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class AppLocalizationsNl extends AppLocalizations {
  AppLocalizationsNl([String locale = 'nl']) : super(locale);

  @override
  String get appTitle => 'Been Here';

  @override
  String get hereTabLabel => 'Hier';

  @override
  String get placesTabLabel => 'Plekken';

  @override
  String get settingsTabLabel => 'Instellingen';

  @override
  String get hereEmptyTitle => 'Je hebt hier geen foto\'s gemaakt';

  @override
  String get hereEmptyBody =>
      'Vergroot de zoekstraal, of kom terug op een plek waar je al eens bent geweest.';

  @override
  String get hereNotIndexedTitle => 'Nog niets geïndexeerd';

  @override
  String get hereNotIndexedBody =>
      'Been Here moet je fotobibliotheek één keer lezen om te weten waar je bent geweest. Niets verlaat je telefoon.';

  @override
  String get indexStartAction => 'Mijn foto\'s indexeren';

  @override
  String get indexPermissionTitle => 'Been Here heeft je foto\'s nodig';

  @override
  String get indexPermissionBody =>
      'De app leest alleen waar en wanneer elke foto is gemaakt, en houdt dat op deze telefoon.';

  @override
  String get indexPermissionAction => 'Toegang geven';

  @override
  String get indexPermissionDeniedTitle => 'Fototoegang staat uit';

  @override
  String get indexPermissionDeniedBody =>
      'Zonder kan Been Here je niets laten zien. Je kunt het aanzetten in de systeeminstellingen.';

  @override
  String get indexLimitedAccessNotice =>
      'Je hebt alleen geselecteerde foto\'s gedeeld, dus Been Here ziet alleen die. Met volledige toegang vindt de app elke plek waar je bent geweest.';

  @override
  String get indexRunningTitle => 'Je fotobibliotheek wordt gelezen';

  @override
  String indexRunningProgress(int processed, int total) {
    return '$processed van $total';
  }

  @override
  String get indexFailedTitle => 'Indexeren gestopt';

  @override
  String get indexFailedBody =>
      'Halverwege ging er iets mis. Opnieuw proberen gaat verder waar het stopte.';

  @override
  String indexedPhotoCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count foto\'s geïndexeerd',
      one: '$count foto geïndexeerd',
      zero: 'Geen foto\'s geïndexeerd',
    );
    return '$_temp0';
  }

  @override
  String indexedLocationCoverage(int percent) {
    return '$percent% daarvan heeft een locatie';
  }

  @override
  String get commonLoading => 'Laden…';

  @override
  String get commonRetry => 'Opnieuw proberen';

  @override
  String get commonCancel => 'Annuleren';

  @override
  String hereRadiusLabel(String radius) {
    return 'Binnen $radius';
  }

  @override
  String herePhotoCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count foto\'s',
      one: '$count foto',
      zero: 'Geen foto\'s',
    );
    return '$_temp0';
  }

  @override
  String hereVisitCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bezoeken',
      one: '$count bezoek',
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
  String get ageToday => 'Vandaag';

  @override
  String get ageYesterday => 'Gisteren';

  @override
  String ageDaysAgo(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days dagen geleden',
    );
    return '$_temp0';
  }

  @override
  String ageMonthsAgo(int months) {
    String _temp0 = intl.Intl.pluralLogic(
      months,
      locale: localeName,
      other: '$months maanden geleden',
      one: 'Een maand geleden',
    );
    return '$_temp0';
  }

  @override
  String ageYearsAgo(int years) {
    String _temp0 = intl.Intl.pluralLogic(
      years,
      locale: localeName,
      other: '$years jaar geleden',
      one: 'Een jaar geleden',
    );
    return '$_temp0';
  }

  @override
  String get locationPermissionTitle => 'Waar ben je?';

  @override
  String get locationPermissionBody =>
      'Been Here vergelijkt je positie met de plekken waar je foto\'s zijn gemaakt. Die vergelijking gebeurt op deze telefoon.';

  @override
  String get locationPermissionAction => 'Mijn locatie gebruiken';

  @override
  String get locationDeniedTitle => 'Locatie staat uit';

  @override
  String get locationDeniedBody =>
      'Zonder kan de app niet weten wat je hier hebt. Je kunt het aanzetten in de systeeminstellingen.';

  @override
  String get locationUnavailableTitle => 'Nog geen positie';

  @override
  String get locationUnavailableBody =>
      'Je telefoon weet nog niet waar hij is. Binnen kan dat even duren.';

  @override
  String get locationServicesDisabledTitle => 'Locatievoorzieningen staan uit';

  @override
  String get locationServicesDisabledBody =>
      'Zet ze aan in de systeeminstellingen en kom terug.';

  @override
  String get hereNothingTitle => 'Je hebt hier geen foto\'s gemaakt';

  @override
  String get hereNothingBody =>
      'Probeer een grotere straal, of kom terug op een plek waar je al eens bent geweest.';

  @override
  String hereNearestHint(String distance) {
    return 'Je dichtstbijzijnde herinnering is $distance hiervandaan.';
  }

  @override
  String get photoDetailRephoto => 'Opnieuw fotograferen';

  @override
  String get photoDetailRephotoSoon =>
      'Opnieuw fotograferen komt in een latere versie.';

  @override
  String photoDetailOf(int index, int total) {
    return '$index van $total';
  }

  @override
  String get debugLocationTitle => 'Testlocatie';

  @override
  String get debugLocationBody =>
      'Doe alsof je ergens anders bent, zodat het Hier-scherm vanaf de bank te testen is.';

  @override
  String get debugLocationLatitude => 'Breedtegraad';

  @override
  String get debugLocationLongitude => 'Lengtegraad';

  @override
  String get debugLocationApply => 'Ga erheen';

  @override
  String get debugLocationClear => 'Echte locatie gebruiken';

  @override
  String get debugLocationActive => 'Testlocatie actief';

  @override
  String get commonClose => 'Sluiten';

  @override
  String get placesEmptyTitle => 'Nog geen plekken';

  @override
  String get placesEmptyBody =>
      'Plekken verschijnen zodra je foto\'s zijn geïndexeerd.';

  @override
  String get placesSortLabel => 'Sorteren op';

  @override
  String get placesSortLongestAgo => 'Langst geleden';

  @override
  String get placesSortMostPhotos => 'Meeste foto\'s';

  @override
  String get placesSortNearest => 'Dichtstbij';

  @override
  String placesMutedSection(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count gedempte plekken',
      one: '$count gedempte plek',
    );
    return '$_temp0';
  }

  @override
  String get placesMute => 'Dempen';

  @override
  String get placesUnmute => 'Niet meer dempen';

  @override
  String get placesUseAutoRule => 'Automatisch beslissen';

  @override
  String get placesAutoMutedNote =>
      'Automatisch gedempt — je bent hier bijna elke dag';

  @override
  String get placesUserMutedNote => 'Door jou gedempt';

  @override
  String get placesUserUnmutedNote => 'Door jou zichtbaar gehouden';

  @override
  String placesDayCount(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days dagen',
      one: '$days dag',
    );
    return '$_temp0';
  }

  @override
  String get settingsPlaceNamesTitle => 'Plekken een naam geven';

  @override
  String get settingsPlaceNamesBody =>
      'Vraagt het systeem om de coördinaten van een plek om te zetten in een naam. Die coördinaat gaat naar Apple of Google — het is het enige in deze app dat je telefoon verlaat. Standaard uit; weer uitzetten vergeet alle namen.';

  @override
  String get settingsAutoMuteTitle => 'Alledaagse plekken dempen na';

  @override
  String get settingsAutoMuteBody =>
      'Een plek met foto\'s op zoveel verschillende dagen is een plek waar je woont, niet een plek die je bezoekt.';

  @override
  String settingsAutoMuteValue(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days dagen',
    );
    return '$_temp0';
  }

  @override
  String get settingsIndexTitle => 'Foto-index';

  @override
  String get settingsReindex => 'Helemaal opnieuw indexeren';

  @override
  String get settingsPrivacyTitle => 'Wat op deze telefoon blijft';

  @override
  String get settingsPrivacyBody =>
      'Je foto\'s, waar ze zijn gemaakt en alles wat deze app daaruit afleidt. Er is geen account, geen server en geen analytics.';

  @override
  String get placesName => 'Deze plek een naam geven';

  @override
  String get placesRename => 'Hernoemen';

  @override
  String get placesNameDialogTitle => 'Naam van de plek';

  @override
  String get placesNameHint => 'Bij oma, het meer, kantoor…';

  @override
  String get placesNameSave => 'Bewaren';

  @override
  String get placesNameClear => 'Naam verwijderen';

  @override
  String placesSummary(String age, String photos) {
    return '$age · $photos';
  }

  @override
  String get notificationTitle => 'Je bent hier eerder geweest';

  @override
  String notificationBody(String age, String photos) {
    return 'Je was hier voor het laatst $age. $photos.';
  }

  @override
  String get alwaysLocationTitle => 'Laat Been Here voor je opletten';

  @override
  String get alwaysLocationBody =>
      'Met locatie op de achtergrond kan je telefoon Been Here laten weten wanneer je aankomt op een plek die je eerder hebt gefotografeerd — en de app kan het je één keer zeggen, zonder dat je iets opent.\n\nDe app volgt je nooit. Je telefoon houdt een handvol cirkels in de gaten en maakt de app alleen wakker als je er een binnengaat. Niets over waar je bent verlaat dit apparaat.';

  @override
  String get alwaysLocationAction => 'Aankomsten aanzetten';

  @override
  String get alwaysLocationLater => 'Niet nu';

  @override
  String get alwaysLocationDeniedBody =>
      'Locatie op de achtergrond staat uit, dus aankomsten blijven stil. Al het andere werkt zoals voorheen; je kunt het altijd aanzetten in de systeeminstellingen.';

  @override
  String get settingsArrivalsTitle => 'Aankomsten';

  @override
  String get settingsArrivalsOn =>
      'Been Here laat het je weten als je aankomt op een plek die je al een tijd niet hebt gefotografeerd.';

  @override
  String get settingsArrivalsOff =>
      'Been Here blijft stil. Aanzetten vraagt om locatie op de achtergrond.';

  @override
  String get settingsMemoryAgeTitle => 'Alleen plekken noemen ouder dan';

  @override
  String settingsMemoryAgeValue(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days dagen',
      one: '$days dag',
    );
    return '$_temp0';
  }

  @override
  String get settingsPlaceCooldownTitle =>
      'Die plek daarna stil houden gedurende';

  @override
  String get settingsDailyLimitTitle => 'En helemaal niets zeggen gedurende';

  @override
  String settingsDailyLimitValue(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours uur',
      one: '$hours uur',
      zero: 'geen tijd',
    );
    return '$_temp0';
  }

  @override
  String get settingsThresholdsBody =>
      'Verlaag deze waarden om aankomsten uit te proberen zonder een half jaar te wachten.';

  @override
  String get placesTestArrival => 'Hier een aankomst testen';

  @override
  String get arrivalTestNotified => 'Melding verstuurd';

  @override
  String get arrivalTestMuted => 'Niets: de plek is gedempt';

  @override
  String get arrivalTestTooFewPhotos => 'Niets: te weinig foto\'s hier';

  @override
  String get arrivalTestTooRecent =>
      'Niets: je hebt hier te kort geleden gefotografeerd';

  @override
  String get arrivalTestPlaceCooldown =>
      'Niets: deze plek heeft onlangs al iets gezegd';

  @override
  String get arrivalTestDailyLimit =>
      'Niets: er is vandaag al iets anders gemeld';

  @override
  String get alwaysLocationNeedsSettingsBody =>
      'Je telefoon heeft locatie op \'Bij gebruik van app\' gelaten. iOS biedt die keuze niet opnieuw aan vanuit een app, dus locatie op de achtergrond moet in de systeeminstellingen op \'Altijd\' worden gezet — dan werken aankomsten.';

  @override
  String get commonOpenSettings => 'Instellingen openen';

  @override
  String get settingsArrivalsPending =>
      'Bijna: locatie staat nog op \'Bij gebruik van app\'. Zet het op \'Altijd\' in de systeeminstellingen.';

  @override
  String get placesSortVisits => 'Meeste bezoeken';

  @override
  String get placesSortAscending => 'Omgekeerde volgorde';

  @override
  String placesVisitCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bezoeken',
      one: '$count bezoek',
      zero: 'nooit',
    );
    return '$_temp0';
  }

  @override
  String get settingsMapTitle => 'Plekken op een kaart tonen';

  @override
  String get settingsMapBody =>
      'Kaarttegels worden van OpenStreetMap gedownload terwijl je schuift en zoomt, dus die server ziet doorlopend waar je naar kijkt. Anders dan een plaatsnaam, die één keer wordt opgevraagd, gaat dit door zolang de kaart open is. Standaard uit.';

  @override
  String get placesShowMap => 'Kaart';

  @override
  String get placesShowList => 'Lijst';

  @override
  String get placesMapAttribution => '© OpenStreetMap-bijdragers';

  @override
  String get rephotoOverlay => 'Overvloeien';

  @override
  String get rephotoEdges => 'Omtrek';

  @override
  String get rephotoCapture => 'Maak hem';

  @override
  String get rephotoSaved => 'Bewaard in je foto\'s';

  @override
  String get rephotoNotSaved =>
      'Kon hem niet bewaren. Foto\'s toevoegen staat misschien uit.';

  @override
  String get rephotoNoCamera =>
      'Geen camera beschikbaar. Been Here heeft de camera nodig om een foto te maken die een oude beantwoordt.';

  @override
  String get rephotoThenAndNow => 'Toen & nu';

  @override
  String get rephotoShare => 'Delen';

  @override
  String get rephotoThen => 'Toen';

  @override
  String get rephotoNow => 'Nu';

  @override
  String get rephotoShareFailed => 'Kon de afbeelding om te delen niet maken.';

  @override
  String get onboardingSkip => 'Overslaan';

  @override
  String get onboardingNext => 'Volgende';

  @override
  String get onboardingWhatTitle => 'Foto\'s van de plek waar je staat';

  @override
  String get onboardingWhatBody =>
      'Kom aan op een plek die je eerder hebt gefotografeerd en Been Here laat zien wat je daar hebt gemaakt — bezoek voor bezoek, het langst geleden eerst.';

  @override
  String get onboardingPrivacyTitle => 'Niets verlaat je telefoon';

  @override
  String get onboardingPrivacyBody =>
      'Geen account, geen server, geen analytics. Been Here leest je fotobibliotheek op het apparaat en houdt er een kleine index naast bij. Je foto\'s, en waar ze zijn gemaakt, blijven waar ze zijn.';

  @override
  String get onboardingPrivacyFootnote =>
      'Twee dingen kunnen het netwerk bereiken, en beide staan uit tot je ze aanzet: plaatsnamen en de kaart.';

  @override
  String get onboardingPhotosTitle => 'De app heeft je foto\'s nodig';

  @override
  String get onboardingPhotosBody =>
      'Been Here noteert welke foto waar is gemaakt. Het kopieert of verplaatst nooit iets — het onthoudt id\'s en coördinaten, en leest de foto\'s zelf alleen als het ze aan jou laat zien.';

  @override
  String get onboardingPhotosAction => 'Foto\'s toestaan';

  @override
  String get onboardingDone => 'Beginnen';

  @override
  String get settingsAboutTitle => 'Over';

  @override
  String settingsVersion(String version, String build) {
    return 'Versie $version ($build)';
  }

  @override
  String get settingsSourceTitle => 'Broncode';

  @override
  String get settingsShowIntro => 'Introductie opnieuw tonen';

  @override
  String photoSemanticLabel(String date) {
    return 'Foto van $date';
  }

  @override
  String photoOpenSemanticLabel(int index, int total, String date) {
    return 'Foto $index van $total, $date';
  }

  @override
  String get placesActionsLabel => 'Wat te doen met deze plek';

  @override
  String get radiusSemanticLabel => 'Zoekstraal';

  @override
  String get hereMapTitle => 'Hier in de buurt';

  @override
  String get hereOpenInMaps => 'Openen in Kaarten';

  @override
  String get hereBackToMe => 'Terug naar waar ik ben';

  @override
  String get herePlaceFallbackTitle => 'Een plek die je kent';

  @override
  String get arrivalTestNearHome => 'Te dicht bij huis om nieuws te zijn.';

  @override
  String get settingsHomeRadiusTitle => 'Stil blijven binnen';

  @override
  String settingsHomeRadiusValue(num km) {
    String _temp0 = intl.Intl.pluralLogic(
      km,
      locale: localeName,
      other: '$km km van huis',
      one: '$km km van huis',
      zero: 'geen afstand — nooit stil',
    );
    return '$_temp0';
  }

  @override
  String get settingsHomeRadiusBody =>
      'Het dagelijks leven speelt zich dicht bij huis af, en juist daar is een telefoon die er commentaar op geeft het minst welkom. Plekken dichterbij dan dit worden nooit in de gaten gehouden.';

  @override
  String get settingsQuietTitle => 'Waarom het stil is';

  @override
  String settingsQuietWatching(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count plekken in de gaten gehouden',
      one: '$count plek in de gaten gehouden',
      zero: 'Geen plekken in de gaten gehouden',
    );
    return '$_temp0';
  }

  @override
  String settingsQuietNearest(String distance) {
    return 'Dichtstbijzijnde gevolgde plek: $distance';
  }

  @override
  String get settingsQuietNothingWatched =>
      'Er wordt niets in de gaten gehouden, dus er kan niets aankomen.';

  @override
  String settingsQuietLastNotified(String when) {
    return 'Laatste melding: $when';
  }

  @override
  String get settingsQuietNever => 'nooit';

  @override
  String settingsQuietBreakdown(int total, String reasons) {
    return 'Van $total plekken: $reasons';
  }

  @override
  String settingsQuietReasonMuted(Object count) {
    return '$count gedempt';
  }

  @override
  String settingsQuietReasonNearHome(Object count) {
    return '$count dicht bij huis';
  }

  @override
  String settingsQuietReasonTooFewPhotos(Object count) {
    return '$count met te weinig foto\'s';
  }

  @override
  String settingsQuietReasonTooRecent(Object count) {
    return '$count te kort geleden gefotografeerd';
  }

  @override
  String settingsQuietReasonPlaceCooldown(Object count) {
    return '$count nog in rustperiode';
  }

  @override
  String settingsQuietReasonEligible(Object count) {
    return '$count de moeite waard';
  }

  @override
  String get ageSemanticLabel => 'Leeftijd van foto\'s';

  @override
  String get ageStopNow => 'nu';

  @override
  String get ageStopDay => '1 dag';

  @override
  String get ageStop3Days => '3 dagen';

  @override
  String get ageStopWeek => '1 week';

  @override
  String get ageStop2Weeks => '2 weken';

  @override
  String get ageStopMonth => '1 maand';

  @override
  String get ageStop3Months => '3 maanden';

  @override
  String get ageStop6Months => '6 maanden';

  @override
  String get ageStopYear => '1 jaar';

  @override
  String get ageStop2Years => '2 jaar';

  @override
  String get ageStop5Years => '5 jaar';

  @override
  String get ageStop10Years => '10 jaar';

  @override
  String get ageStopAll => 'alles';

  @override
  String get ageWindowAll => 'Alle foto\'s';

  @override
  String ageWindowNewerThan(String stop) {
    return 'Tot $stop oud';
  }

  @override
  String ageWindowOlderThan(String stop) {
    return 'Ouder dan $stop';
  }

  @override
  String ageWindowBetween(String newest, String oldest) {
    return '$newest tot $oldest oud';
  }

  @override
  String get ageWindowReset => 'Herstellen';

  @override
  String mapDotCountCapped(int count) {
    return '$count+ foto\'s';
  }
}
