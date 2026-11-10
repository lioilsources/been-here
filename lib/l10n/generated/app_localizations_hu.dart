// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hungarian (`hu`).
class AppLocalizationsHu extends AppLocalizations {
  AppLocalizationsHu([String locale = 'hu']) : super(locale);

  @override
  String get appTitle => 'Been Here';

  @override
  String get hereTabLabel => 'Itt';

  @override
  String get placesTabLabel => 'Helyek';

  @override
  String get settingsTabLabel => 'Beállítások';

  @override
  String get hereEmptyTitle => 'Itt még nem fotóztál';

  @override
  String get hereEmptyBody =>
      'Növeld a keresési sugarat, vagy térj vissza egy helyre, ahol már jártál.';

  @override
  String get hereNotIndexedTitle => 'Még nincs semmi indexelve';

  @override
  String get hereNotIndexedBody =>
      'A Been Here-nek egyszer el kell olvasnia a fotókönyvtáradat, hogy tudja, hol jártál. Semmi sem hagyja el a telefonodat.';

  @override
  String get indexStartAction => 'Fotóim indexelése';

  @override
  String get indexPermissionTitle => 'A Been Here-nek szüksége van a fotóidra';

  @override
  String get indexPermissionBody =>
      'Csak azt olvassa ki, hol és mikor készült az egyes fotó, és ezt ezen a telefonon tartja.';

  @override
  String get indexPermissionAction => 'Hozzáférés engedélyezése';

  @override
  String get indexPermissionDeniedTitle =>
      'A fotókhoz való hozzáférés ki van kapcsolva';

  @override
  String get indexPermissionDeniedBody =>
      'Enélkül a Been Here semmit sem tud mutatni. A rendszerbeállításokban bekapcsolhatod.';

  @override
  String get indexLimitedAccessNotice =>
      'Csak kiválasztott fotókat osztottál meg, így a Been Here csak azokat látja. Teljes hozzáféréssel minden helyet megtalál, ahol jártál.';

  @override
  String get indexRunningTitle => 'Fotókönyvtár olvasása';

  @override
  String indexRunningProgress(int processed, int total) {
    return '$processed / $total';
  }

  @override
  String get indexFailedTitle => 'Az indexelés leállt';

  @override
  String get indexFailedBody =>
      'Valami félúton elromlott. Újrapróbálkozáskor onnan folytatja, ahol abbahagyta.';

  @override
  String indexedPhotoCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotó indexelve',
      one: '$count fotó indexelve',
      zero: 'Nincs indexelt fotó',
    );
    return '$_temp0';
  }

  @override
  String indexedLocationCoverage(int percent) {
    return '$percent%-uknak van helyadata';
  }

  @override
  String get commonLoading => 'Betöltés…';

  @override
  String get commonRetry => 'Újra';

  @override
  String get commonCancel => 'Mégse';

  @override
  String hereRadiusLabel(String radius) {
    return '$radius körzetben';
  }

  @override
  String herePhotoCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotó',
      one: '$count fotó',
      zero: 'Nincs fotó',
    );
    return '$_temp0';
  }

  @override
  String hereVisitCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count látogatás',
      one: '$count látogatás',
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
  String get ageToday => 'Ma';

  @override
  String get ageYesterday => 'Tegnap';

  @override
  String ageDaysAgo(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days napja',
    );
    return '$_temp0';
  }

  @override
  String ageMonthsAgo(int months) {
    String _temp0 = intl.Intl.pluralLogic(
      months,
      locale: localeName,
      other: '$months hónapja',
      one: 'Egy hónapja',
    );
    return '$_temp0';
  }

  @override
  String ageYearsAgo(int years) {
    String _temp0 = intl.Intl.pluralLogic(
      years,
      locale: localeName,
      other: '$years éve',
      one: 'Egy éve',
    );
    return '$_temp0';
  }

  @override
  String get locationPermissionTitle => 'Hol vagy?';

  @override
  String get locationPermissionBody =>
      'A Been Here összeveti a helyzetedet azokkal a helyekkel, ahol a fotóid készültek. Az összevetés ezen a telefonon történik.';

  @override
  String get locationPermissionAction => 'Helyzetem használata';

  @override
  String get locationDeniedTitle => 'A helymeghatározás ki van kapcsolva';

  @override
  String get locationDeniedBody =>
      'Enélkül az app nem tudja, mi van itt neked. A rendszerbeállításokban bekapcsolhatod.';

  @override
  String get locationUnavailableTitle => 'Még nincs helyzet';

  @override
  String get locationUnavailableBody =>
      'A telefonod még nem találta ki, hol van. Épületben ez eltarthat egy ideig.';

  @override
  String get locationServicesDisabledTitle =>
      'A helymeghatározás ki van kapcsolva';

  @override
  String get locationServicesDisabledBody =>
      'Kapcsold be a rendszerbeállításokban, és gyere vissza.';

  @override
  String get hereNothingTitle => 'Itt még nem fotóztál';

  @override
  String get hereNothingBody =>
      'Próbálj nagyobb sugarat, vagy térj vissza egy helyre, ahol már jártál.';

  @override
  String hereNearestHint(String distance) {
    return 'A legközelebbi emléked $distance távolságra van.';
  }

  @override
  String get photoDetailRephoto => 'Újrafotózás';

  @override
  String get photoDetailRephotoSoon =>
      'Az újrafotózás egy későbbi verzióban érkezik.';

  @override
  String photoDetailOf(int index, int total) {
    return '$index / $total';
  }

  @override
  String get debugLocationTitle => 'Teszthelyzet';

  @override
  String get debugLocationBody =>
      'Tégy úgy, mintha máshol lennél, hogy az Itt képernyő a kanapéról is tesztelhető legyen.';

  @override
  String get debugLocationLatitude => 'Szélesség';

  @override
  String get debugLocationLongitude => 'Hosszúság';

  @override
  String get debugLocationApply => 'Odamegyek';

  @override
  String get debugLocationClear => 'Valódi helyzet használata';

  @override
  String get debugLocationActive => 'Teszthelyzet aktív';

  @override
  String get commonClose => 'Bezárás';

  @override
  String get placesEmptyTitle => 'Még nincsenek helyek';

  @override
  String get placesEmptyBody =>
      'A helyek akkor jelennek meg, amikor a fotóid indexelve vannak.';

  @override
  String get placesSortLabel => 'Rendezés';

  @override
  String get placesSortLongestAgo => 'Legrégebben';

  @override
  String get placesSortMostPhotos => 'Legtöbb fotó';

  @override
  String get placesSortNearest => 'Legközelebbi';

  @override
  String placesMutedSection(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count elnémított hely',
      one: '$count elnémított hely',
    );
    return '$_temp0';
  }

  @override
  String get placesMute => 'Némítás';

  @override
  String get placesUnmute => 'Némítás feloldása';

  @override
  String get placesUseAutoRule => 'Automatikus döntés';

  @override
  String get placesAutoMutedNote =>
      'Automatikusan elnémítva – szinte minden nap itt vagy';

  @override
  String get placesUserMutedNote => 'Te némítottad el';

  @override
  String get placesUserUnmutedNote => 'Te hagytad láthatóan';

  @override
  String placesDayCount(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days nap',
      one: '$days nap',
    );
    return '$_temp0';
  }

  @override
  String get settingsPlaceNamesTitle => 'Helyek elnevezése';

  @override
  String get settingsPlaceNamesBody =>
      'Megkéri a rendszert, hogy egy hely koordinátáit névvé alakítsa. Ez a koordináta az Apple-höz vagy a Google-höz kerül – ez az egyetlen dolog ebben az appban, ami elhagyja a telefonodat. Alapból ki van kapcsolva; újbóli kikapcsoláskor minden név törlődik.';

  @override
  String get settingsAutoMuteTitle =>
      'Hétköznapi helyek némítása ennyi nap után';

  @override
  String get settingsAutoMuteBody =>
      'Az a hely, ahol ennyi különböző napon készültek fotók, ott élsz, nem pedig látogatod.';

  @override
  String settingsAutoMuteValue(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days nap',
    );
    return '$_temp0';
  }

  @override
  String get settingsIndexTitle => 'Fotóindex';

  @override
  String get settingsReindex => 'Újraindexelés az elejétől';

  @override
  String get settingsPrivacyTitle => 'Mi marad ezen a telefonon';

  @override
  String get settingsPrivacyBody =>
      'A fotóid, hogy hol készültek, és minden, amit az app ezekből kikövetkeztet. Nincs fiók, nincs szerver, nincs analitika.';

  @override
  String get placesName => 'Hely elnevezése';

  @override
  String get placesRename => 'Átnevezés';

  @override
  String get placesNameDialogTitle => 'A hely neve';

  @override
  String get placesNameHint => 'Nagyiéknál, a tó, az iroda…';

  @override
  String get placesNameSave => 'Mentés';

  @override
  String get placesNameClear => 'Név eltávolítása';

  @override
  String placesSummary(String age, String photos) {
    return '$age · $photos';
  }

  @override
  String get notificationTitle => 'Jártál már itt';

  @override
  String notificationBody(String age, String photos) {
    return 'Legutóbb itt: $age. $photos.';
  }

  @override
  String get alwaysLocationTitle =>
      'Hagyd, hogy a Been Here figyeljen helyetted';

  @override
  String get alwaysLocationBody =>
      'Háttérben futó helymeghatározással a telefonod szólhat a Been Here-nek, amikor olyan helyre érsz, ahol már fotóztál – és az app egyszer szólhat neked, anélkül hogy bármit megnyitnál.\n\nAz app soha nem követ téged. A telefonod néhány kört figyel, és csak akkor ébreszti fel az appot, amikor belépsz valamelyikbe. Semmi sem hagyja el ezt az eszközt arról, hol vagy.';

  @override
  String get alwaysLocationAction => 'Érkezések bekapcsolása';

  @override
  String get alwaysLocationLater => 'Most nem';

  @override
  String get alwaysLocationDeniedBody =>
      'A háttérben futó helymeghatározás ki van kapcsolva, így az érkezések csendben maradnak. Minden más ugyanúgy működik; a rendszerbeállításokban bármikor bekapcsolhatod.';

  @override
  String get settingsArrivalsTitle => 'Érkezések';

  @override
  String get settingsArrivalsOn =>
      'A Been Here szól, amikor olyan helyre érsz, ahol egy ideje nem fotóztál.';

  @override
  String get settingsArrivalsOff =>
      'A Been Here csendben marad. Bekapcsoláskor háttérbeli helymeghatározást kér.';

  @override
  String get settingsMemoryAgeTitle => 'Csak az ennél régebbi helyek említése';

  @override
  String settingsMemoryAgeValue(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days nap',
      one: '$days nap',
    );
    return '$_temp0';
  }

  @override
  String get settingsPlaceCooldownTitle =>
      'Utána a hely csendben marad ennyi ideig';

  @override
  String get settingsDailyLimitTitle => 'És semmit sem mond ennyi ideig';

  @override
  String settingsDailyLimitValue(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours óra',
      one: '$hours óra',
      zero: 'semeddig',
    );
    return '$_temp0';
  }

  @override
  String get settingsThresholdsBody =>
      'Csökkentsd ezeket, hogy fél év várakozás nélkül kipróbáld az érkezéseket.';

  @override
  String get placesTestArrival => 'Érkezés tesztelése itt';

  @override
  String get arrivalTestNotified => 'Értesítés elküldve';

  @override
  String get arrivalTestMuted => 'Semmi: a hely el van némítva';

  @override
  String get arrivalTestTooFewPhotos => 'Semmi: túl kevés fotó itt';

  @override
  String get arrivalTestTooRecent => 'Semmi: túl nemrég fotóztál itt';

  @override
  String get arrivalTestPlaceCooldown => 'Semmi: ez a hely nemrég már szólt';

  @override
  String get arrivalTestDailyLimit => 'Semmi: ma már szólt valami más';

  @override
  String get alwaysLocationNeedsSettingsBody =>
      'A telefonod a helymeghatározást „Az app használata közben” beállításon hagyta. Az iOS az appon belül nem kínálja fel újra a választást, ezért a rendszerbeállításokban „Mindig”-re kell állítani – ezután működnek az érkezések.';

  @override
  String get commonOpenSettings => 'Beállítások megnyitása';

  @override
  String get settingsArrivalsPending =>
      'Majdnem: a helymeghatározás még „Az app használata közben” állásban van. Állítsd „Mindig”-re a rendszerbeállításokban.';

  @override
  String get placesSortVisits => 'Legtöbb látogatás';

  @override
  String get placesSortAscending => 'Fordított sorrend';

  @override
  String placesVisitCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count látogatás',
      one: '$count látogatás',
      zero: 'soha',
    );
    return '$_temp0';
  }

  @override
  String get settingsMapTitle => 'Helyek megjelenítése térképen';

  @override
  String get settingsMapBody =>
      'A térképcsempék az OpenStreetMapről töltődnek le, ahogy mozgatod és nagyítod, így az a szerver folyamatosan látja, merre nézel. A helynévvel ellentétben, amelyet egyszer kér le, ez addig tart, amíg a térkép nyitva van. Alapból ki van kapcsolva.';

  @override
  String get placesShowMap => 'Térkép';

  @override
  String get placesShowList => 'Lista';

  @override
  String get placesMapAttribution => '© OpenStreetMap közreműködők';

  @override
  String get rephotoOverlay => 'Áttűnés';

  @override
  String get rephotoEdges => 'Körvonal';

  @override
  String get rephotoCapture => 'Fotózás';

  @override
  String get rephotoSaved => 'Mentve a fotóid közé';

  @override
  String get rephotoNotSaved =>
      'Nem sikerült menteni. Lehet, hogy a fotók hozzáadása ki van kapcsolva.';

  @override
  String get rephotoNoCamera =>
      'Nincs elérhető kamera. A Been Here-nek kamera kell, hogy egy régi fotóra válaszoló képet készítsen.';

  @override
  String get rephotoThenAndNow => 'Akkor és most';

  @override
  String get rephotoShare => 'Megosztás';

  @override
  String get rephotoThen => 'Akkor';

  @override
  String get rephotoNow => 'Most';

  @override
  String get rephotoShareFailed =>
      'Nem sikerült elkészíteni a megosztandó képet.';

  @override
  String get onboardingSkip => 'Kihagyás';

  @override
  String get onboardingNext => 'Tovább';

  @override
  String get onboardingWhatTitle => 'Fotók arról a helyről, ahol állsz';

  @override
  String get onboardingWhatBody =>
      'Érkezz egy helyre, ahol már fotóztál, és a Been Here megmutatja, mit készítettél ott – látogatásról látogatásra, a legrégebbivel kezdve.';

  @override
  String get onboardingPrivacyTitle => 'Semmi sem hagyja el a telefonodat';

  @override
  String get onboardingPrivacyBody =>
      'Nincs fiók, nincs szerver, nincs analitika. A Been Here az eszközön olvassa a fotókönyvtáradat, és mellette egy kis indexet tart. A fotóid, és hogy hol készültek, ott maradnak, ahol vannak.';

  @override
  String get onboardingPrivacyFootnote =>
      'Két dolog érheti el a hálózatot, és mindkettő ki van kapcsolva, amíg be nem kapcsolod: a helynevek és a térkép.';

  @override
  String get onboardingPhotosTitle => 'Szüksége van a fotóidra';

  @override
  String get onboardingPhotosBody =>
      'A Been Here feljegyzi, melyik fotó hol készült. Soha semmit nem másol és nem mozgat – azonosítókat és koordinátákat jegyez meg, magukat a képeket csak akkor olvassa, amikor megmutatja neked.';

  @override
  String get onboardingPhotosAction => 'Fotók engedélyezése';

  @override
  String get onboardingDone => 'Kezdés';

  @override
  String get settingsAboutTitle => 'Névjegy';

  @override
  String settingsVersion(String version, String build) {
    return 'Verzió: $version ($build)';
  }

  @override
  String get settingsSourceTitle => 'Forráskód';

  @override
  String get settingsShowIntro => 'Bemutató újra';

  @override
  String photoSemanticLabel(String date) {
    return 'Fotó, $date';
  }

  @override
  String photoOpenSemanticLabel(int index, int total, String date) {
    return '$index. fotó / $total, $date';
  }

  @override
  String get placesActionsLabel => 'Mi legyen ezzel a hellyel';

  @override
  String get radiusSemanticLabel => 'Keresési sugár';

  @override
  String get hereMapTitle => 'A környéken';

  @override
  String get hereOpenInMaps => 'Megnyitás a Térképben';

  @override
  String get hereBackToMe => 'Vissza oda, ahol vagyok';

  @override
  String get herePlaceFallbackTitle => 'Egy hely, amit ismersz';

  @override
  String get arrivalTestNearHome =>
      'Túl közel van az otthonhoz ahhoz, hogy hír legyen.';

  @override
  String get settingsHomeRadiusTitle => 'Csend ennyin belül';

  @override
  String settingsHomeRadiusValue(num km) {
    String _temp0 = intl.Intl.pluralLogic(
      km,
      locale: localeName,
      other: '$km km az otthontól',
      one: '$km km az otthontól',
      zero: 'semennyi – soha nincs csend',
    );
    return '$_temp0';
  }

  @override
  String get settingsHomeRadiusBody =>
      'A hétköznapok az otthon közelében zajlanak, és épp ott a legkevésbé kívánatos egy telefon, amely kommentálja őket. Az ennél közelebbi helyeket soha nem figyeli.';

  @override
  String get settingsQuietTitle => 'Miért van csend';

  @override
  String settingsQuietWatching(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count helyet figyel',
      one: '$count helyet figyel',
      zero: 'Egy helyet sem figyel',
    );
    return '$_temp0';
  }

  @override
  String settingsQuietNearest(String distance) {
    return 'Legközelebbi figyelt hely: $distance';
  }

  @override
  String get settingsQuietNothingWatched =>
      'Semmit sem figyel, így érkezés sem lehet.';

  @override
  String settingsQuietLastNotified(String when) {
    return 'Utolsó értesítés: $when';
  }

  @override
  String get settingsQuietNever => 'soha';

  @override
  String settingsQuietBreakdown(int total, String reasons) {
    return '$total helyből: $reasons';
  }

  @override
  String settingsQuietReasonMuted(Object count) {
    return '$count elnémítva';
  }

  @override
  String settingsQuietReasonNearHome(Object count) {
    return '$count az otthon közelében';
  }

  @override
  String settingsQuietReasonTooFewPhotos(Object count) {
    return '$count túl kevés fotóval';
  }

  @override
  String settingsQuietReasonTooRecent(Object count) {
    return '$count nemrég fotózva';
  }

  @override
  String settingsQuietReasonPlaceCooldown(Object count) {
    return '$count még szünetel';
  }

  @override
  String settingsQuietReasonEligible(Object count) {
    return '$count figyelésre érdemes';
  }

  @override
  String get ageSemanticLabel => 'Fotók kora';

  @override
  String get ageStopNow => 'most';

  @override
  String get ageStopDay => '1 nap';

  @override
  String get ageStop3Days => '3 nap';

  @override
  String get ageStopWeek => '1 hét';

  @override
  String get ageStop2Weeks => '2 hét';

  @override
  String get ageStopMonth => '1 hónap';

  @override
  String get ageStop3Months => '3 hónap';

  @override
  String get ageStop6Months => '6 hónap';

  @override
  String get ageStopYear => '1 év';

  @override
  String get ageStop2Years => '2 év';

  @override
  String get ageStop5Years => '5 év';

  @override
  String get ageStop10Years => '10 év';

  @override
  String get ageStopAll => 'mind';

  @override
  String get ageWindowAll => 'Minden fotó';

  @override
  String ageWindowNewerThan(String stop) {
    return 'Legfeljebb $stop';
  }

  @override
  String ageWindowOlderThan(String stop) {
    return 'Régebbi mint $stop';
  }

  @override
  String ageWindowBetween(String newest, String oldest) {
    return '$newest – $oldest';
  }

  @override
  String get ageWindowReset => 'Visszaállítás';

  @override
  String mapDotCountCapped(int count) {
    return '$count+ fotó';
  }
}
