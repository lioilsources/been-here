// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Norwegian Bokmål (`nb`).
class AppLocalizationsNb extends AppLocalizations {
  AppLocalizationsNb([String locale = 'nb']) : super(locale);

  @override
  String get appTitle => 'Been Here';

  @override
  String get hereTabLabel => 'Her';

  @override
  String get placesTabLabel => 'Steder';

  @override
  String get settingsTabLabel => 'Innstillinger';

  @override
  String get hereEmptyTitle => 'Du har ikke tatt bilder her';

  @override
  String get hereEmptyBody =>
      'Gjør søkeradiusen større, eller kom tilbake til et sted du har vært før.';

  @override
  String get hereNotIndexedTitle => 'Ingenting indeksert ennå';

  @override
  String get hereNotIndexedBody =>
      'Been Here må lese bildebiblioteket ditt én gang for å vite hvor du har vært. Ingenting forlater telefonen din.';

  @override
  String get indexStartAction => 'Indekser bildene mine';

  @override
  String get indexPermissionTitle => 'Been Here trenger bildene dine';

  @override
  String get indexPermissionBody =>
      'Den leser bare hvor og når hvert bilde ble tatt, og beholder det på denne telefonen.';

  @override
  String get indexPermissionAction => 'Gi tilgang';

  @override
  String get indexPermissionDeniedTitle => 'Bildetilgang er slått av';

  @override
  String get indexPermissionDeniedBody =>
      'Uten den kan ikke Been Here vise deg noe. Du kan slå den på i systeminnstillingene.';

  @override
  String get indexLimitedAccessNotice =>
      'Du har bare delt utvalgte bilder, så Been Here ser bare dem. Med full tilgang kan den finne alle steder du har vært.';

  @override
  String get indexRunningTitle => 'Leser bildebiblioteket ditt';

  @override
  String indexRunningProgress(int processed, int total) {
    return '$processed av $total';
  }

  @override
  String get indexFailedTitle => 'Indekseringen stoppet';

  @override
  String get indexFailedBody =>
      'Noe gikk galt underveis. Prøver du igjen, fortsetter den der den slapp.';

  @override
  String indexedPhotoCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bilder indeksert',
      one: '$count bilde indeksert',
      zero: 'Ingen bilder indeksert',
    );
    return '$_temp0';
  }

  @override
  String indexedLocationCoverage(int percent) {
    return '$percent % av dem har en posisjon';
  }

  @override
  String get commonLoading => 'Laster inn…';

  @override
  String get commonRetry => 'Prøv igjen';

  @override
  String get commonCancel => 'Avbryt';

  @override
  String hereRadiusLabel(String radius) {
    return 'Innenfor $radius';
  }

  @override
  String herePhotoCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bilder',
      one: '$count bilde',
      zero: 'Ingen bilder',
    );
    return '$_temp0';
  }

  @override
  String hereVisitCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count besøk',
      one: '$count besøk',
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
  String get ageToday => 'I dag';

  @override
  String get ageYesterday => 'I går';

  @override
  String ageDaysAgo(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'For $days dager siden',
    );
    return '$_temp0';
  }

  @override
  String ageMonthsAgo(int months) {
    String _temp0 = intl.Intl.pluralLogic(
      months,
      locale: localeName,
      other: 'For $months måneder siden',
      one: 'For en måned siden',
    );
    return '$_temp0';
  }

  @override
  String ageYearsAgo(int years) {
    String _temp0 = intl.Intl.pluralLogic(
      years,
      locale: localeName,
      other: 'For $years år siden',
      one: 'For et år siden',
    );
    return '$_temp0';
  }

  @override
  String get locationPermissionTitle => 'Hvor er du?';

  @override
  String get locationPermissionBody =>
      'Been Here sammenligner posisjonen din med stedene der bildene dine ble tatt. Sammenligningen skjer på denne telefonen.';

  @override
  String get locationPermissionAction => 'Bruk posisjonen min';

  @override
  String get locationDeniedTitle => 'Posisjon er slått av';

  @override
  String get locationDeniedBody =>
      'Uten den kan ikke appen vite hva du har her. Du kan slå den på i systeminnstillingene.';

  @override
  String get locationUnavailableTitle => 'Ingen posisjon ennå';

  @override
  String get locationUnavailableBody =>
      'Telefonen har ikke funnet ut hvor den er. Innendørs kan det ta et øyeblikk.';

  @override
  String get locationServicesDisabledTitle => 'Posisjonstjenester er slått av';

  @override
  String get locationServicesDisabledBody =>
      'Slå dem på i systeminnstillingene og kom tilbake.';

  @override
  String get hereNothingTitle => 'Du har ikke tatt bilder her';

  @override
  String get hereNothingBody =>
      'Prøv en større radius, eller kom tilbake til et sted du har vært før.';

  @override
  String hereNearestHint(String distance) {
    return 'Det nærmeste minnet ditt er $distance unna.';
  }

  @override
  String get photoDetailRephoto => 'Fotografer på nytt';

  @override
  String get photoDetailRephotoSoon =>
      'Fotografering på nytt kommer i en senere versjon.';

  @override
  String photoDetailOf(int index, int total) {
    return '$index av $total';
  }

  @override
  String get debugLocationTitle => 'Testposisjon';

  @override
  String get debugLocationBody =>
      'Lat som du er et annet sted, så Her-skjermen kan testes fra sofaen.';

  @override
  String get debugLocationLatitude => 'Breddegrad';

  @override
  String get debugLocationLongitude => 'Lengdegrad';

  @override
  String get debugLocationApply => 'Dra dit';

  @override
  String get debugLocationClear => 'Bruk den ekte posisjonen';

  @override
  String get debugLocationActive => 'Testposisjon aktiv';

  @override
  String get commonClose => 'Lukk';

  @override
  String get placesEmptyTitle => 'Ingen steder ennå';

  @override
  String get placesEmptyBody =>
      'Steder dukker opp når bildene dine er indeksert.';

  @override
  String get placesSortLabel => 'Sorter etter';

  @override
  String get placesSortLongestAgo => 'Lengst siden';

  @override
  String get placesSortMostPhotos => 'Flest bilder';

  @override
  String get placesSortNearest => 'Nærmest';

  @override
  String placesMutedSection(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dempede steder',
      one: '$count dempet sted',
    );
    return '$_temp0';
  }

  @override
  String get placesMute => 'Demp';

  @override
  String get placesUnmute => 'Opphev demping';

  @override
  String get placesUseAutoRule => 'Avgjør automatisk';

  @override
  String get placesAutoMutedNote =>
      'Dempet automatisk – du er her de fleste dager';

  @override
  String get placesUserMutedNote => 'Dempet av deg';

  @override
  String get placesUserUnmutedNote => 'Holdt synlig av deg';

  @override
  String placesDayCount(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days dager',
      one: '$days dag',
    );
    return '$_temp0';
  }

  @override
  String get settingsPlaceNamesTitle => 'Gi steder navn';

  @override
  String get settingsPlaceNamesBody =>
      'Ber systemet gjøre om koordinatene til et sted til et navn. Den koordinaten går til Apple eller Google – det er det eneste i denne appen som forlater telefonen din. Av som standard; slår du det av igjen, glemmes alle navn.';

  @override
  String get settingsAutoMuteTitle => 'Demp hverdagssteder etter';

  @override
  String get settingsAutoMuteBody =>
      'Et sted med bilder fra så mange forskjellige dager er et sted du bor, ikke et sted du besøker.';

  @override
  String settingsAutoMuteValue(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days dager',
    );
    return '$_temp0';
  }

  @override
  String get settingsIndexTitle => 'Bildeindeks';

  @override
  String get settingsReindex => 'Indekser på nytt fra bunnen av';

  @override
  String get settingsPrivacyTitle => 'Det som blir på denne telefonen';

  @override
  String get settingsPrivacyBody =>
      'Bildene dine, hvor de ble tatt, og alt appen utleder av dem. Det finnes ingen konto, ingen server og ingen analyse.';

  @override
  String get placesName => 'Gi dette stedet et navn';

  @override
  String get placesRename => 'Gi nytt navn';

  @override
  String get placesNameDialogTitle => 'Navn på stedet';

  @override
  String get placesNameHint => 'Hos bestemor, vannet, kontoret…';

  @override
  String get placesNameSave => 'Lagre';

  @override
  String get placesNameClear => 'Fjern navn';

  @override
  String placesSummary(String age, String photos) {
    return '$age · $photos';
  }

  @override
  String get notificationTitle => 'Du har vært her før';

  @override
  String notificationBody(String age, String photos) {
    return 'Sist du var her: $age. $photos.';
  }

  @override
  String get alwaysLocationTitle => 'La Been Here følge med for deg';

  @override
  String get alwaysLocationBody =>
      'Med posisjon i bakgrunnen kan telefonen si fra til Been Here når du kommer til et sted du har fotografert før – og appen kan si det én gang, uten at du åpner noe.\n\nAppen følger deg aldri. Telefonen holder øye med en håndfull sirkler og vekker appen bare når du går inn i en av dem. Ingenting om hvor du er, forlater denne enheten.';

  @override
  String get alwaysLocationAction => 'Slå på ankomster';

  @override
  String get alwaysLocationLater => 'Ikke nå';

  @override
  String get alwaysLocationDeniedBody =>
      'Posisjon i bakgrunnen er slått av, så ankomster forblir stille. Alt annet fungerer som før; du kan slå den på i systeminnstillingene når du vil.';

  @override
  String get settingsArrivalsTitle => 'Ankomster';

  @override
  String get settingsArrivalsOn =>
      'Been Here sier fra når du kommer til et sted du ikke har fotografert på en stund.';

  @override
  String get settingsArrivalsOff =>
      'Been Here er stille. Slår du dette på, blir du spurt om posisjon i bakgrunnen.';

  @override
  String get settingsMemoryAgeTitle => 'Nevn bare steder eldre enn';

  @override
  String settingsMemoryAgeValue(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days dager',
      one: '$days dag',
    );
    return '$_temp0';
  }

  @override
  String get settingsPlaceCooldownTitle => 'Hold deretter stedet stille i';

  @override
  String get settingsDailyLimitTitle => 'Og si ingenting i det hele tatt i';

  @override
  String settingsDailyLimitValue(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours timer',
      one: '$hours time',
      zero: 'ingen tid',
    );
    return '$_temp0';
  }

  @override
  String get settingsThresholdsBody =>
      'Senk disse for å prøve ankomster uten å vente et halvt år.';

  @override
  String get placesTestArrival => 'Test en ankomst her';

  @override
  String get arrivalTestNotified => 'Varsel sendt';

  @override
  String get arrivalTestMuted => 'Ingenting: stedet er dempet';

  @override
  String get arrivalTestTooFewPhotos => 'Ingenting: for få bilder her';

  @override
  String get arrivalTestTooRecent => 'Ingenting: du fotograferte her for nylig';

  @override
  String get arrivalTestPlaceCooldown => 'Ingenting: dette stedet sa fra nylig';

  @override
  String get arrivalTestDailyLimit => 'Ingenting: noe annet sa fra i dag';

  @override
  String get alwaysLocationNeedsSettingsBody =>
      'Telefonen beholdt posisjon på «Ved bruk av appen». iOS tilbyr ikke valget igjen inne fra en app, så posisjon i bakgrunnen må settes til «Alltid» i systeminnstillingene – da begynner ankomster å virke.';

  @override
  String get commonOpenSettings => 'Åpne innstillinger';

  @override
  String get settingsArrivalsPending =>
      'Nesten: posisjon står fortsatt på «Ved bruk av appen». Sett den til «Alltid» i systeminnstillingene.';

  @override
  String get placesSortVisits => 'Flest besøk';

  @override
  String get placesSortAscending => 'Motsatt rekkefølge';

  @override
  String placesVisitCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count besøk',
      one: '$count besøk',
      zero: 'aldri',
    );
    return '$_temp0';
  }

  @override
  String get settingsMapTitle => 'Vis steder på et kart';

  @override
  String get settingsMapBody =>
      'Kartfliser lastes ned fra OpenStreetMap mens du panorerer og zoomer, så den serveren ser hele tiden hvor du ser. I motsetning til et stedsnavn, som spørres om én gang, fortsetter dette så lenge kartet er åpent. Av som standard.';

  @override
  String get placesShowMap => 'Kart';

  @override
  String get placesShowList => 'Liste';

  @override
  String get placesMapAttribution => '© OpenStreetMap-bidragsytere';

  @override
  String get rephotoOverlay => 'Ton';

  @override
  String get rephotoEdges => 'Omriss';

  @override
  String get rephotoCapture => 'Ta det';

  @override
  String get rephotoSaved => 'Lagret i bildene dine';

  @override
  String get rephotoNotSaved =>
      'Kunne ikke lagre det. Å legge til bilder kan være slått av.';

  @override
  String get rephotoNoCamera =>
      'Ingen kamera tilgjengelig. Been Here trenger kameraet for å ta et bilde som svarer på et gammelt.';

  @override
  String get rephotoThenAndNow => 'Da og nå';

  @override
  String get rephotoShare => 'Del';

  @override
  String get rephotoThen => 'Da';

  @override
  String get rephotoNow => 'Nå';

  @override
  String get rephotoShareFailed => 'Kunne ikke lage bildet som skal deles.';

  @override
  String get onboardingSkip => 'Hopp over';

  @override
  String get onboardingNext => 'Neste';

  @override
  String get onboardingWhatTitle => 'Bilder fra stedet du står på';

  @override
  String get onboardingWhatBody =>
      'Kom til et sted du har fotografert før, så viser Been Here deg hva du tok der – besøk for besøk, lengst siden først.';

  @override
  String get onboardingPrivacyTitle => 'Ingenting forlater telefonen din';

  @override
  String get onboardingPrivacyBody =>
      'Ingen konto, ingen server, ingen analyse. Been Here leser bildebiblioteket ditt på enheten og holder en liten indeks ved siden av. Bildene dine, og hvor de ble tatt, blir der de er.';

  @override
  String get onboardingPrivacyFootnote =>
      'To ting kan nå nettet, og begge er av til du slår dem på: stedsnavn og kartet.';

  @override
  String get onboardingPhotosTitle => 'Den trenger bildene dine';

  @override
  String get onboardingPhotosBody =>
      'Been Here noterer hvilket bilde som ble tatt hvor. Den kopierer eller flytter aldri noe – den husker ID-er og koordinater, og leser selve bildene bare når den viser deg dem.';

  @override
  String get onboardingPhotosAction => 'Tillat bilder';

  @override
  String get onboardingDone => 'Start';

  @override
  String get settingsAboutTitle => 'Om';

  @override
  String settingsVersion(String version, String build) {
    return 'Versjon $version ($build)';
  }

  @override
  String get settingsSourceTitle => 'Kildekode';

  @override
  String get settingsShowIntro => 'Vis introduksjonen igjen';

  @override
  String photoSemanticLabel(String date) {
    return 'Bilde fra $date';
  }

  @override
  String photoOpenSemanticLabel(int index, int total, String date) {
    return 'Bilde $index av $total, $date';
  }

  @override
  String get placesActionsLabel => 'Hva du vil gjøre med dette stedet';

  @override
  String get radiusSemanticLabel => 'Søkeradius';

  @override
  String get hereMapTitle => 'Her omkring';

  @override
  String get hereOpenInMaps => 'Åpne i Kart';

  @override
  String get hereBackToMe => 'Tilbake til der jeg er';

  @override
  String get herePlaceFallbackTitle => 'Et sted du kjenner';

  @override
  String get arrivalTestNearHome => 'For nær hjemmet til å være en nyhet.';

  @override
  String get settingsHomeRadiusTitle => 'Vær stille innenfor';

  @override
  String settingsHomeRadiusValue(num km) {
    String _temp0 = intl.Intl.pluralLogic(
      km,
      locale: localeName,
      other: '$km km fra hjemmet',
      one: '$km km fra hjemmet',
      zero: 'ingen avstand – aldri stille',
    );
    return '$_temp0';
  }

  @override
  String get settingsHomeRadiusBody =>
      'Hverdagen foregår nær hjemmet, og det er der en telefon som kommenterer den, er minst velkommen. Steder nærmere enn dette overvåkes aldri.';

  @override
  String get settingsQuietTitle => 'Hvorfor det er stille';

  @override
  String settingsQuietWatching(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Overvåker $count steder',
      one: 'Overvåker $count sted',
      zero: 'Overvåker ingen steder',
    );
    return '$_temp0';
  }

  @override
  String settingsQuietNearest(String distance) {
    return 'Nærmeste overvåkede sted: $distance';
  }

  @override
  String get settingsQuietNothingWatched =>
      'Ingenting overvåkes, så ingen ankomst kan komme.';

  @override
  String settingsQuietLastNotified(String when) {
    return 'Siste varsel: $when';
  }

  @override
  String get settingsQuietNever => 'aldri';

  @override
  String settingsQuietBreakdown(int total, String reasons) {
    return 'Av $total steder: $reasons';
  }

  @override
  String settingsQuietReasonMuted(Object count) {
    return '$count dempet';
  }

  @override
  String settingsQuietReasonNearHome(Object count) {
    return '$count nær hjemmet';
  }

  @override
  String settingsQuietReasonTooFewPhotos(Object count) {
    return '$count med for få bilder';
  }

  @override
  String settingsQuietReasonTooRecent(Object count) {
    return '$count fotografert for nylig';
  }

  @override
  String settingsQuietReasonPlaceCooldown(Object count) {
    return '$count fortsatt i pause';
  }

  @override
  String settingsQuietReasonEligible(Object count) {
    return '$count verdt å overvåke';
  }

  @override
  String get ageSemanticLabel => 'Bildenes alder';

  @override
  String get ageStopNow => 'nå';

  @override
  String get ageStopDay => '1 dag';

  @override
  String get ageStop3Days => '3 dager';

  @override
  String get ageStopWeek => '1 uke';

  @override
  String get ageStop2Weeks => '2 uker';

  @override
  String get ageStopMonth => '1 måned';

  @override
  String get ageStop3Months => '3 måneder';

  @override
  String get ageStop6Months => '6 måneder';

  @override
  String get ageStopYear => '1 år';

  @override
  String get ageStop2Years => '2 år';

  @override
  String get ageStop5Years => '5 år';

  @override
  String get ageStop10Years => '10 år';

  @override
  String get ageStopAll => 'alle';

  @override
  String get ageWindowAll => 'Alle bilder';

  @override
  String ageWindowNewerThan(String stop) {
    return 'Opptil $stop gamle';
  }

  @override
  String ageWindowOlderThan(String stop) {
    return 'Eldre enn $stop';
  }

  @override
  String ageWindowBetween(String newest, String oldest) {
    return '$newest til $oldest gamle';
  }

  @override
  String get ageWindowReset => 'Tilbakestill';

  @override
  String mapDotCountCapped(int count) {
    return '$count+ bilder';
  }
}
