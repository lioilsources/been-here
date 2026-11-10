// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Slovenian (`sl`).
class AppLocalizationsSl extends AppLocalizations {
  AppLocalizationsSl([String locale = 'sl']) : super(locale);

  @override
  String get appTitle => 'Been Here';

  @override
  String get hereTabLabel => 'Tukaj';

  @override
  String get placesTabLabel => 'Kraji';

  @override
  String get settingsTabLabel => 'Nastavitve';

  @override
  String get hereEmptyTitle => 'Tukaj niste fotografirali';

  @override
  String get hereEmptyBody =>
      'Povečajte polmer iskanja ali se vrnite nekam, kjer ste že bili.';

  @override
  String get hereNotIndexedTitle => 'Nič še ni indeksirano';

  @override
  String get hereNotIndexedBody =>
      'Been Here mora enkrat prebrati vašo knjižnico fotografij, da ve, kje ste bili. Nič ne zapusti vašega telefona.';

  @override
  String get indexStartAction => 'Indeksiraj moje fotografije';

  @override
  String get indexPermissionTitle => 'Been Here potrebuje vaše fotografije';

  @override
  String get indexPermissionBody =>
      'Bere samo, kje in kdaj je bila posneta vsaka fotografija, in to hrani v tem telefonu.';

  @override
  String get indexPermissionAction => 'Dovoli dostop';

  @override
  String get indexPermissionDeniedTitle => 'Dostop do fotografij je izklopljen';

  @override
  String get indexPermissionDeniedBody =>
      'Brez njega vam Been Here ne more pokazati ničesar. Vklopite ga lahko v sistemskih nastavitvah.';

  @override
  String get indexLimitedAccessNotice =>
      'Delili ste le izbrane fotografije, zato jih Been Here vidi samo te. S polnim dostopom najde vsak kraj, kjer ste bili.';

  @override
  String get indexRunningTitle => 'Branje knjižnice fotografij';

  @override
  String indexRunningProgress(int processed, int total) {
    return '$processed od $total';
  }

  @override
  String get indexFailedTitle => 'Indeksiranje se je ustavilo';

  @override
  String get indexFailedBody =>
      'Med potekom je šlo nekaj narobe. Ponovni poskus nadaljuje tam, kjer se je ustavilo.';

  @override
  String indexedPhotoCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count indeksiranih fotografij',
      few: '$count indeksirane fotografije',
      two: '$count indeksirani fotografiji',
      one: '$count indeksirana fotografija',
      zero: 'Ni indeksiranih fotografij',
    );
    return '$_temp0';
  }

  @override
  String indexedLocationCoverage(int percent) {
    return '$percent % jih ima lokacijo';
  }

  @override
  String get commonLoading => 'Nalaganje …';

  @override
  String get commonRetry => 'Poskusi znova';

  @override
  String get commonCancel => 'Prekliči';

  @override
  String hereRadiusLabel(String radius) {
    return 'Znotraj $radius';
  }

  @override
  String herePhotoCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotografij',
      few: '$count fotografije',
      two: '$count fotografiji',
      one: '$count fotografija',
      zero: 'Ni fotografij',
    );
    return '$_temp0';
  }

  @override
  String hereVisitCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count obiskov',
      few: '$count obiski',
      two: '$count obiska',
      one: '$count obisk',
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
  String get ageToday => 'Danes';

  @override
  String get ageYesterday => 'Včeraj';

  @override
  String ageDaysAgo(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Pred $days dnevi',
      two: 'Pred $days dnevoma',
      one: 'Pred $days dnem',
    );
    return '$_temp0';
  }

  @override
  String ageMonthsAgo(int months) {
    String _temp0 = intl.Intl.pluralLogic(
      months,
      locale: localeName,
      other: 'Pred $months meseci',
      two: 'Pred $months mesecema',
      one: 'Pred $months mesecem',
    );
    return '$_temp0';
  }

  @override
  String ageYearsAgo(int years) {
    String _temp0 = intl.Intl.pluralLogic(
      years,
      locale: localeName,
      other: 'Pred $years leti',
      two: 'Pred $years letoma',
      one: 'Pred $years letom',
    );
    return '$_temp0';
  }

  @override
  String get locationPermissionTitle => 'Kje ste?';

  @override
  String get locationPermissionBody =>
      'Been Here primerja vaš položaj s kraji, kjer so nastale vaše fotografije. Primerjava poteka v tem telefonu.';

  @override
  String get locationPermissionAction => 'Uporabi mojo lokacijo';

  @override
  String get locationDeniedTitle => 'Lokacija je izklopljena';

  @override
  String get locationDeniedBody =>
      'Brez nje aplikacija ne ve, kaj imate tukaj. Vklopite jo lahko v sistemskih nastavitvah.';

  @override
  String get locationUnavailableTitle => 'Položaja še ni';

  @override
  String get locationUnavailableBody =>
      'Telefon še ni ugotovil, kje je. V zaprtih prostorih lahko to traja nekaj časa.';

  @override
  String get locationServicesDisabledTitle =>
      'Lokacijske storitve so izklopljene';

  @override
  String get locationServicesDisabledBody =>
      'Vklopite jih v sistemskih nastavitvah in se vrnite.';

  @override
  String get hereNothingTitle => 'Tukaj niste fotografirali';

  @override
  String get hereNothingBody =>
      'Poskusite večji polmer ali se vrnite nekam, kjer ste že bili.';

  @override
  String hereNearestHint(String distance) {
    return 'Vaš najbližji spomin je oddaljen $distance.';
  }

  @override
  String get photoDetailRephoto => 'Ponovno fotografiraj';

  @override
  String get photoDetailRephotoSoon =>
      'Ponovno fotografiranje pride v poznejši različici.';

  @override
  String photoDetailOf(int index, int total) {
    return '$index od $total';
  }

  @override
  String get debugLocationTitle => 'Testna lokacija';

  @override
  String get debugLocationBody =>
      'Pretvarjajte se, da ste drugje, da lahko zaslon Tukaj preizkusite s kavča.';

  @override
  String get debugLocationLatitude => 'Zemljepisna širina';

  @override
  String get debugLocationLongitude => 'Zemljepisna dolžina';

  @override
  String get debugLocationApply => 'Pojdi tja';

  @override
  String get debugLocationClear => 'Uporabi pravo lokacijo';

  @override
  String get debugLocationActive => 'Testna lokacija je vklopljena';

  @override
  String get commonClose => 'Zapri';

  @override
  String get placesEmptyTitle => 'Krajev še ni';

  @override
  String get placesEmptyBody =>
      'Kraji se prikažejo, ko so fotografije indeksirane.';

  @override
  String get placesSortLabel => 'Razvrsti po';

  @override
  String get placesSortLongestAgo => 'Najdlje od obiska';

  @override
  String get placesSortMostPhotos => 'Največ fotografij';

  @override
  String get placesSortNearest => 'Najbližje';

  @override
  String placesMutedSection(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Utišani kraji: $count',
      one: '$count utišan kraj',
    );
    return '$_temp0';
  }

  @override
  String get placesMute => 'Utišaj';

  @override
  String get placesUnmute => 'Prekliči utišanje';

  @override
  String get placesUseAutoRule => 'Odloči samodejno';

  @override
  String get placesAutoMutedNote =>
      'Samodejno utišano – tukaj ste skoraj vsak dan';

  @override
  String get placesUserMutedNote => 'Utišali ste vi';

  @override
  String get placesUserUnmutedNote => 'Vidno ste pustili vi';

  @override
  String placesDayCount(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days dni',
      few: '$days dnevi',
      two: '$days dneva',
      one: '$days dan',
    );
    return '$_temp0';
  }

  @override
  String get settingsPlaceNamesTitle => 'Poimenuj kraje';

  @override
  String get settingsPlaceNamesBody =>
      'Sistem prosi, naj koordinate kraja pretvori v ime. Te koordinate gredo k Applu ali Googlu – to je edino v tej aplikaciji, kar zapusti vaš telefon. Privzeto izklopljeno; ko ga znova izklopite, se pozabijo vsa imena.';

  @override
  String get settingsAutoMuteTitle => 'Utišaj vsakdanje kraje po';

  @override
  String get settingsAutoMuteBody =>
      'Kraj s fotografijami iz toliko različnih dni je kraj, kjer živite, ne kraj, ki ga obiščete.';

  @override
  String settingsAutoMuteValue(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days dneh',
      two: '$days dnevih',
      one: '$days dnevu',
    );
    return '$_temp0';
  }

  @override
  String get settingsIndexTitle => 'Indeks fotografij';

  @override
  String get settingsReindex => 'Indeksiraj znova od začetka';

  @override
  String get settingsPrivacyTitle => 'Kaj ostane v tem telefonu';

  @override
  String get settingsPrivacyBody =>
      'Vaše fotografije, kje so nastale, in vse, kar aplikacija iz njih razbere. Ni računa, ni strežnika in ni analitike.';

  @override
  String get placesName => 'Poimenuj ta kraj';

  @override
  String get placesRename => 'Preimenuj';

  @override
  String get placesNameDialogTitle => 'Ime kraja';

  @override
  String get placesNameHint => 'Pri babici, jezero, pisarna …';

  @override
  String get placesNameSave => 'Shrani';

  @override
  String get placesNameClear => 'Odstrani ime';

  @override
  String placesSummary(String age, String photos) {
    return '$age · $photos';
  }

  @override
  String get notificationTitle => 'Tukaj ste že bili';

  @override
  String notificationBody(String age, String photos) {
    return 'Zadnjič tukaj: $age. $photos.';
  }

  @override
  String get alwaysLocationTitle => 'Naj Been Here opazi namesto vas';

  @override
  String get alwaysLocationBody =>
      'Z lokacijo v ozadju lahko telefon obvesti Been Here, ko pridete nekam, kjer ste že fotografirali – in aplikacija vam to lahko pove enkrat, ne da bi kar koli odprli.\n\nAplikacija vam nikoli ne sledi. Telefon spremlja peščico krogov in aplikacijo zbudi samo, ko vstopite v enega od njih. Nič o tem, kje ste, ne zapusti te naprave.';

  @override
  String get alwaysLocationAction => 'Vklopi prihode';

  @override
  String get alwaysLocationLater => 'Ne zdaj';

  @override
  String get alwaysLocationDeniedBody =>
      'Lokacija v ozadju je izklopljena, zato prihodi molčijo. Vse drugo deluje kot prej; vklopite jo lahko v sistemskih nastavitvah, kadar koli želite.';

  @override
  String get settingsArrivalsTitle => 'Prihodi';

  @override
  String get settingsArrivalsOn =>
      'Been Here vam bo povedal, ko pridete nekam, kjer že dolgo niste fotografirali.';

  @override
  String get settingsArrivalsOff =>
      'Been Here molči. Vklop zahteva lokacijo v ozadju.';

  @override
  String get settingsMemoryAgeTitle => 'Omenjaj le kraje, starejše od';

  @override
  String settingsMemoryAgeValue(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days dni',
      few: '$days dnevi',
      two: '$days dneva',
      one: '$days dan',
    );
    return '$_temp0';
  }

  @override
  String get settingsPlaceCooldownTitle => 'Nato pusti ta kraj pri miru za';

  @override
  String get settingsDailyLimitTitle => 'In ne reci ničesar za';

  @override
  String settingsDailyLimitValue(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours ur',
      few: '$hours ure',
      two: '$hours uri',
      one: '$hours uro',
      zero: 'nič časa',
    );
    return '$_temp0';
  }

  @override
  String get settingsThresholdsBody =>
      'Znižajte te vrednosti, da preizkusite prihode, ne da bi čakali pol leta.';

  @override
  String get placesTestArrival => 'Preizkusi prihod sem';

  @override
  String get arrivalTestNotified => 'Obvestilo poslano';

  @override
  String get arrivalTestMuted => 'Nič: kraj je utišan';

  @override
  String get arrivalTestTooFewPhotos => 'Nič: tukaj je premalo fotografij';

  @override
  String get arrivalTestTooRecent =>
      'Nič: tukaj ste fotografirali pred kratkim';

  @override
  String get arrivalTestPlaceCooldown =>
      'Nič: ta kraj se je oglasil pred kratkim';

  @override
  String get arrivalTestDailyLimit =>
      'Nič: danes se je oglasilo že nekaj drugega';

  @override
  String get alwaysLocationNeedsSettingsBody =>
      'Telefon je lokacijo pustil na »Med uporabo aplikacije«. iOS te izbire v aplikaciji ne ponudi znova, zato je treba lokacijo v ozadju v sistemskih nastavitvah preklopiti na »Vedno« – potem začnejo prihodi delovati.';

  @override
  String get commonOpenSettings => 'Odpri nastavitve';

  @override
  String get settingsArrivalsPending =>
      'Skoraj: lokacija je še na »Med uporabo aplikacije«. V sistemskih nastavitvah jo nastavite na »Vedno«.';

  @override
  String get placesSortVisits => 'Največ obiskov';

  @override
  String get placesSortAscending => 'Obratni vrstni red';

  @override
  String placesVisitCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count obiskov',
      few: '$count obiski',
      two: '$count obiska',
      one: '$count obisk',
      zero: 'nikoli',
    );
    return '$_temp0';
  }

  @override
  String get settingsMapTitle => 'Prikaži kraje na zemljevidu';

  @override
  String get settingsMapBody =>
      'Ploščice zemljevida se prenašajo z OpenStreetMap, medtem ko premikate in povečujete, zato ta strežnik sproti vidi, kam gledate. Za razliko od imena kraja, ki se zahteva enkrat, to traja, dokler je zemljevid odprt. Privzeto izklopljeno.';

  @override
  String get placesShowMap => 'Zemljevid';

  @override
  String get placesShowList => 'Seznam';

  @override
  String get placesMapAttribution => '© Sodelavci OpenStreetMap';

  @override
  String get rephotoOverlay => 'Prelivanje';

  @override
  String get rephotoEdges => 'Obris';

  @override
  String get rephotoCapture => 'Posnemi';

  @override
  String get rephotoSaved => 'Shranjeno v fotografije';

  @override
  String get rephotoNotSaved =>
      'Shranjevanje ni uspelo. Dodajanje fotografij je morda izklopljeno.';

  @override
  String get rephotoNoCamera =>
      'Kamera ni na voljo. Been Here potrebuje kamero, da posname fotografijo, ki odgovarja na staro.';

  @override
  String get rephotoThenAndNow => 'Nekoč in zdaj';

  @override
  String get rephotoShare => 'Deli';

  @override
  String get rephotoThen => 'Nekoč';

  @override
  String get rephotoNow => 'Zdaj';

  @override
  String get rephotoShareFailed =>
      'Slike za deljenje ni bilo mogoče ustvariti.';

  @override
  String get onboardingSkip => 'Preskoči';

  @override
  String get onboardingNext => 'Naprej';

  @override
  String get onboardingWhatTitle => 'Fotografije s kraja, kjer stojite';

  @override
  String get onboardingWhatBody =>
      'Pridite nekam, kjer ste že fotografirali, in Been Here vam pokaže, kaj ste tam posneli – obisk za obiskom, najstarejši najprej.';

  @override
  String get onboardingPrivacyTitle => 'Nič ne zapusti vašega telefona';

  @override
  String get onboardingPrivacyBody =>
      'Brez računa, brez strežnika, brez analitike. Been Here bere vašo knjižnico fotografij v napravi in ob njej hrani majhen indeks. Vaše fotografije in kraji, kjer so nastale, ostanejo, kjer so.';

  @override
  String get onboardingPrivacyFootnote =>
      'Do omrežja lahko prideta dve stvari in obe sta izklopljeni, dokler ju ne vklopite: imena krajev in zemljevid.';

  @override
  String get onboardingPhotosTitle => 'Potrebuje vaše fotografije';

  @override
  String get onboardingPhotosBody =>
      'Been Here si zapiše, katera fotografija je nastala kje. Nikoli ničesar ne kopira ali premika – zapomni si identifikatorje in koordinate, same slike pa bere le, ko vam jih pokaže.';

  @override
  String get onboardingPhotosAction => 'Dovoli fotografije';

  @override
  String get onboardingDone => 'Začni';

  @override
  String get settingsAboutTitle => 'O aplikaciji';

  @override
  String settingsVersion(String version, String build) {
    return 'Različica $version ($build)';
  }

  @override
  String get settingsSourceTitle => 'Izvorna koda';

  @override
  String get settingsShowIntro => 'Znova pokaži uvod';

  @override
  String photoSemanticLabel(String date) {
    return 'Fotografija z dne $date';
  }

  @override
  String photoOpenSemanticLabel(int index, int total, String date) {
    return 'Fotografija $index od $total, $date';
  }

  @override
  String get placesActionsLabel => 'Kaj storiti s tem krajem';

  @override
  String get radiusSemanticLabel => 'Polmer iskanja';

  @override
  String get hereMapTitle => 'Tu okoli';

  @override
  String get hereOpenInMaps => 'Odpri v Zemljevidih';

  @override
  String get hereBackToMe => 'Nazaj na moj položaj';

  @override
  String get herePlaceFallbackTitle => 'Kraj, ki ga poznate';

  @override
  String get arrivalTestNearHome => 'Preblizu doma, da bi bila to novica.';

  @override
  String get settingsHomeRadiusTitle => 'Molči znotraj';

  @override
  String settingsHomeRadiusValue(num km) {
    String _temp0 = intl.Intl.pluralLogic(
      km,
      locale: localeName,
      other: '$km km od doma',
      one: '$km km od doma',
      zero: 'nič – nikoli ne molči',
    );
    return '$_temp0';
  }

  @override
  String get settingsHomeRadiusBody =>
      'Vsakdanje življenje poteka blizu doma in prav tam je telefon, ki ga komentira, najmanj dobrodošel. Kraji, bližji od tega, se nikoli ne spremljajo.';

  @override
  String get settingsQuietTitle => 'Zakaj je tiho';

  @override
  String settingsQuietWatching(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Spremljani kraji: $count',
      one: 'Spremlja se $count kraj',
      zero: 'Ne spremlja se noben kraj',
    );
    return '$_temp0';
  }

  @override
  String settingsQuietNearest(String distance) {
    return 'Najbližji spremljani kraj: $distance';
  }

  @override
  String get settingsQuietNothingWatched =>
      'Nič se ne spremlja, zato ne more priti do nobenega prihoda.';

  @override
  String settingsQuietLastNotified(String when) {
    return 'Zadnje obvestilo: $when';
  }

  @override
  String get settingsQuietNever => 'nikoli';

  @override
  String settingsQuietBreakdown(int total, String reasons) {
    return 'Od $total krajev: $reasons';
  }

  @override
  String settingsQuietReasonMuted(Object count) {
    return 'utišani: $count';
  }

  @override
  String settingsQuietReasonNearHome(Object count) {
    return 'blizu doma: $count';
  }

  @override
  String settingsQuietReasonTooFewPhotos(Object count) {
    return 'premalo fotografij: $count';
  }

  @override
  String settingsQuietReasonTooRecent(Object count) {
    return 'nedavno fotografirani: $count';
  }

  @override
  String settingsQuietReasonPlaceCooldown(Object count) {
    return 'še v premoru: $count';
  }

  @override
  String settingsQuietReasonEligible(Object count) {
    return 'vredni spremljanja: $count';
  }

  @override
  String get ageSemanticLabel => 'Starost fotografij';

  @override
  String get ageStopNow => 'zdaj';

  @override
  String get ageStopDay => '1 dan';

  @override
  String get ageStop3Days => '3 dnevi';

  @override
  String get ageStopWeek => '1 teden';

  @override
  String get ageStop2Weeks => '2 tedna';

  @override
  String get ageStopMonth => '1 mesec';

  @override
  String get ageStop3Months => '3 meseci';

  @override
  String get ageStop6Months => '6 mesecev';

  @override
  String get ageStopYear => '1 leto';

  @override
  String get ageStop2Years => '2 leti';

  @override
  String get ageStop5Years => '5 let';

  @override
  String get ageStop10Years => '10 let';

  @override
  String get ageStopAll => 'vse';

  @override
  String get ageWindowAll => 'Vse fotografije';

  @override
  String ageWindowNewerThan(String stop) {
    return 'Največ $stop';
  }

  @override
  String ageWindowOlderThan(String stop) {
    return 'Starejše od: $stop';
  }

  @override
  String ageWindowBetween(String newest, String oldest) {
    return 'Od $newest do $oldest';
  }

  @override
  String get ageWindowReset => 'Ponastavi';

  @override
  String mapDotCountCapped(int count) {
    return '$count+ fotografij';
  }
}
