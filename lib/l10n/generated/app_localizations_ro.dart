// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Romanian Moldavian Moldovan (`ro`).
class AppLocalizationsRo extends AppLocalizations {
  AppLocalizationsRo([String locale = 'ro']) : super(locale);

  @override
  String get appTitle => 'Been Here';

  @override
  String get hereTabLabel => 'Aici';

  @override
  String get placesTabLabel => 'Locuri';

  @override
  String get settingsTabLabel => 'Setări';

  @override
  String get hereEmptyTitle => 'Nu ai făcut fotografii aici';

  @override
  String get hereEmptyBody =>
      'Mărește raza de căutare sau întoarce-te undeva unde ai mai fost.';

  @override
  String get hereNotIndexedTitle => 'Nimic indexat încă';

  @override
  String get hereNotIndexedBody =>
      'Been Here trebuie să-ți citească o dată biblioteca foto ca să știe unde ai fost. Nimic nu părăsește telefonul.';

  @override
  String get indexStartAction => 'Indexează fotografiile mele';

  @override
  String get indexPermissionTitle =>
      'Been Here are nevoie de fotografiile tale';

  @override
  String get indexPermissionBody =>
      'Citește doar unde și când a fost făcută fiecare fotografie și păstrează asta pe acest telefon.';

  @override
  String get indexPermissionAction => 'Permite accesul';

  @override
  String get indexPermissionDeniedTitle =>
      'Accesul la fotografii este dezactivat';

  @override
  String get indexPermissionDeniedBody =>
      'Fără el, Been Here nu-ți poate arăta nimic. Îl poți activa din setările sistemului.';

  @override
  String get indexLimitedAccessNotice =>
      'Ai partajat doar fotografii selectate, așa că Been Here le vede doar pe acelea. Cu acces complet poate găsi fiecare loc în care ai fost.';

  @override
  String get indexRunningTitle => 'Se citește biblioteca foto';

  @override
  String indexRunningProgress(int processed, int total) {
    return '$processed din $total';
  }

  @override
  String get indexFailedTitle => 'Indexarea s-a oprit';

  @override
  String get indexFailedBody =>
      'Ceva n-a mers pe parcurs. O nouă încercare continuă de unde a rămas.';

  @override
  String indexedPhotoCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de fotografii indexate',
      few: '$count fotografii indexate',
      one: '$count fotografie indexată',
      zero: 'Nicio fotografie indexată',
    );
    return '$_temp0';
  }

  @override
  String indexedLocationCoverage(int percent) {
    return '$percent% dintre ele au o locație';
  }

  @override
  String get commonLoading => 'Se încarcă…';

  @override
  String get commonRetry => 'Încearcă din nou';

  @override
  String get commonCancel => 'Anulează';

  @override
  String hereRadiusLabel(String radius) {
    return 'Pe o rază de $radius';
  }

  @override
  String herePhotoCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de fotografii',
      few: '$count fotografii',
      one: '$count fotografie',
      zero: 'Nicio fotografie',
    );
    return '$_temp0';
  }

  @override
  String hereVisitCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de vizite',
      few: '$count vizite',
      one: '$count vizită',
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
  String get ageToday => 'Azi';

  @override
  String get ageYesterday => 'Ieri';

  @override
  String ageDaysAgo(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Acum $days de zile',
      few: 'Acum $days zile',
    );
    return '$_temp0';
  }

  @override
  String ageMonthsAgo(int months) {
    String _temp0 = intl.Intl.pluralLogic(
      months,
      locale: localeName,
      other: 'Acum $months de luni',
      few: 'Acum $months luni',
      one: 'Acum o lună',
    );
    return '$_temp0';
  }

  @override
  String ageYearsAgo(int years) {
    String _temp0 = intl.Intl.pluralLogic(
      years,
      locale: localeName,
      other: 'Acum $years de ani',
      few: 'Acum $years ani',
      one: 'Acum un an',
    );
    return '$_temp0';
  }

  @override
  String get locationPermissionTitle => 'Unde ești?';

  @override
  String get locationPermissionBody =>
      'Been Here compară poziția ta cu locurile în care au fost făcute fotografiile tale. Comparația are loc pe acest telefon.';

  @override
  String get locationPermissionAction => 'Folosește locația mea';

  @override
  String get locationDeniedTitle => 'Locația este dezactivată';

  @override
  String get locationDeniedBody =>
      'Fără ea, aplicația nu știe ce ai aici. O poți activa din setările sistemului.';

  @override
  String get locationUnavailableTitle => 'Încă nicio poziție';

  @override
  String get locationUnavailableBody =>
      'Telefonul nu și-a dat încă seama unde se află. În interior poate dura puțin.';

  @override
  String get locationServicesDisabledTitle =>
      'Serviciile de localizare sunt dezactivate';

  @override
  String get locationServicesDisabledBody =>
      'Activează-le din setările sistemului și revino.';

  @override
  String get hereNothingTitle => 'Nu ai făcut fotografii aici';

  @override
  String get hereNothingBody =>
      'Încearcă o rază mai mare sau întoarce-te undeva unde ai mai fost.';

  @override
  String hereNearestHint(String distance) {
    return 'Cea mai apropiată amintire este la $distance.';
  }

  @override
  String get photoDetailRephoto => 'Refotografiază';

  @override
  String get photoDetailRephotoSoon =>
      'Refotografierea vine într-o versiune ulterioară.';

  @override
  String photoDetailOf(int index, int total) {
    return '$index din $total';
  }

  @override
  String get debugLocationTitle => 'Locație de test';

  @override
  String get debugLocationBody =>
      'Prefă-te că ești în altă parte, ca ecranul Aici să poată fi testat de pe canapea.';

  @override
  String get debugLocationLatitude => 'Latitudine';

  @override
  String get debugLocationLongitude => 'Longitudine';

  @override
  String get debugLocationApply => 'Mergi acolo';

  @override
  String get debugLocationClear => 'Folosește locația reală';

  @override
  String get debugLocationActive => 'Locație de test activă';

  @override
  String get commonClose => 'Închide';

  @override
  String get placesEmptyTitle => 'Încă niciun loc';

  @override
  String get placesEmptyBody =>
      'Locurile apar după ce fotografiile tale au fost indexate.';

  @override
  String get placesSortLabel => 'Sortează după';

  @override
  String get placesSortLongestAgo => 'Cel mai de demult';

  @override
  String get placesSortMostPhotos => 'Cele mai multe fotografii';

  @override
  String get placesSortNearest => 'Cel mai aproape';

  @override
  String placesMutedSection(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de locuri silențioase',
      few: '$count locuri silențioase',
      one: '$count loc silențios',
    );
    return '$_temp0';
  }

  @override
  String get placesMute => 'Dezactivează notificările';

  @override
  String get placesUnmute => 'Reactivează notificările';

  @override
  String get placesUseAutoRule => 'Decide automat';

  @override
  String get placesAutoMutedNote =>
      'Silențios automat — ești aici aproape zilnic';

  @override
  String get placesUserMutedNote => 'Făcut silențios de tine';

  @override
  String get placesUserUnmutedNote => 'Păstrat vizibil de tine';

  @override
  String placesDayCount(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days de zile',
      few: '$days zile',
      one: '$days zi',
    );
    return '$_temp0';
  }

  @override
  String get settingsPlaceNamesTitle => 'Denumește locurile';

  @override
  String get settingsPlaceNamesBody =>
      'Cere sistemului să transforme coordonatele unui loc într-un nume. Coordonata ajunge la Apple sau Google — este singurul lucru din această aplicație care părăsește telefonul. Dezactivat implicit; dezactivarea din nou uită toate numele.';

  @override
  String get settingsAutoMuteTitle =>
      'Fă silențioase locurile de zi cu zi după';

  @override
  String get settingsAutoMuteBody =>
      'Un loc cu fotografii din atâtea zile diferite este un loc în care locuiești, nu unul pe care îl vizitezi.';

  @override
  String settingsAutoMuteValue(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days de zile',
      few: '$days zile',
    );
    return '$_temp0';
  }

  @override
  String get settingsIndexTitle => 'Indexul fotografiilor';

  @override
  String get settingsReindex => 'Indexează din nou de la zero';

  @override
  String get settingsPrivacyTitle => 'Ce rămâne pe acest telefon';

  @override
  String get settingsPrivacyBody =>
      'Fotografiile tale, unde au fost făcute și tot ce deduce aplicația din ele. Nu există cont, server sau analiză.';

  @override
  String get placesName => 'Denumește acest loc';

  @override
  String get placesRename => 'Redenumește';

  @override
  String get placesNameDialogTitle => 'Numele locului';

  @override
  String get placesNameHint => 'La bunica, lacul, biroul…';

  @override
  String get placesNameSave => 'Salvează';

  @override
  String get placesNameClear => 'Elimină numele';

  @override
  String placesSummary(String age, String photos) {
    return '$age · $photos';
  }

  @override
  String get notificationTitle => 'Ai mai fost aici';

  @override
  String notificationBody(String age, String photos) {
    return 'Ultima dată aici: $age. $photos.';
  }

  @override
  String get alwaysLocationTitle => 'Lasă Been Here să observe în locul tău';

  @override
  String get alwaysLocationBody =>
      'Cu locația în fundal, telefonul poate anunța Been Here când ajungi undeva unde ai mai fotografiat — iar aplicația îți poate spune asta o dată, fără să deschizi nimic.\n\nAplicația nu te urmărește niciodată. Telefonul supraveghează câteva cercuri și trezește aplicația doar când intri în unul dintre ele. Nimic despre locul în care te afli nu părăsește acest dispozitiv.';

  @override
  String get alwaysLocationAction => 'Activează sosirile';

  @override
  String get alwaysLocationLater => 'Nu acum';

  @override
  String get alwaysLocationDeniedBody =>
      'Locația în fundal este dezactivată, așa că sosirile rămân tăcute. Restul funcționează ca înainte; o poți activa din setările sistemului oricând vrei.';

  @override
  String get settingsArrivalsTitle => 'Sosiri';

  @override
  String get settingsArrivalsOn =>
      'Been Here te anunță când ajungi undeva unde n-ai mai fotografiat de ceva vreme.';

  @override
  String get settingsArrivalsOff =>
      'Been Here tace. Activarea cere locația în fundal.';

  @override
  String get settingsMemoryAgeTitle => 'Menționează doar locuri mai vechi de';

  @override
  String settingsMemoryAgeValue(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days de zile',
      few: '$days zile',
      one: '$days zi',
    );
    return '$_temp0';
  }

  @override
  String get settingsPlaceCooldownTitle => 'Apoi lasă locul în pace timp de';

  @override
  String get settingsDailyLimitTitle => 'Și nu spune nimic timp de';

  @override
  String settingsDailyLimitValue(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours de ore',
      few: '$hours ore',
      one: '$hours oră',
      zero: 'deloc',
    );
    return '$_temp0';
  }

  @override
  String get settingsThresholdsBody =>
      'Scade aceste valori ca să încerci sosirile fără să aștepți jumătate de an.';

  @override
  String get placesTestArrival => 'Testează o sosire aici';

  @override
  String get arrivalTestNotified => 'Notificare trimisă';

  @override
  String get arrivalTestMuted => 'Nimic: locul este silențios';

  @override
  String get arrivalTestTooFewPhotos => 'Nimic: prea puține fotografii aici';

  @override
  String get arrivalTestTooRecent => 'Nimic: ai fotografiat aici prea recent';

  @override
  String get arrivalTestPlaceCooldown => 'Nimic: acest loc a vorbit recent';

  @override
  String get arrivalTestDailyLimit => 'Nimic: altceva a vorbit deja azi';

  @override
  String get alwaysLocationNeedsSettingsBody =>
      'Telefonul a lăsat locația pe „Cât timp folosesc aplicația”. iOS nu mai oferă alegerea din interiorul unei aplicații, așa că locația în fundal trebuie trecută pe „Întotdeauna” din setările sistemului — apoi sosirile încep să funcționeze.';

  @override
  String get commonOpenSettings => 'Deschide setările';

  @override
  String get settingsArrivalsPending =>
      'Aproape: locația este încă pe „Cât timp folosesc aplicația”. Trece-o pe „Întotdeauna” din setările sistemului.';

  @override
  String get placesSortVisits => 'Cele mai multe vizite';

  @override
  String get placesSortAscending => 'Ordine inversă';

  @override
  String placesVisitCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de vizite',
      few: '$count vizite',
      one: '$count vizită',
      zero: 'niciodată',
    );
    return '$_temp0';
  }

  @override
  String get settingsMapTitle => 'Arată locurile pe o hartă';

  @override
  String get settingsMapBody =>
      'Plăcile hărții se descarcă de la OpenStreetMap pe măsură ce derulezi și mărești, așa că acel server vede continuu unde te uiți. Spre deosebire de numele unui loc, cerut o singură dată, asta continuă cât timp harta e deschisă. Dezactivat implicit.';

  @override
  String get placesShowMap => 'Hartă';

  @override
  String get placesShowList => 'Listă';

  @override
  String get placesMapAttribution => '© Contribuitorii OpenStreetMap';

  @override
  String get rephotoOverlay => 'Estompare';

  @override
  String get rephotoEdges => 'Contur';

  @override
  String get rephotoCapture => 'Fă-o';

  @override
  String get rephotoSaved => 'Salvată în fotografiile tale';

  @override
  String get rephotoNotSaved =>
      'Nu s-a putut salva. Adăugarea de fotografii poate fi dezactivată.';

  @override
  String get rephotoNoCamera =>
      'Nicio cameră disponibilă. Been Here are nevoie de cameră ca să facă o fotografie care să răspundă uneia vechi.';

  @override
  String get rephotoThenAndNow => 'Atunci și acum';

  @override
  String get rephotoShare => 'Distribuie';

  @override
  String get rephotoThen => 'Atunci';

  @override
  String get rephotoNow => 'Acum';

  @override
  String get rephotoShareFailed => 'Nu s-a putut crea imaginea de distribuit.';

  @override
  String get onboardingSkip => 'Omite';

  @override
  String get onboardingNext => 'Înainte';

  @override
  String get onboardingWhatTitle => 'Fotografii din locul exact în care stai';

  @override
  String get onboardingWhatBody =>
      'Ajungi undeva unde ai mai fotografiat și Been Here îți arată ce ai făcut acolo — vizită cu vizită, cea mai veche întâi.';

  @override
  String get onboardingPrivacyTitle => 'Nimic nu părăsește telefonul';

  @override
  String get onboardingPrivacyBody =>
      'Fără cont, fără server, fără analiză. Been Here îți citește biblioteca foto pe dispozitiv și păstrează alături un mic index. Fotografiile tale, și locul în care au fost făcute, rămân unde sunt.';

  @override
  String get onboardingPrivacyFootnote =>
      'Două lucruri pot ajunge în rețea și ambele sunt dezactivate până le activezi: numele locurilor și harta.';

  @override
  String get onboardingPhotosTitle => 'Are nevoie de fotografiile tale';

  @override
  String get onboardingPhotosBody =>
      'Been Here notează ce fotografie a fost făcută unde. Nu copiază și nu mută niciodată nimic — reține ID-uri și coordonate și citește imaginile doar când ți le arată.';

  @override
  String get onboardingPhotosAction => 'Permite fotografiile';

  @override
  String get onboardingDone => 'Începe';

  @override
  String get settingsAboutTitle => 'Despre';

  @override
  String settingsVersion(String version, String build) {
    return 'Versiunea $version ($build)';
  }

  @override
  String get settingsSourceTitle => 'Cod sursă';

  @override
  String get settingsShowIntro => 'Arată din nou introducerea';

  @override
  String photoSemanticLabel(String date) {
    return 'Fotografie din $date';
  }

  @override
  String photoOpenSemanticLabel(int index, int total, String date) {
    return 'Fotografia $index din $total, $date';
  }

  @override
  String get placesActionsLabel => 'Ce să faci cu acest loc';

  @override
  String get radiusSemanticLabel => 'Raza de căutare';

  @override
  String get hereMapTitle => 'Pe aici';

  @override
  String get hereOpenInMaps => 'Deschide în Hărți';

  @override
  String get hereBackToMe => 'Înapoi la poziția mea';

  @override
  String get herePlaceFallbackTitle => 'Un loc pe care îl cunoști';

  @override
  String get arrivalTestNearHome => 'Prea aproape de casă ca să fie o noutate.';

  @override
  String get settingsHomeRadiusTitle => 'Taci pe o rază de';

  @override
  String settingsHomeRadiusValue(num km) {
    String _temp0 = intl.Intl.pluralLogic(
      km,
      locale: localeName,
      other: '$km km de casă',
      few: '$km km de casă',
      one: '$km km de casă',
      zero: 'zero — niciodată tăcut',
    );
    return '$_temp0';
  }

  @override
  String get settingsHomeRadiusBody =>
      'Viața de zi cu zi se petrece aproape de casă și tocmai acolo un telefon care o comentează e cel mai puțin binevenit. Locurile mai apropiate de atât nu sunt urmărite niciodată.';

  @override
  String get settingsQuietTitle => 'De ce e liniște';

  @override
  String settingsQuietWatching(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de locuri urmărite',
      few: '$count locuri urmărite',
      one: '$count loc urmărit',
      zero: 'Niciun loc urmărit',
    );
    return '$_temp0';
  }

  @override
  String settingsQuietNearest(String distance) {
    return 'Cel mai apropiat loc urmărit: $distance';
  }

  @override
  String get settingsQuietNothingWatched =>
      'Nimic nu e urmărit, deci nu poate apărea nicio sosire.';

  @override
  String settingsQuietLastNotified(String when) {
    return 'Ultima notificare: $when';
  }

  @override
  String get settingsQuietNever => 'niciodată';

  @override
  String settingsQuietBreakdown(int total, String reasons) {
    return 'Din $total locuri: $reasons';
  }

  @override
  String settingsQuietReasonMuted(Object count) {
    return 'silențioase: $count';
  }

  @override
  String settingsQuietReasonNearHome(Object count) {
    return 'aproape de casă: $count';
  }

  @override
  String settingsQuietReasonTooFewPhotos(Object count) {
    return 'prea puține fotografii: $count';
  }

  @override
  String settingsQuietReasonTooRecent(Object count) {
    return 'fotografiate recent: $count';
  }

  @override
  String settingsQuietReasonPlaceCooldown(Object count) {
    return 'încă în pauză: $count';
  }

  @override
  String settingsQuietReasonEligible(Object count) {
    return 'merită urmărite: $count';
  }

  @override
  String get ageSemanticLabel => 'Vechimea fotografiilor';

  @override
  String get ageStopNow => 'acum';

  @override
  String get ageStopDay => '1 zi';

  @override
  String get ageStop3Days => '3 zile';

  @override
  String get ageStopWeek => '1 săptămână';

  @override
  String get ageStop2Weeks => '2 săptămâni';

  @override
  String get ageStopMonth => '1 lună';

  @override
  String get ageStop3Months => '3 luni';

  @override
  String get ageStop6Months => '6 luni';

  @override
  String get ageStopYear => '1 an';

  @override
  String get ageStop2Years => '2 ani';

  @override
  String get ageStop5Years => '5 ani';

  @override
  String get ageStop10Years => '10 ani';

  @override
  String get ageStopAll => 'toate';

  @override
  String get ageWindowAll => 'Toate fotografiile';

  @override
  String ageWindowNewerThan(String stop) {
    return 'Până la $stop';
  }

  @override
  String ageWindowOlderThan(String stop) {
    return 'Mai vechi de $stop';
  }

  @override
  String ageWindowBetween(String newest, String oldest) {
    return 'Între $newest și $oldest';
  }

  @override
  String get ageWindowReset => 'Resetează';

  @override
  String mapDotCountCapped(int count) {
    return '$count+ fotografii';
  }
}
