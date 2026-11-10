// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Swedish (`sv`).
class AppLocalizationsSv extends AppLocalizations {
  AppLocalizationsSv([String locale = 'sv']) : super(locale);

  @override
  String get appTitle => 'Been Here';

  @override
  String get hereTabLabel => 'Här';

  @override
  String get placesTabLabel => 'Platser';

  @override
  String get settingsTabLabel => 'Inställningar';

  @override
  String get hereEmptyTitle => 'Du har inte tagit några bilder här';

  @override
  String get hereEmptyBody =>
      'Öka sökradien, eller kom tillbaka till ett ställe där du har varit förut.';

  @override
  String get hereNotIndexedTitle => 'Inget indexerat än';

  @override
  String get hereNotIndexedBody =>
      'Been Here behöver läsa ditt bildbibliotek en gång för att veta var du har varit. Inget lämnar din telefon.';

  @override
  String get indexStartAction => 'Indexera mina bilder';

  @override
  String get indexPermissionTitle => 'Been Here behöver dina bilder';

  @override
  String get indexPermissionBody =>
      'Den läser bara var och när varje bild togs, och behåller det på den här telefonen.';

  @override
  String get indexPermissionAction => 'Ge åtkomst';

  @override
  String get indexPermissionDeniedTitle => 'Bildåtkomst är avstängd';

  @override
  String get indexPermissionDeniedBody =>
      'Utan den kan Been Here inte visa dig något. Du kan slå på den i systeminställningarna.';

  @override
  String get indexLimitedAccessNotice =>
      'Du har bara delat utvalda bilder, så Been Here ser bara dem. Med full åtkomst kan den hitta varje plats du har varit på.';

  @override
  String get indexRunningTitle => 'Läser ditt bildbibliotek';

  @override
  String indexRunningProgress(int processed, int total) {
    return '$processed av $total';
  }

  @override
  String get indexFailedTitle => 'Indexeringen avbröts';

  @override
  String get indexFailedBody =>
      'Något gick fel på vägen. Försöker du igen fortsätter den där den slutade.';

  @override
  String indexedPhotoCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bilder indexerade',
      one: '$count bild indexerad',
      zero: 'Inga bilder indexerade',
    );
    return '$_temp0';
  }

  @override
  String indexedLocationCoverage(int percent) {
    return '$percent % av dem har en plats';
  }

  @override
  String get commonLoading => 'Läser in…';

  @override
  String get commonRetry => 'Försök igen';

  @override
  String get commonCancel => 'Avbryt';

  @override
  String hereRadiusLabel(String radius) {
    return 'Inom $radius';
  }

  @override
  String herePhotoCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bilder',
      one: '$count bild',
      zero: 'Inga bilder',
    );
    return '$_temp0';
  }

  @override
  String hereVisitCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count besök',
      one: '$count besök',
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
      other: 'För $days dagar sedan',
    );
    return '$_temp0';
  }

  @override
  String ageMonthsAgo(int months) {
    String _temp0 = intl.Intl.pluralLogic(
      months,
      locale: localeName,
      other: 'För $months månader sedan',
      one: 'För en månad sedan',
    );
    return '$_temp0';
  }

  @override
  String ageYearsAgo(int years) {
    String _temp0 = intl.Intl.pluralLogic(
      years,
      locale: localeName,
      other: 'För $years år sedan',
      one: 'För ett år sedan',
    );
    return '$_temp0';
  }

  @override
  String get locationPermissionTitle => 'Var är du?';

  @override
  String get locationPermissionBody =>
      'Been Here jämför din position med platserna där dina bilder togs. Jämförelsen görs på den här telefonen.';

  @override
  String get locationPermissionAction => 'Använd min plats';

  @override
  String get locationDeniedTitle => 'Plats är avstängd';

  @override
  String get locationDeniedBody =>
      'Utan den kan appen inte veta vad du har här. Du kan slå på den i systeminställningarna.';

  @override
  String get locationUnavailableTitle => 'Ingen position än';

  @override
  String get locationUnavailableBody =>
      'Telefonen har inte räknat ut var den är. Inomhus kan det ta en stund.';

  @override
  String get locationServicesDisabledTitle => 'Platstjänster är avstängda';

  @override
  String get locationServicesDisabledBody =>
      'Slå på dem i systeminställningarna och kom tillbaka.';

  @override
  String get hereNothingTitle => 'Du har inte tagit några bilder här';

  @override
  String get hereNothingBody =>
      'Prova en större radie, eller kom tillbaka till ett ställe där du har varit förut.';

  @override
  String hereNearestHint(String distance) {
    return 'Ditt närmaste minne är $distance bort.';
  }

  @override
  String get photoDetailRephoto => 'Fota igen';

  @override
  String get photoDetailRephotoSoon => 'Fota igen kommer i en senare version.';

  @override
  String photoDetailOf(int index, int total) {
    return '$index av $total';
  }

  @override
  String get debugLocationTitle => 'Testplats';

  @override
  String get debugLocationBody =>
      'Låtsas vara någon annanstans, så att Här-skärmen kan testas från soffan.';

  @override
  String get debugLocationLatitude => 'Latitud';

  @override
  String get debugLocationLongitude => 'Longitud';

  @override
  String get debugLocationApply => 'Åk dit';

  @override
  String get debugLocationClear => 'Använd den riktiga platsen';

  @override
  String get debugLocationActive => 'Testplats aktiv';

  @override
  String get commonClose => 'Stäng';

  @override
  String get placesEmptyTitle => 'Inga platser än';

  @override
  String get placesEmptyBody =>
      'Platser dyker upp när dina bilder har indexerats.';

  @override
  String get placesSortLabel => 'Sortera efter';

  @override
  String get placesSortLongestAgo => 'Längst sedan';

  @override
  String get placesSortMostPhotos => 'Flest bilder';

  @override
  String get placesSortNearest => 'Närmast';

  @override
  String placesMutedSection(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tystade platser',
      one: '$count tystad plats',
    );
    return '$_temp0';
  }

  @override
  String get placesMute => 'Tysta';

  @override
  String get placesUnmute => 'Sluta tysta';

  @override
  String get placesUseAutoRule => 'Avgör automatiskt';

  @override
  String get placesAutoMutedNote =>
      'Tystad automatiskt – du är här de flesta dagar';

  @override
  String get placesUserMutedNote => 'Tystad av dig';

  @override
  String get placesUserUnmutedNote => 'Hålls synlig av dig';

  @override
  String placesDayCount(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days dagar',
      one: '$days dag',
    );
    return '$_temp0';
  }

  @override
  String get settingsPlaceNamesTitle => 'Namnge platser';

  @override
  String get settingsPlaceNamesBody =>
      'Ber systemet göra om en plats koordinater till ett namn. Den koordinaten skickas till Apple eller Google – det är det enda i appen som lämnar din telefon. Av som standard; stänger du av det igen glöms alla namn.';

  @override
  String get settingsAutoMuteTitle => 'Tysta vardagsplatser efter';

  @override
  String get settingsAutoMuteBody =>
      'En plats med bilder från så många olika dagar är en plats där du bor, inte en plats du besöker.';

  @override
  String settingsAutoMuteValue(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days dagar',
    );
    return '$_temp0';
  }

  @override
  String get settingsIndexTitle => 'Bildindex';

  @override
  String get settingsReindex => 'Indexera om från början';

  @override
  String get settingsPrivacyTitle => 'Det som stannar på telefonen';

  @override
  String get settingsPrivacyBody =>
      'Dina bilder, var de togs och allt appen räknar ut av dem. Det finns inget konto, ingen server och ingen analys.';

  @override
  String get placesName => 'Namnge den här platsen';

  @override
  String get placesRename => 'Byt namn';

  @override
  String get placesNameDialogTitle => 'Platsens namn';

  @override
  String get placesNameHint => 'Hos mormor, sjön, kontoret…';

  @override
  String get placesNameSave => 'Spara';

  @override
  String get placesNameClear => 'Ta bort namn';

  @override
  String placesSummary(String age, String photos) {
    return '$age · $photos';
  }

  @override
  String get notificationTitle => 'Du har varit här förut';

  @override
  String notificationBody(String age, String photos) {
    return 'Senast du var här: $age. $photos.';
  }

  @override
  String get alwaysLocationTitle => 'Låt Been Here hålla utkik åt dig';

  @override
  String get alwaysLocationBody =>
      'Med plats i bakgrunden kan telefonen säga till Been Here när du kommer till ett ställe du har fotograferat förut – och appen kan säga det en gång, utan att du öppnar något.\n\nAppen följer dig aldrig. Telefonen bevakar en handfull cirklar och väcker appen bara när du går in i en av dem. Inget om var du är lämnar den här enheten.';

  @override
  String get alwaysLocationAction => 'Slå på ankomster';

  @override
  String get alwaysLocationLater => 'Inte nu';

  @override
  String get alwaysLocationDeniedBody =>
      'Plats i bakgrunden är avstängd, så ankomster förblir tysta. Allt annat fungerar som förut; du kan slå på den i systeminställningarna när du vill.';

  @override
  String get settingsArrivalsTitle => 'Ankomster';

  @override
  String get settingsArrivalsOn =>
      'Been Here säger till när du kommer till ett ställe du inte har fotograferat på ett tag.';

  @override
  String get settingsArrivalsOff =>
      'Been Here är tyst. Slår du på det frågar appen om plats i bakgrunden.';

  @override
  String get settingsMemoryAgeTitle => 'Nämn bara platser äldre än';

  @override
  String settingsMemoryAgeValue(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days dagar',
      one: '$days dag',
    );
    return '$_temp0';
  }

  @override
  String get settingsPlaceCooldownTitle => 'Håll sedan platsen tyst i';

  @override
  String get settingsDailyLimitTitle => 'Och säg ingenting alls i';

  @override
  String settingsDailyLimitValue(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours timmar',
      one: '$hours timme',
      zero: 'ingen tid',
    );
    return '$_temp0';
  }

  @override
  String get settingsThresholdsBody =>
      'Sänk de här för att prova ankomster utan att vänta ett halvår.';

  @override
  String get placesTestArrival => 'Testa en ankomst här';

  @override
  String get arrivalTestNotified => 'Notis skickad';

  @override
  String get arrivalTestMuted => 'Inget: platsen är tystad';

  @override
  String get arrivalTestTooFewPhotos => 'Inget: för få bilder här';

  @override
  String get arrivalTestTooRecent => 'Inget: du fotograferade här för nyligen';

  @override
  String get arrivalTestPlaceCooldown =>
      'Inget: den här platsen hördes av nyligen';

  @override
  String get arrivalTestDailyLimit => 'Inget: något annat hördes av i dag';

  @override
  String get alwaysLocationNeedsSettingsBody =>
      'Telefonen behöll platsen på ”När appen används”. iOS erbjuder inte valet igen inifrån en app, så plats i bakgrunden måste ställas på ”Alltid” i systeminställningarna – sedan fungerar ankomster.';

  @override
  String get commonOpenSettings => 'Öppna inställningar';

  @override
  String get settingsArrivalsPending =>
      'Nästan: platsen står fortfarande på ”När appen används”. Ställ den på ”Alltid” i systeminställningarna.';

  @override
  String get placesSortVisits => 'Flest besök';

  @override
  String get placesSortAscending => 'Omvänd ordning';

  @override
  String placesVisitCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count besök',
      one: '$count besök',
      zero: 'aldrig',
    );
    return '$_temp0';
  }

  @override
  String get settingsMapTitle => 'Visa platser på en karta';

  @override
  String get settingsMapBody =>
      'Kartrutor hämtas från OpenStreetMap när du panorerar och zoomar, så den servern ser hela tiden var du tittar. Till skillnad från ett platsnamn, som frågas efter en gång, pågår det så länge kartan är öppen. Av som standard.';

  @override
  String get placesShowMap => 'Karta';

  @override
  String get placesShowList => 'Lista';

  @override
  String get placesMapAttribution => '© OpenStreetMap-bidragsgivare';

  @override
  String get rephotoOverlay => 'Tona';

  @override
  String get rephotoEdges => 'Kontur';

  @override
  String get rephotoCapture => 'Ta den';

  @override
  String get rephotoSaved => 'Sparad i dina bilder';

  @override
  String get rephotoNotSaved =>
      'Kunde inte spara den. Att lägga till bilder kan vara avstängt.';

  @override
  String get rephotoNoCamera =>
      'Ingen kamera tillgänglig. Been Here behöver kameran för att ta en bild som svarar på en gammal.';

  @override
  String get rephotoThenAndNow => 'Då och nu';

  @override
  String get rephotoShare => 'Dela';

  @override
  String get rephotoThen => 'Då';

  @override
  String get rephotoNow => 'Nu';

  @override
  String get rephotoShareFailed => 'Kunde inte skapa bilden att dela.';

  @override
  String get onboardingSkip => 'Hoppa över';

  @override
  String get onboardingNext => 'Nästa';

  @override
  String get onboardingWhatTitle => 'Bilder från platsen där du står';

  @override
  String get onboardingWhatBody =>
      'Kom till ett ställe du har fotograferat förut så visar Been Here vad du tog där – besök för besök, längst sedan först.';

  @override
  String get onboardingPrivacyTitle => 'Inget lämnar din telefon';

  @override
  String get onboardingPrivacyBody =>
      'Inget konto, ingen server, ingen analys. Been Here läser ditt bildbibliotek på enheten och håller ett litet index bredvid. Dina bilder, och var de togs, stannar där de är.';

  @override
  String get onboardingPrivacyFootnote =>
      'Två saker kan nå nätet, och båda är av tills du slår på dem: platsnamn och kartan.';

  @override
  String get onboardingPhotosTitle => 'Den behöver dina bilder';

  @override
  String get onboardingPhotosBody =>
      'Been Here antecknar vilken bild som togs var. Den kopierar eller flyttar aldrig något – den minns id:n och koordinater och läser själva bilderna bara när den visar dem för dig.';

  @override
  String get onboardingPhotosAction => 'Tillåt bilder';

  @override
  String get onboardingDone => 'Börja';

  @override
  String get settingsAboutTitle => 'Om';

  @override
  String settingsVersion(String version, String build) {
    return 'Version $version ($build)';
  }

  @override
  String get settingsSourceTitle => 'Källkod';

  @override
  String get settingsShowIntro => 'Visa introduktionen igen';

  @override
  String photoSemanticLabel(String date) {
    return 'Bild från $date';
  }

  @override
  String photoOpenSemanticLabel(int index, int total, String date) {
    return 'Bild $index av $total, $date';
  }

  @override
  String get placesActionsLabel => 'Vad du vill göra med platsen';

  @override
  String get radiusSemanticLabel => 'Sökradie';

  @override
  String get hereMapTitle => 'Här omkring';

  @override
  String get hereOpenInMaps => 'Öppna i Kartor';

  @override
  String get hereBackToMe => 'Tillbaka till där jag är';

  @override
  String get herePlaceFallbackTitle => 'En plats du känner';

  @override
  String get arrivalTestNearHome => 'För nära hemmet för att vara en nyhet.';

  @override
  String get settingsHomeRadiusTitle => 'Var tyst inom';

  @override
  String settingsHomeRadiusValue(num km) {
    String _temp0 = intl.Intl.pluralLogic(
      km,
      locale: localeName,
      other: '$km km från hemmet',
      one: '$km km från hemmet',
      zero: 'inget avstånd – aldrig tyst',
    );
    return '$_temp0';
  }

  @override
  String get settingsHomeRadiusBody =>
      'Vardagen pågår nära hemmet, och det är där en telefon som kommenterar den är minst välkommen. Platser närmare än så bevakas aldrig.';

  @override
  String get settingsQuietTitle => 'Varför det är tyst';

  @override
  String settingsQuietWatching(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Bevakar $count platser',
      one: 'Bevakar $count plats',
      zero: 'Bevakar inga platser',
    );
    return '$_temp0';
  }

  @override
  String settingsQuietNearest(String distance) {
    return 'Närmaste bevakade plats: $distance';
  }

  @override
  String get settingsQuietNothingWatched =>
      'Inget bevakas, så ingen ankomst kan komma.';

  @override
  String settingsQuietLastNotified(String when) {
    return 'Senaste notis: $when';
  }

  @override
  String get settingsQuietNever => 'aldrig';

  @override
  String settingsQuietBreakdown(int total, String reasons) {
    return 'Av $total platser: $reasons';
  }

  @override
  String settingsQuietReasonMuted(Object count) {
    return '$count tystade';
  }

  @override
  String settingsQuietReasonNearHome(Object count) {
    return '$count nära hemmet';
  }

  @override
  String settingsQuietReasonTooFewPhotos(Object count) {
    return '$count med för få bilder';
  }

  @override
  String settingsQuietReasonTooRecent(Object count) {
    return '$count fotograferade för nyligen';
  }

  @override
  String settingsQuietReasonPlaceCooldown(Object count) {
    return '$count fortfarande i vila';
  }

  @override
  String settingsQuietReasonEligible(Object count) {
    return '$count värda att bevaka';
  }

  @override
  String get ageSemanticLabel => 'Bildernas ålder';

  @override
  String get ageStopNow => 'nu';

  @override
  String get ageStopDay => '1 dag';

  @override
  String get ageStop3Days => '3 dagar';

  @override
  String get ageStopWeek => '1 vecka';

  @override
  String get ageStop2Weeks => '2 veckor';

  @override
  String get ageStopMonth => '1 månad';

  @override
  String get ageStop3Months => '3 månader';

  @override
  String get ageStop6Months => '6 månader';

  @override
  String get ageStopYear => '1 år';

  @override
  String get ageStop2Years => '2 år';

  @override
  String get ageStop5Years => '5 år';

  @override
  String get ageStop10Years => '10 år';

  @override
  String get ageStopAll => 'alla';

  @override
  String get ageWindowAll => 'Alla bilder';

  @override
  String ageWindowNewerThan(String stop) {
    return 'Upp till $stop gamla';
  }

  @override
  String ageWindowOlderThan(String stop) {
    return 'Äldre än $stop';
  }

  @override
  String ageWindowBetween(String newest, String oldest) {
    return '$newest till $oldest gamla';
  }

  @override
  String get ageWindowReset => 'Återställ';

  @override
  String mapDotCountCapped(int count) {
    return '$count+ bilder';
  }
}
