// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Slovak (`sk`).
class AppLocalizationsSk extends AppLocalizations {
  AppLocalizationsSk([String locale = 'sk']) : super(locale);

  @override
  String get appTitle => 'Been Here';

  @override
  String get hereTabLabel => 'Tu';

  @override
  String get placesTabLabel => 'Miesta';

  @override
  String get settingsTabLabel => 'Nastavenia';

  @override
  String get hereEmptyTitle => 'Tu ste nefotili';

  @override
  String get hereEmptyBody =>
      'Zväčšite polomer hľadania alebo sa vráťte niekam, kde ste už boli.';

  @override
  String get hereNotIndexedTitle => 'Zatiaľ nič nie je zaindexované';

  @override
  String get hereNotIndexedBody =>
      'Been Here musí raz prečítať vašu knižnicu fotiek, aby vedel, kde ste boli. Nič neopustí váš telefón.';

  @override
  String get indexStartAction => 'Zaindexovať moje fotky';

  @override
  String get indexPermissionTitle => 'Been Here potrebuje vaše fotky';

  @override
  String get indexPermissionBody =>
      'Číta len to, kde a kedy bola každá fotka urobená, a uchováva to v tomto telefóne.';

  @override
  String get indexPermissionAction => 'Povoliť prístup';

  @override
  String get indexPermissionDeniedTitle => 'Prístup k fotkám je vypnutý';

  @override
  String get indexPermissionDeniedBody =>
      'Bez neho vám Been Here nič neukáže. Zapnúť ho môžete v nastaveniach systému.';

  @override
  String get indexLimitedAccessNotice =>
      'Sprístupnili ste len vybrané fotky, takže Been Here vidí iba tie. S plným prístupom nájde každé miesto, kde ste boli.';

  @override
  String get indexRunningTitle => 'Čítam vašu knižnicu fotiek';

  @override
  String indexRunningProgress(int processed, int total) {
    return '$processed z $total';
  }

  @override
  String get indexFailedTitle => 'Indexovanie sa zastavilo';

  @override
  String get indexFailedBody =>
      'Niečo sa v polovici pokazilo. Nový pokus pokračuje tam, kde sa skončilo.';

  @override
  String indexedPhotoCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count zaindexovaných fotiek',
      many: '$count zaindexovanej fotky',
      few: '$count zaindexované fotky',
      one: '$count zaindexovaná fotka',
      zero: 'Žiadne zaindexované fotky',
    );
    return '$_temp0';
  }

  @override
  String indexedLocationCoverage(int percent) {
    return '$percent % z nich má polohu';
  }

  @override
  String get commonLoading => 'Načítava sa…';

  @override
  String get commonRetry => 'Skúsiť znova';

  @override
  String get commonCancel => 'Zrušiť';

  @override
  String hereRadiusLabel(String radius) {
    return 'Do $radius';
  }

  @override
  String herePhotoCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotiek',
      many: '$count fotky',
      few: '$count fotky',
      one: '$count fotka',
      zero: 'Žiadne fotky',
    );
    return '$_temp0';
  }

  @override
  String hereVisitCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count návštev',
      many: '$count návštevy',
      few: '$count návštevy',
      one: '$count návšteva',
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
  String get ageToday => 'Dnes';

  @override
  String get ageYesterday => 'Včera';

  @override
  String ageDaysAgo(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'pred $days dňami',
    );
    return '$_temp0';
  }

  @override
  String ageMonthsAgo(int months) {
    String _temp0 = intl.Intl.pluralLogic(
      months,
      locale: localeName,
      other: 'pred $months mesiacmi',
      one: 'pred mesiacom',
    );
    return '$_temp0';
  }

  @override
  String ageYearsAgo(int years) {
    String _temp0 = intl.Intl.pluralLogic(
      years,
      locale: localeName,
      other: 'pred $years rokmi',
      one: 'pred rokom',
    );
    return '$_temp0';
  }

  @override
  String get locationPermissionTitle => 'Kde ste?';

  @override
  String get locationPermissionBody =>
      'Been Here porovnáva vašu polohu s miestami, kde vznikli vaše fotky. Porovnanie prebieha v tomto telefóne.';

  @override
  String get locationPermissionAction => 'Použiť moju polohu';

  @override
  String get locationDeniedTitle => 'Poloha je vypnutá';

  @override
  String get locationDeniedBody =>
      'Bez nej aplikácia nevie, čo tu máte. Zapnúť ju môžete v nastaveniach systému.';

  @override
  String get locationUnavailableTitle => 'Zatiaľ bez polohy';

  @override
  String get locationUnavailableBody =>
      'Telefón ešte nezistil, kde je. V budove to môže chvíľu trvať.';

  @override
  String get locationServicesDisabledTitle => 'Polohové služby sú vypnuté';

  @override
  String get locationServicesDisabledBody =>
      'Zapnite ich v nastaveniach systému a vráťte sa.';

  @override
  String get hereNothingTitle => 'Tu ste nefotili';

  @override
  String get hereNothingBody =>
      'Skúste väčší polomer alebo sa vráťte niekam, kde ste už boli.';

  @override
  String hereNearestHint(String distance) {
    return 'Vaša najbližšia spomienka je $distance odtiaľto.';
  }

  @override
  String get photoDetailRephoto => 'Prefotiť';

  @override
  String get photoDetailRephotoSoon => 'Prefotenie príde v neskoršej verzii.';

  @override
  String photoDetailOf(int index, int total) {
    return '$index z $total';
  }

  @override
  String get debugLocationTitle => 'Testovacia poloha';

  @override
  String get debugLocationBody =>
      'Predstierajte, že ste inde, aby sa dala obrazovka Tu otestovať z gauča.';

  @override
  String get debugLocationLatitude => 'Zemepisná šírka';

  @override
  String get debugLocationLongitude => 'Zemepisná dĺžka';

  @override
  String get debugLocationApply => 'Prejsť tam';

  @override
  String get debugLocationClear => 'Použiť skutočnú polohu';

  @override
  String get debugLocationActive => 'Testovacia poloha je aktívna';

  @override
  String get commonClose => 'Zavrieť';

  @override
  String get placesEmptyTitle => 'Zatiaľ žiadne miesta';

  @override
  String get placesEmptyBody =>
      'Miesta sa objavia, keď budú vaše fotky zaindexované.';

  @override
  String get placesSortLabel => 'Zoradiť podľa';

  @override
  String get placesSortLongestAgo => 'Najdlhšie od návštevy';

  @override
  String get placesSortMostPhotos => 'Najviac fotiek';

  @override
  String get placesSortNearest => 'Najbližšie';

  @override
  String placesMutedSection(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count stlmených miest',
      many: '$count stlmeného miesta',
      few: '$count stlmené miesta',
      one: '$count stlmené miesto',
    );
    return '$_temp0';
  }

  @override
  String get placesMute => 'Stlmiť';

  @override
  String get placesUnmute => 'Zrušiť stlmenie';

  @override
  String get placesUseAutoRule => 'Rozhodnúť automaticky';

  @override
  String get placesAutoMutedNote =>
      'Stlmené automaticky – ste tu takmer každý deň';

  @override
  String get placesUserMutedNote => 'Stlmené vami';

  @override
  String get placesUserUnmutedNote => 'Ponechané viditeľné vami';

  @override
  String placesDayCount(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days dní',
      many: '$days dňa',
      few: '$days dni',
      one: '$days deň',
    );
    return '$_temp0';
  }

  @override
  String get settingsPlaceNamesTitle => 'Pomenovať miesta';

  @override
  String get settingsPlaceNamesBody =>
      'Požiada systém, aby súradnice miesta premenil na názov. Tieto súradnice idú do Apple alebo Google – je to jediná vec v tejto aplikácii, ktorá opustí váš telefón. Predvolene vypnuté; opätovné vypnutie zabudne všetky názvy.';

  @override
  String get settingsAutoMuteTitle => 'Stlmiť bežné miesta po';

  @override
  String get settingsAutoMuteBody =>
      'Miesto s fotkami z toľkých rôznych dní je miesto, kde žijete, nie miesto, ktoré navštevujete.';

  @override
  String settingsAutoMuteValue(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days dňoch',
      many: '$days dňa',
      few: '$days dňoch',
    );
    return '$_temp0';
  }

  @override
  String get settingsIndexTitle => 'Index fotiek';

  @override
  String get settingsReindex => 'Zaindexovať odznova';

  @override
  String get settingsPrivacyTitle => 'Čo zostáva v tomto telefóne';

  @override
  String get settingsPrivacyBody =>
      'Vaše fotky, kde vznikli, a všetko, čo z nich táto aplikácia vyvodí. Nie je tu žiadny účet, server ani analytika.';

  @override
  String get placesName => 'Pomenovať toto miesto';

  @override
  String get placesRename => 'Premenovať';

  @override
  String get placesNameDialogTitle => 'Názov miesta';

  @override
  String get placesNameHint => 'U babky, jazero, kancelária…';

  @override
  String get placesNameSave => 'Uložiť';

  @override
  String get placesNameClear => 'Odstrániť názov';

  @override
  String placesSummary(String age, String photos) {
    return '$age · $photos';
  }

  @override
  String get notificationTitle => 'Tu ste už boli';

  @override
  String notificationBody(String age, String photos) {
    return 'Naposledy ste tu boli $age. $photos.';
  }

  @override
  String get alwaysLocationTitle => 'Nechajte Been Here dávať pozor za vás';

  @override
  String get alwaysLocationBody =>
      'S polohou na pozadí môže telefón dať Been Here vedieť, keď prídete niekam, kde ste už fotili – a aplikácia vám to môže raz povedať bez toho, aby ste čokoľvek otvárali.\n\nAplikácia vás nikdy nesleduje. Telefón stráži niekoľko kruhov a aplikáciu zobudí, až keď vstúpite do jedného z nich. Nič o tom, kde ste, neopustí toto zariadenie.';

  @override
  String get alwaysLocationAction => 'Zapnúť príchody';

  @override
  String get alwaysLocationLater => 'Teraz nie';

  @override
  String get alwaysLocationDeniedBody =>
      'Poloha na pozadí je vypnutá, takže príchody mlčia. Všetko ostatné funguje ako predtým; zapnúť ju môžete v nastaveniach systému kedykoľvek.';

  @override
  String get settingsArrivalsTitle => 'Príchody';

  @override
  String get settingsArrivalsOn =>
      'Been Here vám dá vedieť, keď prídete niekam, kde ste dlho nefotili.';

  @override
  String get settingsArrivalsOff =>
      'Been Here mlčí. Zapnutie si vyžiada polohu na pozadí.';

  @override
  String get settingsMemoryAgeTitle => 'Spomínať len miesta staršie ako';

  @override
  String settingsMemoryAgeValue(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days dní',
      many: '$days dňa',
      few: '$days dni',
      one: '$days deň',
    );
    return '$_temp0';
  }

  @override
  String get settingsPlaceCooldownTitle => 'Potom nechať miesto v pokoji na';

  @override
  String get settingsDailyLimitTitle => 'A nehovoriť vôbec nič počas';

  @override
  String settingsDailyLimitValue(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours hodín',
      many: '$hours hodiny',
      few: '$hours hodín',
      one: '$hours hodiny',
      zero: 'žiadneho času',
    );
    return '$_temp0';
  }

  @override
  String get settingsThresholdsBody =>
      'Znížte tieto hodnoty, ak chcete vyskúšať príchody bez čakania pol roka.';

  @override
  String get placesTestArrival => 'Otestovať príchod sem';

  @override
  String get arrivalTestNotified => 'Upozornenie odoslané';

  @override
  String get arrivalTestMuted => 'Nič: miesto je stlmené';

  @override
  String get arrivalTestTooFewPhotos => 'Nič: príliš málo fotiek';

  @override
  String get arrivalTestTooRecent => 'Nič: fotili ste tu príliš nedávno';

  @override
  String get arrivalTestPlaceCooldown => 'Nič: toto miesto sa nedávno ozvalo';

  @override
  String get arrivalTestDailyLimit => 'Nič: dnes sa už ozvalo niečo iné';

  @override
  String get alwaysLocationNeedsSettingsBody =>
      'Telefón ponechal polohu na „Pri používaní apky“. iOS túto voľbu v aplikácii znova neponúkne, takže polohu na pozadí treba prepnúť na „Vždy“ v nastaveniach systému – potom začnú príchody fungovať.';

  @override
  String get commonOpenSettings => 'Otvoriť nastavenia';

  @override
  String get settingsArrivalsPending =>
      'Skoro: poloha je stále na „Pri používaní apky“. Prepnite ju na „Vždy“ v nastaveniach systému.';

  @override
  String get placesSortVisits => 'Najviac návštev';

  @override
  String get placesSortAscending => 'Opačné poradie';

  @override
  String placesVisitCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count návštev',
      many: '$count návštevy',
      few: '$count návštevy',
      one: '$count návšteva',
      zero: 'nikdy',
    );
    return '$_temp0';
  }

  @override
  String get settingsMapTitle => 'Zobraziť miesta na mape';

  @override
  String get settingsMapBody =>
      'Dlaždice mapy sa sťahujú z OpenStreetMap pri posúvaní a približovaní, takže tento server priebežne vidí, kam sa pozeráte. Na rozdiel od názvu miesta, na ktorý sa pýta raz, to trvá, kým je mapa otvorená. Predvolene vypnuté.';

  @override
  String get placesShowMap => 'Mapa';

  @override
  String get placesShowList => 'Zoznam';

  @override
  String get placesMapAttribution => '© Prispievatelia OpenStreetMap';

  @override
  String get rephotoOverlay => 'Prelínanie';

  @override
  String get rephotoEdges => 'Obrys';

  @override
  String get rephotoCapture => 'Odfotiť';

  @override
  String get rephotoSaved => 'Uložené do fotiek';

  @override
  String get rephotoNotSaved =>
      'Nepodarilo sa uložiť. Pridávanie fotiek môže byť vypnuté.';

  @override
  String get rephotoNoCamera =>
      'Fotoaparát nie je dostupný. Been Here potrebuje fotoaparát, aby urobil fotku, ktorá odpovedá na starú.';

  @override
  String get rephotoThenAndNow => 'Kedysi a teraz';

  @override
  String get rephotoShare => 'Zdieľať';

  @override
  String get rephotoThen => 'Kedysi';

  @override
  String get rephotoNow => 'Teraz';

  @override
  String get rephotoShareFailed =>
      'Obrázok na zdieľanie sa nepodarilo vytvoriť.';

  @override
  String get onboardingSkip => 'Preskočiť';

  @override
  String get onboardingNext => 'Ďalej';

  @override
  String get onboardingWhatTitle => 'Fotky z miesta, kde stojíte';

  @override
  String get onboardingWhatBody =>
      'Príďte niekam, kde ste už fotili, a Been Here vám ukáže, čo ste tam nafotili – návštevu po návšteve, od najstaršej.';

  @override
  String get onboardingPrivacyTitle => 'Nič neopustí váš telefón';

  @override
  String get onboardingPrivacyBody =>
      'Žiadny účet, žiadny server, žiadna analytika. Been Here číta vašu knižnicu fotiek v zariadení a vedľa nej si vedie malý index. Vaše fotky a miesta, kde vznikli, zostávajú tam, kde sú.';

  @override
  String get onboardingPrivacyFootnote =>
      'Do siete sa môžu dostať dve veci a obe sú vypnuté, kým ich nezapnete: názvy miest a mapa.';

  @override
  String get onboardingPhotosTitle => 'Potrebuje vaše fotky';

  @override
  String get onboardingPhotosBody =>
      'Been Here si zapisuje, ktorá fotka vznikla kde. Nikdy nič nekopíruje ani nepresúva – pamätá si identifikátory a súradnice a samotné obrázky číta len vtedy, keď vám ich ukazuje.';

  @override
  String get onboardingPhotosAction => 'Povoliť fotky';

  @override
  String get onboardingDone => 'Začať';

  @override
  String get settingsAboutTitle => 'O aplikácii';

  @override
  String settingsVersion(String version, String build) {
    return 'Verzia $version ($build)';
  }

  @override
  String get settingsSourceTitle => 'Zdrojový kód';

  @override
  String get settingsShowIntro => 'Znova zobraziť úvod';

  @override
  String photoSemanticLabel(String date) {
    return 'Fotka z $date';
  }

  @override
  String photoOpenSemanticLabel(int index, int total, String date) {
    return 'Fotka $index z $total, $date';
  }

  @override
  String get placesActionsLabel => 'Čo s týmto miestom';

  @override
  String get radiusSemanticLabel => 'Polomer hľadania';

  @override
  String get hereMapTitle => 'Tu okolo';

  @override
  String get hereOpenInMaps => 'Otvoriť v Mapách';

  @override
  String get hereBackToMe => 'Späť na moju polohu';

  @override
  String get herePlaceFallbackTitle => 'Miesto, ktoré poznáte';

  @override
  String get arrivalTestNearHome =>
      'Príliš blízko domova na to, aby to bola novinka.';

  @override
  String get settingsHomeRadiusTitle => 'Mlčať do vzdialenosti';

  @override
  String settingsHomeRadiusValue(num km) {
    String _temp0 = intl.Intl.pluralLogic(
      km,
      locale: localeName,
      other: '$km km od domova',
      one: '$km km od domova',
      zero: 'žiadna – nikdy nemlčať',
    );
    return '$_temp0';
  }

  @override
  String get settingsHomeRadiusBody =>
      'Bežný život sa odohráva blízko domova a práve tam je telefón, ktorý ho komentuje, najmenej vítaný. Miesta bližšie než toto sa nikdy nestrážia.';

  @override
  String get settingsQuietTitle => 'Prečo je ticho';

  @override
  String settingsQuietWatching(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Stráži sa $count miest',
      many: 'Stráži sa $count miesta',
      few: 'Strážia sa $count miesta',
      one: 'Stráži sa $count miesto',
      zero: 'Nestráži sa žiadne miesto',
    );
    return '$_temp0';
  }

  @override
  String settingsQuietNearest(String distance) {
    return 'Najbližšie strážené miesto: $distance';
  }

  @override
  String get settingsQuietNothingWatched =>
      'Nič sa nestráži, takže nemôže prísť žiadny príchod.';

  @override
  String settingsQuietLastNotified(String when) {
    return 'Posledné upozornenie: $when';
  }

  @override
  String get settingsQuietNever => 'nikdy';

  @override
  String settingsQuietBreakdown(int total, String reasons) {
    return 'Z $total miest: $reasons';
  }

  @override
  String settingsQuietReasonMuted(Object count) {
    return 'stlmené: $count';
  }

  @override
  String settingsQuietReasonNearHome(Object count) {
    return 'blízko domova: $count';
  }

  @override
  String settingsQuietReasonTooFewPhotos(Object count) {
    return 'málo fotiek: $count';
  }

  @override
  String settingsQuietReasonTooRecent(Object count) {
    return 'fotené nedávno: $count';
  }

  @override
  String settingsQuietReasonPlaceCooldown(Object count) {
    return 'ešte v pauze: $count';
  }

  @override
  String settingsQuietReasonEligible(Object count) {
    return 'stojí za stráženie: $count';
  }

  @override
  String get ageSemanticLabel => 'Vek fotiek';

  @override
  String get ageStopNow => 'teraz';

  @override
  String get ageStopDay => '1 deň';

  @override
  String get ageStop3Days => '3 dni';

  @override
  String get ageStopWeek => '1 týždeň';

  @override
  String get ageStop2Weeks => '2 týždne';

  @override
  String get ageStopMonth => '1 mesiac';

  @override
  String get ageStop3Months => '3 mesiace';

  @override
  String get ageStop6Months => '6 mesiacov';

  @override
  String get ageStopYear => '1 rok';

  @override
  String get ageStop2Years => '2 roky';

  @override
  String get ageStop5Years => '5 rokov';

  @override
  String get ageStop10Years => '10 rokov';

  @override
  String get ageStopAll => 'všetko';

  @override
  String get ageWindowAll => 'Všetky fotky';

  @override
  String ageWindowNewerThan(String stop) {
    return 'Najviac $stop';
  }

  @override
  String ageWindowOlderThan(String stop) {
    return 'Staršie ako $stop';
  }

  @override
  String ageWindowBetween(String newest, String oldest) {
    return 'Od $newest do $oldest';
  }

  @override
  String get ageWindowReset => 'Obnoviť';

  @override
  String mapDotCountCapped(int count) {
    return '$count+ fotiek';
  }
}
