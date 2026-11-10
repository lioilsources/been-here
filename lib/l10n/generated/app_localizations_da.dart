// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Danish (`da`).
class AppLocalizationsDa extends AppLocalizations {
  AppLocalizationsDa([String locale = 'da']) : super(locale);

  @override
  String get appTitle => 'Been Here';

  @override
  String get hereTabLabel => 'Her';

  @override
  String get placesTabLabel => 'Steder';

  @override
  String get settingsTabLabel => 'Indstillinger';

  @override
  String get hereEmptyTitle => 'Du har ikke taget billeder her';

  @override
  String get hereEmptyBody =>
      'Gør søgeradiussen større, eller kom tilbage til et sted, du har været før.';

  @override
  String get hereNotIndexedTitle => 'Intet indekseret endnu';

  @override
  String get hereNotIndexedBody =>
      'Been Here skal læse dit fotobibliotek én gang for at vide, hvor du har været. Intet forlader din telefon.';

  @override
  String get indexStartAction => 'Indekser mine billeder';

  @override
  String get indexPermissionTitle => 'Been Here skal bruge dine billeder';

  @override
  String get indexPermissionBody =>
      'Den læser kun, hvor og hvornår hvert billede blev taget, og gemmer det på denne telefon.';

  @override
  String get indexPermissionAction => 'Giv adgang';

  @override
  String get indexPermissionDeniedTitle => 'Adgang til billeder er slået fra';

  @override
  String get indexPermissionDeniedBody =>
      'Uden den kan Been Here ikke vise dig noget. Du kan slå den til i systemindstillingerne.';

  @override
  String get indexLimitedAccessNotice =>
      'Du har kun delt udvalgte billeder, så Been Here kan kun se dem. Med fuld adgang kan den finde alle de steder, du har været.';

  @override
  String get indexRunningTitle => 'Læser dit fotobibliotek';

  @override
  String indexRunningProgress(int processed, int total) {
    return '$processed af $total';
  }

  @override
  String get indexFailedTitle => 'Indekseringen stoppede';

  @override
  String get indexFailedBody =>
      'Noget gik galt undervejs. Prøver du igen, fortsætter den, hvor den slap.';

  @override
  String indexedPhotoCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count billeder indekseret',
      one: '$count billede indekseret',
      zero: 'Ingen billeder indekseret',
    );
    return '$_temp0';
  }

  @override
  String indexedLocationCoverage(int percent) {
    return '$percent % af dem har en placering';
  }

  @override
  String get commonLoading => 'Indlæser…';

  @override
  String get commonRetry => 'Prøv igen';

  @override
  String get commonCancel => 'Annuller';

  @override
  String hereRadiusLabel(String radius) {
    return 'Inden for $radius';
  }

  @override
  String herePhotoCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count billeder',
      one: '$count billede',
      zero: 'Ingen billeder',
    );
    return '$_temp0';
  }

  @override
  String hereVisitCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count besøg',
      one: '$count besøg',
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
      other: 'For $days dage siden',
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
      'Been Here sammenligner din position med de steder, dine billeder blev taget. Sammenligningen sker på denne telefon.';

  @override
  String get locationPermissionAction => 'Brug min placering';

  @override
  String get locationDeniedTitle => 'Placering er slået fra';

  @override
  String get locationDeniedBody =>
      'Uden den kan appen ikke se, hvad du har her. Du kan slå den til i systemindstillingerne.';

  @override
  String get locationUnavailableTitle => 'Ingen position endnu';

  @override
  String get locationUnavailableBody =>
      'Din telefon har ikke fundet ud af, hvor den er. Indendørs kan det tage et øjeblik.';

  @override
  String get locationServicesDisabledTitle =>
      'Lokalitetstjenester er slået fra';

  @override
  String get locationServicesDisabledBody =>
      'Slå dem til i systemindstillingerne, og kom tilbage.';

  @override
  String get hereNothingTitle => 'Du har ikke taget billeder her';

  @override
  String get hereNothingBody =>
      'Prøv en større radius, eller kom tilbage til et sted, du har været før.';

  @override
  String hereNearestHint(String distance) {
    return 'Dit nærmeste minde er $distance væk.';
  }

  @override
  String get photoDetailRephoto => 'Genfotografér';

  @override
  String get photoDetailRephotoSoon =>
      'Genfotografering kommer i en senere version.';

  @override
  String photoDetailOf(int index, int total) {
    return '$index af $total';
  }

  @override
  String get debugLocationTitle => 'Testplacering';

  @override
  String get debugLocationBody =>
      'Lad som om, du er et andet sted, så Her-skærmen kan testes fra sofaen.';

  @override
  String get debugLocationLatitude => 'Breddegrad';

  @override
  String get debugLocationLongitude => 'Længdegrad';

  @override
  String get debugLocationApply => 'Gå derhen';

  @override
  String get debugLocationClear => 'Brug den rigtige placering';

  @override
  String get debugLocationActive => 'Testplacering aktiv';

  @override
  String get commonClose => 'Luk';

  @override
  String get placesEmptyTitle => 'Ingen steder endnu';

  @override
  String get placesEmptyBody =>
      'Steder dukker op, når dine billeder er indekseret.';

  @override
  String get placesSortLabel => 'Sortér efter';

  @override
  String get placesSortLongestAgo => 'Længst siden';

  @override
  String get placesSortMostPhotos => 'Flest billeder';

  @override
  String get placesSortNearest => 'Nærmest';

  @override
  String placesMutedSection(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count lydløse steder',
      one: '$count lydløst sted',
    );
    return '$_temp0';
  }

  @override
  String get placesMute => 'Gør lydløs';

  @override
  String get placesUnmute => 'Slå lyd til';

  @override
  String get placesUseAutoRule => 'Afgør automatisk';

  @override
  String get placesAutoMutedNote =>
      'Lydløs automatisk – du er her de fleste dage';

  @override
  String get placesUserMutedNote => 'Gjort lydløs af dig';

  @override
  String get placesUserUnmutedNote => 'Holdt synlig af dig';

  @override
  String placesDayCount(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days dage',
      one: '$days dag',
    );
    return '$_temp0';
  }

  @override
  String get settingsPlaceNamesTitle => 'Navngiv steder';

  @override
  String get settingsPlaceNamesBody =>
      'Beder systemet om at gøre et steds koordinater til et navn. Den koordinat sendes til Apple eller Google – det er det eneste i denne app, der forlader din telefon. Slået fra som standard; slår du det fra igen, glemmes alle navne.';

  @override
  String get settingsAutoMuteTitle => 'Gør hverdagssteder lydløse efter';

  @override
  String get settingsAutoMuteBody =>
      'Et sted med billeder fra så mange forskellige dage er et sted, du bor, ikke et sted, du besøger.';

  @override
  String settingsAutoMuteValue(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days dage',
    );
    return '$_temp0';
  }

  @override
  String get settingsIndexTitle => 'Billedindeks';

  @override
  String get settingsReindex => 'Indekser igen fra bunden';

  @override
  String get settingsPrivacyTitle => 'Det, der bliver på denne telefon';

  @override
  String get settingsPrivacyBody =>
      'Dine billeder, hvor de blev taget, og alt, hvad appen udleder af dem. Der er ingen konto, ingen server og ingen analyse.';

  @override
  String get placesName => 'Navngiv dette sted';

  @override
  String get placesRename => 'Omdøb';

  @override
  String get placesNameDialogTitle => 'Stedets navn';

  @override
  String get placesNameHint => 'Hos mormor, søen, kontoret…';

  @override
  String get placesNameSave => 'Gem';

  @override
  String get placesNameClear => 'Fjern navn';

  @override
  String placesSummary(String age, String photos) {
    return '$age · $photos';
  }

  @override
  String get notificationTitle => 'Du har været her før';

  @override
  String notificationBody(String age, String photos) {
    return 'Sidst du var her: $age. $photos.';
  }

  @override
  String get alwaysLocationTitle => 'Lad Been Here holde øje for dig';

  @override
  String get alwaysLocationBody =>
      'Med placering i baggrunden kan din telefon give Been Here besked, når du ankommer et sted, du har fotograferet før – og appen kan sige det én gang, uden at du åbner noget.\n\nAppen følger dig aldrig. Din telefon holder øje med en håndfuld cirkler og vækker kun appen, når du går ind i en af dem. Intet om, hvor du er, forlader denne enhed.';

  @override
  String get alwaysLocationAction => 'Slå ankomster til';

  @override
  String get alwaysLocationLater => 'Ikke nu';

  @override
  String get alwaysLocationDeniedBody =>
      'Placering i baggrunden er slået fra, så ankomster forbliver stille. Alt andet virker som før; du kan slå den til i systemindstillingerne, når du vil.';

  @override
  String get settingsArrivalsTitle => 'Ankomster';

  @override
  String get settingsArrivalsOn =>
      'Been Here siger til, når du ankommer et sted, du ikke har fotograferet i et stykke tid.';

  @override
  String get settingsArrivalsOff =>
      'Been Here forbliver stille. Slår du det til, bliver du spurgt om placering i baggrunden.';

  @override
  String get settingsMemoryAgeTitle => 'Nævn kun steder ældre end';

  @override
  String settingsMemoryAgeValue(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days dage',
      one: '$days dag',
    );
    return '$_temp0';
  }

  @override
  String get settingsPlaceCooldownTitle => 'Hold derefter stedet stille i';

  @override
  String get settingsDailyLimitTitle => 'Og sig slet ingenting i';

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
      'Sænk disse for at prøve ankomster uden at vente et halvt år.';

  @override
  String get placesTestArrival => 'Test en ankomst her';

  @override
  String get arrivalTestNotified => 'Notifikation sendt';

  @override
  String get arrivalTestMuted => 'Intet: stedet er lydløst';

  @override
  String get arrivalTestTooFewPhotos => 'Intet: for få billeder her';

  @override
  String get arrivalTestTooRecent => 'Intet: du har fotograferet her for nylig';

  @override
  String get arrivalTestPlaceCooldown =>
      'Intet: dette sted har sagt noget for nylig';

  @override
  String get arrivalTestDailyLimit => 'Intet: noget andet har sagt noget i dag';

  @override
  String get alwaysLocationNeedsSettingsBody =>
      'Din telefon beholdt placering på \"Når appen bruges\". iOS tilbyder ikke valget igen inde fra en app, så placering i baggrunden skal sættes til \"Altid\" i systemindstillingerne – så begynder ankomster at virke.';

  @override
  String get commonOpenSettings => 'Åbn indstillinger';

  @override
  String get settingsArrivalsPending =>
      'Næsten: placering står stadig på \"Når appen bruges\". Sæt den til \"Altid\" i systemindstillingerne.';

  @override
  String get placesSortVisits => 'Flest besøg';

  @override
  String get placesSortAscending => 'Omvendt rækkefølge';

  @override
  String placesVisitCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count besøg',
      one: '$count besøg',
      zero: 'aldrig',
    );
    return '$_temp0';
  }

  @override
  String get settingsMapTitle => 'Vis steder på et kort';

  @override
  String get settingsMapBody =>
      'Kortfelter hentes fra OpenStreetMap, mens du panorerer og zoomer, så den server ser løbende, hvor du kigger. I modsætning til et stednavn, som spørges om én gang, fortsætter det, så længe kortet er åbent. Slået fra som standard.';

  @override
  String get placesShowMap => 'Kort';

  @override
  String get placesShowList => 'Liste';

  @override
  String get placesMapAttribution => '© OpenStreetMap-bidragydere';

  @override
  String get rephotoOverlay => 'Overtoning';

  @override
  String get rephotoEdges => 'Omrids';

  @override
  String get rephotoCapture => 'Tag det';

  @override
  String get rephotoSaved => 'Gemt i dine billeder';

  @override
  String get rephotoNotSaved =>
      'Kunne ikke gemme det. Tilføjelse af billeder er måske slået fra.';

  @override
  String get rephotoNoCamera =>
      'Intet kamera tilgængeligt. Been Here skal bruge kameraet til at tage et billede, der svarer på et gammelt.';

  @override
  String get rephotoThenAndNow => 'Dengang og nu';

  @override
  String get rephotoShare => 'Del';

  @override
  String get rephotoThen => 'Dengang';

  @override
  String get rephotoNow => 'Nu';

  @override
  String get rephotoShareFailed => 'Kunne ikke lave billedet, der skal deles.';

  @override
  String get onboardingSkip => 'Spring over';

  @override
  String get onboardingNext => 'Næste';

  @override
  String get onboardingWhatTitle => 'Billeder fra det sted, du står';

  @override
  String get onboardingWhatBody =>
      'Ankom et sted, du har fotograferet før, og Been Here viser dig, hvad du tog der – besøg for besøg, længst siden først.';

  @override
  String get onboardingPrivacyTitle => 'Intet forlader din telefon';

  @override
  String get onboardingPrivacyBody =>
      'Ingen konto, ingen server, ingen analyse. Been Here læser dit fotobibliotek på enheden og holder et lille indeks ved siden af. Dine billeder, og hvor de blev taget, bliver, hvor de er.';

  @override
  String get onboardingPrivacyFootnote =>
      'To ting kan nå netværket, og begge er slået fra, indtil du slår dem til: stednavne og kortet.';

  @override
  String get onboardingPhotosTitle => 'Den skal bruge dine billeder';

  @override
  String get onboardingPhotosBody =>
      'Been Here noterer, hvilket billede der blev taget hvor. Den kopierer eller flytter aldrig noget – den husker id\'er og koordinater og læser kun selve billederne, når den viser dig dem.';

  @override
  String get onboardingPhotosAction => 'Tillad billeder';

  @override
  String get onboardingDone => 'Start';

  @override
  String get settingsAboutTitle => 'Om';

  @override
  String settingsVersion(String version, String build) {
    return 'Version $version ($build)';
  }

  @override
  String get settingsSourceTitle => 'Kildekode';

  @override
  String get settingsShowIntro => 'Vis introduktionen igen';

  @override
  String photoSemanticLabel(String date) {
    return 'Billede fra $date';
  }

  @override
  String photoOpenSemanticLabel(int index, int total, String date) {
    return 'Billede $index af $total, $date';
  }

  @override
  String get placesActionsLabel => 'Hvad skal der ske med dette sted';

  @override
  String get radiusSemanticLabel => 'Søgeradius';

  @override
  String get hereMapTitle => 'Her omkring';

  @override
  String get hereOpenInMaps => 'Åbn i Kort';

  @override
  String get hereBackToMe => 'Tilbage til, hvor jeg er';

  @override
  String get herePlaceFallbackTitle => 'Et sted, du kender';

  @override
  String get arrivalTestNearHome => 'For tæt på hjemmet til at være en nyhed.';

  @override
  String get settingsHomeRadiusTitle => 'Vær stille inden for';

  @override
  String settingsHomeRadiusValue(num km) {
    String _temp0 = intl.Intl.pluralLogic(
      km,
      locale: localeName,
      other: '$km km fra hjemmet',
      one: '$km km fra hjemmet',
      zero: 'ingen afstand – aldrig stille',
    );
    return '$_temp0';
  }

  @override
  String get settingsHomeRadiusBody =>
      'Hverdagen foregår tæt på hjemmet, og det er dér, en telefon, der kommenterer den, er mindst velkommen. Steder tættere på end dette holdes der aldrig øje med.';

  @override
  String get settingsQuietTitle => 'Hvorfor der er stille';

  @override
  String settingsQuietWatching(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Holder øje med $count steder',
      one: 'Holder øje med $count sted',
      zero: 'Holder øje med ingen steder',
    );
    return '$_temp0';
  }

  @override
  String settingsQuietNearest(String distance) {
    return 'Nærmeste overvågede sted: $distance';
  }

  @override
  String get settingsQuietNothingWatched =>
      'Der holdes ikke øje med noget, så der kan ikke komme nogen ankomst.';

  @override
  String settingsQuietLastNotified(String when) {
    return 'Seneste notifikation: $when';
  }

  @override
  String get settingsQuietNever => 'aldrig';

  @override
  String settingsQuietBreakdown(int total, String reasons) {
    return 'Af $total steder: $reasons';
  }

  @override
  String settingsQuietReasonMuted(Object count) {
    return '$count lydløse';
  }

  @override
  String settingsQuietReasonNearHome(Object count) {
    return '$count tæt på hjemmet';
  }

  @override
  String settingsQuietReasonTooFewPhotos(Object count) {
    return '$count med for få billeder';
  }

  @override
  String settingsQuietReasonTooRecent(Object count) {
    return '$count fotograferet for nylig';
  }

  @override
  String settingsQuietReasonPlaceCooldown(Object count) {
    return '$count stadig i pause';
  }

  @override
  String settingsQuietReasonEligible(Object count) {
    return '$count værd at holde øje med';
  }

  @override
  String get ageSemanticLabel => 'Billedernes alder';

  @override
  String get ageStopNow => 'nu';

  @override
  String get ageStopDay => '1 dag';

  @override
  String get ageStop3Days => '3 dage';

  @override
  String get ageStopWeek => '1 uge';

  @override
  String get ageStop2Weeks => '2 uger';

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
  String get ageWindowAll => 'Alle billeder';

  @override
  String ageWindowNewerThan(String stop) {
    return 'Op til $stop gamle';
  }

  @override
  String ageWindowOlderThan(String stop) {
    return 'Ældre end $stop';
  }

  @override
  String ageWindowBetween(String newest, String oldest) {
    return '$newest til $oldest gamle';
  }

  @override
  String get ageWindowReset => 'Nulstil';

  @override
  String mapDotCountCapped(int count) {
    return '$count+ billeder';
  }
}
