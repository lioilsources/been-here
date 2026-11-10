// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Croatian (`hr`).
class AppLocalizationsHr extends AppLocalizations {
  AppLocalizationsHr([String locale = 'hr']) : super(locale);

  @override
  String get appTitle => 'Been Here';

  @override
  String get hereTabLabel => 'Ovdje';

  @override
  String get placesTabLabel => 'Mjesta';

  @override
  String get settingsTabLabel => 'Postavke';

  @override
  String get hereEmptyTitle => 'Ovdje niste fotografirali';

  @override
  String get hereEmptyBody =>
      'Povećajte radijus pretraživanja ili se vratite negdje gdje ste već bili.';

  @override
  String get hereNotIndexedTitle => 'Još ništa nije indeksirano';

  @override
  String get hereNotIndexedBody =>
      'Been Here mora jednom pročitati vašu fototeku da bi znao gdje ste bili. Ništa ne napušta vaš telefon.';

  @override
  String get indexStartAction => 'Indeksiraj moje fotografije';

  @override
  String get indexPermissionTitle => 'Been Here treba vaše fotografije';

  @override
  String get indexPermissionBody =>
      'Čita samo gdje i kada je snimljena svaka fotografija i to čuva na ovom telefonu.';

  @override
  String get indexPermissionAction => 'Dopusti pristup';

  @override
  String get indexPermissionDeniedTitle => 'Pristup fotografijama je isključen';

  @override
  String get indexPermissionDeniedBody =>
      'Bez njega vam Been Here ne može ništa pokazati. Možete ga uključiti u postavkama sustava.';

  @override
  String get indexLimitedAccessNotice =>
      'Podijelili ste samo odabrane fotografije pa Been Here vidi samo njih. S punim pristupom može pronaći svako mjesto na kojem ste bili.';

  @override
  String get indexRunningTitle => 'Čitanje fototeke';

  @override
  String indexRunningProgress(int processed, int total) {
    return '$processed od $total';
  }

  @override
  String get indexFailedTitle => 'Indeksiranje je zaustavljeno';

  @override
  String get indexFailedBody =>
      'Nešto je pošlo po zlu usred posla. Novi pokušaj nastavlja gdje je stalo.';

  @override
  String indexedPhotoCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotografija indeksirano',
      few: '$count fotografije indeksirane',
      one: '$count fotografija indeksirana',
      zero: 'Nema indeksiranih fotografija',
    );
    return '$_temp0';
  }

  @override
  String indexedLocationCoverage(int percent) {
    return '$percent % njih ima lokaciju';
  }

  @override
  String get commonLoading => 'Učitavanje…';

  @override
  String get commonRetry => 'Pokušaj ponovno';

  @override
  String get commonCancel => 'Odustani';

  @override
  String hereRadiusLabel(String radius) {
    return 'Unutar $radius';
  }

  @override
  String herePhotoCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotografija',
      few: '$count fotografije',
      one: '$count fotografija',
      zero: 'Nema fotografija',
    );
    return '$_temp0';
  }

  @override
  String hereVisitCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count posjeta',
      few: '$count posjeta',
      one: '$count posjet',
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
  String get ageToday => 'Danas';

  @override
  String get ageYesterday => 'Jučer';

  @override
  String ageDaysAgo(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Prije $days dana',
      one: 'Prije $days dan',
    );
    return '$_temp0';
  }

  @override
  String ageMonthsAgo(int months) {
    String _temp0 = intl.Intl.pluralLogic(
      months,
      locale: localeName,
      other: 'Prije $months mjeseci',
      few: 'Prije $months mjeseca',
      one: 'Prije $months mjesec',
    );
    return '$_temp0';
  }

  @override
  String ageYearsAgo(int years) {
    String _temp0 = intl.Intl.pluralLogic(
      years,
      locale: localeName,
      other: 'Prije $years godina',
      few: 'Prije $years godine',
      one: 'Prije $years godinu',
    );
    return '$_temp0';
  }

  @override
  String get locationPermissionTitle => 'Gdje ste?';

  @override
  String get locationPermissionBody =>
      'Been Here uspoređuje vaš položaj s mjestima na kojima su snimljene vaše fotografije. Usporedba se odvija na ovom telefonu.';

  @override
  String get locationPermissionAction => 'Koristi moju lokaciju';

  @override
  String get locationDeniedTitle => 'Lokacija je isključena';

  @override
  String get locationDeniedBody =>
      'Bez nje aplikacija ne zna što ovdje imate. Možete je uključiti u postavkama sustava.';

  @override
  String get locationUnavailableTitle => 'Još nema položaja';

  @override
  String get locationUnavailableBody =>
      'Telefon još nije utvrdio gdje se nalazi. U zatvorenom to može potrajati.';

  @override
  String get locationServicesDisabledTitle => 'Usluge lokacije su isključene';

  @override
  String get locationServicesDisabledBody =>
      'Uključite ih u postavkama sustava i vratite se.';

  @override
  String get hereNothingTitle => 'Ovdje niste fotografirali';

  @override
  String get hereNothingBody =>
      'Pokušajte s većim radijusom ili se vratite negdje gdje ste već bili.';

  @override
  String hereNearestHint(String distance) {
    return 'Vaša najbliža uspomena udaljena je $distance.';
  }

  @override
  String get photoDetailRephoto => 'Ponovno snimi';

  @override
  String get photoDetailRephotoSoon =>
      'Ponovno snimanje stiže u kasnijoj verziji.';

  @override
  String photoDetailOf(int index, int total) {
    return '$index od $total';
  }

  @override
  String get debugLocationTitle => 'Testna lokacija';

  @override
  String get debugLocationBody =>
      'Pretvarajte se da ste negdje drugdje kako biste zaslon Ovdje testirali s kauča.';

  @override
  String get debugLocationLatitude => 'Zemljopisna širina';

  @override
  String get debugLocationLongitude => 'Zemljopisna dužina';

  @override
  String get debugLocationApply => 'Idi tamo';

  @override
  String get debugLocationClear => 'Koristi stvarnu lokaciju';

  @override
  String get debugLocationActive => 'Testna lokacija je aktivna';

  @override
  String get commonClose => 'Zatvori';

  @override
  String get placesEmptyTitle => 'Još nema mjesta';

  @override
  String get placesEmptyBody =>
      'Mjesta se pojavljuju kad se vaše fotografije indeksiraju.';

  @override
  String get placesSortLabel => 'Poredaj po';

  @override
  String get placesSortLongestAgo => 'Najdavnije';

  @override
  String get placesSortMostPhotos => 'Najviše fotografija';

  @override
  String get placesSortNearest => 'Najbliže';

  @override
  String placesMutedSection(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count utišanih mjesta',
      few: '$count utišana mjesta',
      one: '$count utišano mjesto',
    );
    return '$_temp0';
  }

  @override
  String get placesMute => 'Utišaj';

  @override
  String get placesUnmute => 'Poništi utišavanje';

  @override
  String get placesUseAutoRule => 'Odluči automatski';

  @override
  String get placesAutoMutedNote =>
      'Automatski utišano – ovdje ste gotovo svaki dan';

  @override
  String get placesUserMutedNote => 'Utišali ste vi';

  @override
  String get placesUserUnmutedNote => 'Vidljivim ste ostavili vi';

  @override
  String placesDayCount(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days dana',
      one: '$days dan',
    );
    return '$_temp0';
  }

  @override
  String get settingsPlaceNamesTitle => 'Imenuj mjesta';

  @override
  String get settingsPlaceNamesBody =>
      'Traži od sustava da koordinate mjesta pretvori u naziv. Ta koordinata ide Appleu ili Googleu – to je jedino u ovoj aplikaciji što napušta vaš telefon. Zadano isključeno; ponovnim isključivanjem zaboravljaju se svi nazivi.';

  @override
  String get settingsAutoMuteTitle => 'Utišaj svakodnevna mjesta nakon';

  @override
  String get settingsAutoMuteBody =>
      'Mjesto s fotografijama iz toliko različitih dana mjesto je gdje živite, a ne mjesto koje posjećujete.';

  @override
  String settingsAutoMuteValue(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days dana',
      one: '$days dana',
    );
    return '$_temp0';
  }

  @override
  String get settingsIndexTitle => 'Indeks fotografija';

  @override
  String get settingsReindex => 'Indeksiraj ispočetka';

  @override
  String get settingsPrivacyTitle => 'Što ostaje na ovom telefonu';

  @override
  String get settingsPrivacyBody =>
      'Vaše fotografije, gdje su snimljene i sve što ova aplikacija iz njih zaključi. Nema računa, poslužitelja ni analitike.';

  @override
  String get placesName => 'Imenuj ovo mjesto';

  @override
  String get placesRename => 'Preimenuj';

  @override
  String get placesNameDialogTitle => 'Naziv mjesta';

  @override
  String get placesNameHint => 'Kod bake, jezero, ured…';

  @override
  String get placesNameSave => 'Spremi';

  @override
  String get placesNameClear => 'Ukloni naziv';

  @override
  String placesSummary(String age, String photos) {
    return '$age · $photos';
  }

  @override
  String get notificationTitle => 'Ovdje ste već bili';

  @override
  String notificationBody(String age, String photos) {
    return 'Zadnji put ovdje: $age. $photos.';
  }

  @override
  String get alwaysLocationTitle => 'Neka Been Here primijeti umjesto vas';

  @override
  String get alwaysLocationBody =>
      'S lokacijom u pozadini telefon može javiti Been Hereu kad stignete negdje gdje ste već fotografirali – a aplikacija vam to može reći jednom, bez da išta otvarate.\n\nAplikacija vas nikad ne prati. Telefon nadzire nekoliko krugova i budi aplikaciju samo kad uđete u jedan od njih. Ništa o tome gdje ste ne napušta ovaj uređaj.';

  @override
  String get alwaysLocationAction => 'Uključi dolaske';

  @override
  String get alwaysLocationLater => 'Ne sada';

  @override
  String get alwaysLocationDeniedBody =>
      'Lokacija u pozadini je isključena pa dolasci šute. Sve ostalo radi kao i prije; možete je uključiti u postavkama sustava kad god želite.';

  @override
  String get settingsArrivalsTitle => 'Dolasci';

  @override
  String get settingsArrivalsOn =>
      'Been Here će vam javiti kad stignete negdje gdje dugo niste fotografirali.';

  @override
  String get settingsArrivalsOff =>
      'Been Here šuti. Uključivanje traži lokaciju u pozadini.';

  @override
  String get settingsMemoryAgeTitle => 'Spominji samo mjesta starija od';

  @override
  String settingsMemoryAgeValue(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days dana',
      one: '$days dan',
    );
    return '$_temp0';
  }

  @override
  String get settingsPlaceCooldownTitle => 'Zatim ostavi to mjesto na miru';

  @override
  String get settingsDailyLimitTitle => 'I ne govori ništa';

  @override
  String settingsDailyLimitValue(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours sati',
      few: '$hours sata',
      one: '$hours sat',
      zero: 'nimalo',
    );
    return '$_temp0';
  }

  @override
  String get settingsThresholdsBody =>
      'Smanjite ove vrijednosti da isprobate dolaske bez čekanja pola godine.';

  @override
  String get placesTestArrival => 'Testiraj dolazak ovdje';

  @override
  String get arrivalTestNotified => 'Obavijest poslana';

  @override
  String get arrivalTestMuted => 'Ništa: mjesto je utišano';

  @override
  String get arrivalTestTooFewPhotos => 'Ništa: premalo fotografija ovdje';

  @override
  String get arrivalTestTooRecent =>
      'Ništa: ovdje ste fotografirali prenedavno';

  @override
  String get arrivalTestPlaceCooldown => 'Ništa: ovo se mjesto nedavno javilo';

  @override
  String get arrivalTestDailyLimit => 'Ništa: danas se već javilo nešto drugo';

  @override
  String get alwaysLocationNeedsSettingsBody =>
      'Telefon je ostavio lokaciju na „Tijekom upotrebe aplikacije”. iOS taj izbor ne nudi ponovno iz aplikacije, pa lokaciju u pozadini treba prebaciti na „Uvijek” u postavkama sustava – tada dolasci počinju raditi.';

  @override
  String get commonOpenSettings => 'Otvori postavke';

  @override
  String get settingsArrivalsPending =>
      'Skoro: lokacija je još na „Tijekom upotrebe aplikacije”. Postavite je na „Uvijek” u postavkama sustava.';

  @override
  String get placesSortVisits => 'Najviše posjeta';

  @override
  String get placesSortAscending => 'Obrnuti redoslijed';

  @override
  String placesVisitCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count posjeta',
      one: '$count posjet',
      zero: 'nikad',
    );
    return '$_temp0';
  }

  @override
  String get settingsMapTitle => 'Prikaži mjesta na karti';

  @override
  String get settingsMapBody =>
      'Pločice karte preuzimaju se s OpenStreetMapa dok pomičete i zumirate, pa taj poslužitelj neprekidno vidi kamo gledate. Za razliku od naziva mjesta, koji se traži jednom, ovo traje dok je karta otvorena. Zadano isključeno.';

  @override
  String get placesShowMap => 'Karta';

  @override
  String get placesShowList => 'Popis';

  @override
  String get placesMapAttribution => '© Suradnici OpenStreetMapa';

  @override
  String get rephotoOverlay => 'Pretapanje';

  @override
  String get rephotoEdges => 'Obris';

  @override
  String get rephotoCapture => 'Snimi';

  @override
  String get rephotoSaved => 'Spremljeno u fotografije';

  @override
  String get rephotoNotSaved =>
      'Spremanje nije uspjelo. Dodavanje fotografija možda je isključeno.';

  @override
  String get rephotoNoCamera =>
      'Kamera nije dostupna. Been Here treba kameru da snimi fotografiju koja odgovara na staru.';

  @override
  String get rephotoThenAndNow => 'Nekad i sad';

  @override
  String get rephotoShare => 'Podijeli';

  @override
  String get rephotoThen => 'Nekad';

  @override
  String get rephotoNow => 'Sad';

  @override
  String get rephotoShareFailed =>
      'Slika za dijeljenje nije mogla biti izrađena.';

  @override
  String get onboardingSkip => 'Preskoči';

  @override
  String get onboardingNext => 'Dalje';

  @override
  String get onboardingWhatTitle => 'Fotografije s mjesta na kojem stojite';

  @override
  String get onboardingWhatBody =>
      'Dođite negdje gdje ste već fotografirali i Been Here pokazat će vam što ste ondje snimili – posjet po posjet, najstariji prvi.';

  @override
  String get onboardingPrivacyTitle => 'Ništa ne napušta vaš telefon';

  @override
  String get onboardingPrivacyBody =>
      'Bez računa, bez poslužitelja, bez analitike. Been Here čita vašu fototeku na uređaju i uz nju vodi mali indeks. Vaše fotografije i mjesta gdje su snimljene ostaju gdje jesu.';

  @override
  String get onboardingPrivacyFootnote =>
      'Dvije stvari mogu doći do mreže i obje su isključene dok ih ne uključite: nazivi mjesta i karta.';

  @override
  String get onboardingPhotosTitle => 'Trebaju mu vaše fotografije';

  @override
  String get onboardingPhotosBody =>
      'Been Here bilježi koja je fotografija snimljena gdje. Nikad ništa ne kopira ni ne premješta – pamti identifikatore i koordinate, a same slike čita samo kad vam ih pokazuje.';

  @override
  String get onboardingPhotosAction => 'Dopusti fotografije';

  @override
  String get onboardingDone => 'Počni';

  @override
  String get settingsAboutTitle => 'O aplikaciji';

  @override
  String settingsVersion(String version, String build) {
    return 'Verzija $version ($build)';
  }

  @override
  String get settingsSourceTitle => 'Izvorni kod';

  @override
  String get settingsShowIntro => 'Ponovno prikaži uvod';

  @override
  String photoSemanticLabel(String date) {
    return 'Fotografija od $date';
  }

  @override
  String photoOpenSemanticLabel(int index, int total, String date) {
    return 'Fotografija $index od $total, $date';
  }

  @override
  String get placesActionsLabel => 'Što učiniti s ovim mjestom';

  @override
  String get radiusSemanticLabel => 'Radijus pretraživanja';

  @override
  String get hereMapTitle => 'Ovdje u blizini';

  @override
  String get hereOpenInMaps => 'Otvori u Kartama';

  @override
  String get hereBackToMe => 'Natrag na moj položaj';

  @override
  String get herePlaceFallbackTitle => 'Mjesto koje poznajete';

  @override
  String get arrivalTestNearHome => 'Preblizu kuće da bi to bila vijest.';

  @override
  String get settingsHomeRadiusTitle => 'Šuti unutar';

  @override
  String settingsHomeRadiusValue(num km) {
    String _temp0 = intl.Intl.pluralLogic(
      km,
      locale: localeName,
      other: '$km km od kuće',
      one: '$km km od kuće',
      zero: 'nimalo – nikad ne šuti',
    );
    return '$_temp0';
  }

  @override
  String get settingsHomeRadiusBody =>
      'Svakodnevni život odvija se blizu kuće i upravo je ondje telefon koji ga komentira najmanje dobrodošao. Mjesta bliža od ovoga nikad se ne nadziru.';

  @override
  String get settingsQuietTitle => 'Zašto je tiho';

  @override
  String settingsQuietWatching(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Nadzirana mjesta: $count',
      one: 'Nadzire se $count mjesto',
      zero: 'Ne nadzire se nijedno mjesto',
    );
    return '$_temp0';
  }

  @override
  String settingsQuietNearest(String distance) {
    return 'Najbliže nadzirano mjesto: $distance';
  }

  @override
  String get settingsQuietNothingWatched =>
      'Ništa se ne nadzire pa ne može biti dolaska.';

  @override
  String settingsQuietLastNotified(String when) {
    return 'Zadnja obavijest: $when';
  }

  @override
  String get settingsQuietNever => 'nikad';

  @override
  String settingsQuietBreakdown(int total, String reasons) {
    return 'Od $total mjesta: $reasons';
  }

  @override
  String settingsQuietReasonMuted(Object count) {
    return 'utišano: $count';
  }

  @override
  String settingsQuietReasonNearHome(Object count) {
    return 'blizu kuće: $count';
  }

  @override
  String settingsQuietReasonTooFewPhotos(Object count) {
    return 'premalo fotografija: $count';
  }

  @override
  String settingsQuietReasonTooRecent(Object count) {
    return 'nedavno fotografirano: $count';
  }

  @override
  String settingsQuietReasonPlaceCooldown(Object count) {
    return 'još na pauzi: $count';
  }

  @override
  String settingsQuietReasonEligible(Object count) {
    return 'vrijedno nadzora: $count';
  }

  @override
  String get ageSemanticLabel => 'Starost fotografija';

  @override
  String get ageStopNow => 'sada';

  @override
  String get ageStopDay => '1 dan';

  @override
  String get ageStop3Days => '3 dana';

  @override
  String get ageStopWeek => '1 tjedan';

  @override
  String get ageStop2Weeks => '2 tjedna';

  @override
  String get ageStopMonth => '1 mjesec';

  @override
  String get ageStop3Months => '3 mjeseca';

  @override
  String get ageStop6Months => '6 mjeseci';

  @override
  String get ageStopYear => '1 godina';

  @override
  String get ageStop2Years => '2 godine';

  @override
  String get ageStop5Years => '5 godina';

  @override
  String get ageStop10Years => '10 godina';

  @override
  String get ageStopAll => 'sve';

  @override
  String get ageWindowAll => 'Sve fotografije';

  @override
  String ageWindowNewerThan(String stop) {
    return 'Do $stop';
  }

  @override
  String ageWindowOlderThan(String stop) {
    return 'Starije od: $stop';
  }

  @override
  String ageWindowBetween(String newest, String oldest) {
    return 'Od $newest do $oldest';
  }

  @override
  String get ageWindowReset => 'Vrati';

  @override
  String mapDotCountCapped(int count) {
    return '$count+ fotografija';
  }
}
