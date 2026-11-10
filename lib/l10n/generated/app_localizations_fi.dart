// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Finnish (`fi`).
class AppLocalizationsFi extends AppLocalizations {
  AppLocalizationsFi([String locale = 'fi']) : super(locale);

  @override
  String get appTitle => 'Been Here';

  @override
  String get hereTabLabel => 'Tässä';

  @override
  String get placesTabLabel => 'Paikat';

  @override
  String get settingsTabLabel => 'Asetukset';

  @override
  String get hereEmptyTitle => 'Et ole ottanut kuvia täällä';

  @override
  String get hereEmptyBody =>
      'Suurenna hakusädettä tai palaa paikkaan, jossa olet käynyt ennenkin.';

  @override
  String get hereNotIndexedTitle => 'Mitään ei ole vielä indeksoitu';

  @override
  String get hereNotIndexedBody =>
      'Been Herein täytyy lukea kuvakirjastosi kerran, jotta se tietää, missä olet käynyt. Mikään ei lähde puhelimestasi.';

  @override
  String get indexStartAction => 'Indeksoi kuvani';

  @override
  String get indexPermissionTitle => 'Been Here tarvitsee kuvasi';

  @override
  String get indexPermissionBody =>
      'Se lukee vain, missä ja milloin kukin kuva otettiin, ja pitää tiedot tässä puhelimessa.';

  @override
  String get indexPermissionAction => 'Salli pääsy';

  @override
  String get indexPermissionDeniedTitle => 'Pääsy kuviin on pois päältä';

  @override
  String get indexPermissionDeniedBody =>
      'Ilman sitä Been Here ei voi näyttää sinulle mitään. Voit ottaa sen käyttöön järjestelmän asetuksista.';

  @override
  String get indexLimitedAccessNotice =>
      'Olet jakanut vain valitut kuvat, joten Been Here näkee vain ne. Täydellä pääsyllä se löytää jokaisen paikan, jossa olet käynyt.';

  @override
  String get indexRunningTitle => 'Luetaan kuvakirjastoasi';

  @override
  String indexRunningProgress(int processed, int total) {
    return '$processed/$total';
  }

  @override
  String get indexFailedTitle => 'Indeksointi pysähtyi';

  @override
  String get indexFailedBody =>
      'Jokin meni vikaan kesken kaiken. Uusi yritys jatkaa siitä, mihin jäätiin.';

  @override
  String indexedPhotoCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kuvaa indeksoitu',
      one: '$count kuva indeksoitu',
      zero: 'Ei indeksoituja kuvia',
    );
    return '$_temp0';
  }

  @override
  String indexedLocationCoverage(int percent) {
    return '$percent %:ssa on sijainti';
  }

  @override
  String get commonLoading => 'Ladataan…';

  @override
  String get commonRetry => 'Yritä uudelleen';

  @override
  String get commonCancel => 'Peruuta';

  @override
  String hereRadiusLabel(String radius) {
    return 'Enintään $radius päässä';
  }

  @override
  String herePhotoCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kuvaa',
      one: '$count kuva',
      zero: 'Ei kuvia',
    );
    return '$_temp0';
  }

  @override
  String hereVisitCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count käyntiä',
      one: '$count käynti',
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
  String get ageToday => 'Tänään';

  @override
  String get ageYesterday => 'Eilen';

  @override
  String ageDaysAgo(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days päivää sitten',
    );
    return '$_temp0';
  }

  @override
  String ageMonthsAgo(int months) {
    String _temp0 = intl.Intl.pluralLogic(
      months,
      locale: localeName,
      other: '$months kuukautta sitten',
      one: 'Kuukausi sitten',
    );
    return '$_temp0';
  }

  @override
  String ageYearsAgo(int years) {
    String _temp0 = intl.Intl.pluralLogic(
      years,
      locale: localeName,
      other: '$years vuotta sitten',
      one: 'Vuosi sitten',
    );
    return '$_temp0';
  }

  @override
  String get locationPermissionTitle => 'Missä olet?';

  @override
  String get locationPermissionBody =>
      'Been Here vertaa sijaintiasi paikkoihin, joissa kuvasi on otettu. Vertailu tehdään tässä puhelimessa.';

  @override
  String get locationPermissionAction => 'Käytä sijaintiani';

  @override
  String get locationDeniedTitle => 'Sijainti on pois päältä';

  @override
  String get locationDeniedBody =>
      'Ilman sitä sovellus ei tiedä, mitä sinulla on täällä. Voit ottaa sen käyttöön järjestelmän asetuksista.';

  @override
  String get locationUnavailableTitle => 'Ei vielä sijaintia';

  @override
  String get locationUnavailableBody =>
      'Puhelimesi ei ole vielä selvittänyt, missä se on. Sisätiloissa tämä voi kestää hetken.';

  @override
  String get locationServicesDisabledTitle =>
      'Sijaintipalvelut ovat pois päältä';

  @override
  String get locationServicesDisabledBody =>
      'Ota ne käyttöön järjestelmän asetuksista ja palaa takaisin.';

  @override
  String get hereNothingTitle => 'Et ole ottanut kuvia täällä';

  @override
  String get hereNothingBody =>
      'Kokeile suurempaa sädettä tai palaa paikkaan, jossa olet käynyt ennenkin.';

  @override
  String hereNearestHint(String distance) {
    return 'Lähin muistosi on $distance päässä.';
  }

  @override
  String get photoDetailRephoto => 'Kuvaa uudelleen';

  @override
  String get photoDetailRephotoSoon =>
      'Uudelleenkuvaus tulee myöhemmässä versiossa.';

  @override
  String photoDetailOf(int index, int total) {
    return '$index/$total';
  }

  @override
  String get debugLocationTitle => 'Testisijainti';

  @override
  String get debugLocationBody =>
      'Teeskentele olevasi muualla, niin Tässä-näkymää voi testata sohvalta.';

  @override
  String get debugLocationLatitude => 'Leveysaste';

  @override
  String get debugLocationLongitude => 'Pituusaste';

  @override
  String get debugLocationApply => 'Mene sinne';

  @override
  String get debugLocationClear => 'Käytä oikeaa sijaintia';

  @override
  String get debugLocationActive => 'Testisijainti käytössä';

  @override
  String get commonClose => 'Sulje';

  @override
  String get placesEmptyTitle => 'Ei vielä paikkoja';

  @override
  String get placesEmptyBody => 'Paikat ilmestyvät, kun kuvasi on indeksoitu.';

  @override
  String get placesSortLabel => 'Järjestys';

  @override
  String get placesSortLongestAgo => 'Pisimpään sitten';

  @override
  String get placesSortMostPhotos => 'Eniten kuvia';

  @override
  String get placesSortNearest => 'Lähimmät';

  @override
  String placesMutedSection(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count mykistettyä paikkaa',
      one: '$count mykistetty paikka',
    );
    return '$_temp0';
  }

  @override
  String get placesMute => 'Mykistä';

  @override
  String get placesUnmute => 'Poista mykistys';

  @override
  String get placesUseAutoRule => 'Päätä automaattisesti';

  @override
  String get placesAutoMutedNote =>
      'Mykistetty automaattisesti – olet täällä useimpina päivinä';

  @override
  String get placesUserMutedNote => 'Sinun mykistämäsi';

  @override
  String get placesUserUnmutedNote => 'Sinun näkyvissä pitämäsi';

  @override
  String placesDayCount(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days päivää',
      one: '$days päivä',
    );
    return '$_temp0';
  }

  @override
  String get settingsPlaceNamesTitle => 'Nimeä paikat';

  @override
  String get settingsPlaceNamesBody =>
      'Pyytää järjestelmää muuttamaan paikan koordinaatit nimeksi. Koordinaatti lähetetään Applelle tai Googlelle – se on ainoa asia tässä sovelluksessa, joka lähtee puhelimestasi. Oletuksena pois päältä; kun poistat sen taas käytöstä, kaikki nimet unohdetaan.';

  @override
  String get settingsAutoMuteTitle => 'Mykistä arkipaikat, kun päiviä on';

  @override
  String get settingsAutoMuteBody =>
      'Paikka, jossa on kuvia näin monelta eri päivältä, on paikka, jossa asut, ei paikka, jossa vierailet.';

  @override
  String settingsAutoMuteValue(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days päivää',
    );
    return '$_temp0';
  }

  @override
  String get settingsIndexTitle => 'Kuvahakemisto';

  @override
  String get settingsReindex => 'Indeksoi alusta uudelleen';

  @override
  String get settingsPrivacyTitle => 'Mitä jää tähän puhelimeen';

  @override
  String get settingsPrivacyBody =>
      'Kuvasi, niiden ottopaikat ja kaikki, mitä tämä sovellus niistä päättelee. Ei tiliä, ei palvelinta eikä analytiikkaa.';

  @override
  String get placesName => 'Nimeä tämä paikka';

  @override
  String get placesRename => 'Nimeä uudelleen';

  @override
  String get placesNameDialogTitle => 'Paikan nimi';

  @override
  String get placesNameHint => 'Mummola, järvi, toimisto…';

  @override
  String get placesNameSave => 'Tallenna';

  @override
  String get placesNameClear => 'Poista nimi';

  @override
  String placesSummary(String age, String photos) {
    return '$age · $photos';
  }

  @override
  String get notificationTitle => 'Olet ollut täällä ennenkin';

  @override
  String notificationBody(String age, String photos) {
    return 'Viimeksi täällä: $age. $photos.';
  }

  @override
  String get alwaysLocationTitle => 'Anna Been Heren huomata puolestasi';

  @override
  String get alwaysLocationBody =>
      'Taustasijainnin avulla puhelimesi voi kertoa Been Herelle, kun saavut paikkaan, jota olet kuvannut ennenkin – ja sovellus voi kertoa siitä kerran, ilman että avaat mitään.\n\nSovellus ei koskaan seuraa sinua. Puhelimesi tarkkailee kourallista ympyröitä ja herättää sovelluksen vain, kun astut johonkin niistä. Mikään tieto olinpaikastasi ei lähde tästä laitteesta.';

  @override
  String get alwaysLocationAction => 'Ota saapumiset käyttöön';

  @override
  String get alwaysLocationLater => 'Ei nyt';

  @override
  String get alwaysLocationDeniedBody =>
      'Taustasijainti on pois päältä, joten saapumiset pysyvät hiljaa. Kaikki muu toimii kuten ennen; voit ottaa sen käyttöön järjestelmän asetuksista milloin vain.';

  @override
  String get settingsArrivalsTitle => 'Saapumiset';

  @override
  String get settingsArrivalsOn =>
      'Been Here kertoo, kun saavut paikkaan, jota et ole kuvannut vähään aikaan.';

  @override
  String get settingsArrivalsOff =>
      'Been Here pysyy hiljaa. Käyttöönotto pyytää taustasijaintia.';

  @override
  String get settingsMemoryAgeTitle =>
      'Mainitse vain paikat, joista on kulunut yli';

  @override
  String settingsMemoryAgeValue(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days päivää',
      one: '$days päivä',
    );
    return '$_temp0';
  }

  @override
  String get settingsPlaceCooldownTitle => 'Pidä sitten paikka hiljaa ajan';

  @override
  String get settingsDailyLimitTitle => 'Ja ole kokonaan hiljaa ajan';

  @override
  String settingsDailyLimitValue(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours tuntia',
      one: '$hours tunti',
      zero: 'ei lainkaan',
    );
    return '$_temp0';
  }

  @override
  String get settingsThresholdsBody =>
      'Laske näitä kokeillaksesi saapumisia odottamatta puolta vuotta.';

  @override
  String get placesTestArrival => 'Testaa saapuminen tähän';

  @override
  String get arrivalTestNotified => 'Ilmoitus lähetetty';

  @override
  String get arrivalTestMuted => 'Ei mitään: paikka on mykistetty';

  @override
  String get arrivalTestTooFewPhotos => 'Ei mitään: liian vähän kuvia täällä';

  @override
  String get arrivalTestTooRecent =>
      'Ei mitään: kuvasit täällä liian äskettäin';

  @override
  String get arrivalTestPlaceCooldown =>
      'Ei mitään: tämä paikka ilmoitti äskettäin';

  @override
  String get arrivalTestDailyLimit => 'Ei mitään: jokin muu ilmoitti jo tänään';

  @override
  String get alwaysLocationNeedsSettingsBody =>
      'Puhelimesi jätti sijainnin asetukseen ”Kun appia käytetään”. iOS ei tarjoa valintaa uudelleen sovelluksen sisältä, joten taustasijainti on vaihdettava asetukseen ”Aina” järjestelmän asetuksista – sitten saapumiset alkavat toimia.';

  @override
  String get commonOpenSettings => 'Avaa asetukset';

  @override
  String get settingsArrivalsPending =>
      'Melkein: sijainti on yhä asetuksessa ”Kun appia käytetään”. Vaihda se asetukseen ”Aina” järjestelmän asetuksista.';

  @override
  String get placesSortVisits => 'Eniten käyntejä';

  @override
  String get placesSortAscending => 'Käänteinen järjestys';

  @override
  String placesVisitCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count käyntiä',
      one: '$count käynti',
      zero: 'ei koskaan',
    );
    return '$_temp0';
  }

  @override
  String get settingsMapTitle => 'Näytä paikat kartalla';

  @override
  String get settingsMapBody =>
      'Karttaruudut ladataan OpenStreetMapista, kun siirrät ja zoomaat karttaa, joten palvelin näkee jatkuvasti, mihin katsot. Toisin kuin paikan nimi, joka kysytään kerran, tämä jatkuu niin kauan kuin kartta on auki. Oletuksena pois päältä.';

  @override
  String get placesShowMap => 'Kartta';

  @override
  String get placesShowList => 'Luettelo';

  @override
  String get placesMapAttribution => '© OpenStreetMapin tekijät';

  @override
  String get rephotoOverlay => 'Häivytys';

  @override
  String get rephotoEdges => 'Ääriviivat';

  @override
  String get rephotoCapture => 'Ota kuva';

  @override
  String get rephotoSaved => 'Tallennettu kuviisi';

  @override
  String get rephotoNotSaved =>
      'Tallennus epäonnistui. Kuvien lisääminen saattaa olla estetty.';

  @override
  String get rephotoNoCamera =>
      'Kameraa ei ole saatavilla. Been Here tarvitsee kameran ottaakseen kuvan, joka vastaa vanhaan.';

  @override
  String get rephotoThenAndNow => 'Silloin ja nyt';

  @override
  String get rephotoShare => 'Jaa';

  @override
  String get rephotoThen => 'Silloin';

  @override
  String get rephotoNow => 'Nyt';

  @override
  String get rephotoShareFailed => 'Jaettavaa kuvaa ei voitu luoda.';

  @override
  String get onboardingSkip => 'Ohita';

  @override
  String get onboardingNext => 'Seuraava';

  @override
  String get onboardingWhatTitle => 'Kuvat juuri siitä paikasta, jossa seisot';

  @override
  String get onboardingWhatBody =>
      'Saavu paikkaan, jota olet kuvannut ennenkin, ja Been Here näyttää, mitä otit siellä – käynti kerrallaan, vanhin ensin.';

  @override
  String get onboardingPrivacyTitle => 'Mikään ei lähde puhelimestasi';

  @override
  String get onboardingPrivacyBody =>
      'Ei tiliä, ei palvelinta, ei analytiikkaa. Been Here lukee kuvakirjastosi laitteella ja pitää sen rinnalla pientä hakemistoa. Kuvasi ja niiden ottopaikat pysyvät siellä, missä ne ovat.';

  @override
  String get onboardingPrivacyFootnote =>
      'Kaksi asiaa voi käyttää verkkoa, ja molemmat ovat pois päältä, kunnes otat ne käyttöön: paikkojen nimet ja kartta.';

  @override
  String get onboardingPhotosTitle => 'Se tarvitsee kuvasi';

  @override
  String get onboardingPhotosBody =>
      'Been Here merkitsee muistiin, mikä kuva otettiin missä. Se ei koskaan kopioi tai siirrä mitään – se muistaa tunnisteet ja koordinaatit ja lukee itse kuvat vain näyttäessään ne sinulle.';

  @override
  String get onboardingPhotosAction => 'Salli kuvat';

  @override
  String get onboardingDone => 'Aloita';

  @override
  String get settingsAboutTitle => 'Tietoja';

  @override
  String settingsVersion(String version, String build) {
    return 'Versio $version ($build)';
  }

  @override
  String get settingsSourceTitle => 'Lähdekoodi';

  @override
  String get settingsShowIntro => 'Näytä esittely uudelleen';

  @override
  String photoSemanticLabel(String date) {
    return 'Kuva $date';
  }

  @override
  String photoOpenSemanticLabel(int index, int total, String date) {
    return 'Kuva $index/$total, $date';
  }

  @override
  String get placesActionsLabel => 'Mitä tehdä tälle paikalle';

  @override
  String get radiusSemanticLabel => 'Hakusäde';

  @override
  String get hereMapTitle => 'Tässä lähellä';

  @override
  String get hereOpenInMaps => 'Avaa Kartoissa';

  @override
  String get hereBackToMe => 'Takaisin sijaintiini';

  @override
  String get herePlaceFallbackTitle => 'Paikka, jonka tunnet';

  @override
  String get arrivalTestNearHome => 'Liian lähellä kotia ollakseen uutinen.';

  @override
  String get settingsHomeRadiusTitle => 'Ole hiljaa kodin lähellä';

  @override
  String settingsHomeRadiusValue(num km) {
    String _temp0 = intl.Intl.pluralLogic(
      km,
      locale: localeName,
      other: '$km km kodista',
      one: '$km km kodista',
      zero: 'ei etäisyyttä – ei koskaan hiljaa',
    );
    return '$_temp0';
  }

  @override
  String get settingsHomeRadiusBody =>
      'Arki tapahtuu lähellä kotia, ja juuri siellä sitä kommentoiva puhelin on vähiten tervetullut. Tätä lähempiä paikkoja ei koskaan seurata.';

  @override
  String get settingsQuietTitle => 'Miksi on hiljaista';

  @override
  String settingsQuietWatching(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Seurataan $count paikkaa',
      one: 'Seurataan $count paikkaa',
      zero: 'Ei seurattavia paikkoja',
    );
    return '$_temp0';
  }

  @override
  String settingsQuietNearest(String distance) {
    return 'Lähin seurattava paikka: $distance';
  }

  @override
  String get settingsQuietNothingWatched =>
      'Mitään ei seurata, joten saapumisia ei voi tulla.';

  @override
  String settingsQuietLastNotified(String when) {
    return 'Viimeisin ilmoitus: $when';
  }

  @override
  String get settingsQuietNever => 'ei koskaan';

  @override
  String settingsQuietBreakdown(int total, String reasons) {
    return '$total paikasta: $reasons';
  }

  @override
  String settingsQuietReasonMuted(Object count) {
    return 'mykistettyjä $count';
  }

  @override
  String settingsQuietReasonNearHome(Object count) {
    return 'lähellä kotia $count';
  }

  @override
  String settingsQuietReasonTooFewPhotos(Object count) {
    return 'liian vähän kuvia $count';
  }

  @override
  String settingsQuietReasonTooRecent(Object count) {
    return 'kuvattu äskettäin $count';
  }

  @override
  String settingsQuietReasonPlaceCooldown(Object count) {
    return 'vielä tauolla $count';
  }

  @override
  String settingsQuietReasonEligible(Object count) {
    return 'seuraamisen arvoisia $count';
  }

  @override
  String get ageSemanticLabel => 'Kuvien ikä';

  @override
  String get ageStopNow => 'nyt';

  @override
  String get ageStopDay => '1 päivä';

  @override
  String get ageStop3Days => '3 päivää';

  @override
  String get ageStopWeek => '1 viikko';

  @override
  String get ageStop2Weeks => '2 viikkoa';

  @override
  String get ageStopMonth => '1 kuukausi';

  @override
  String get ageStop3Months => '3 kuukautta';

  @override
  String get ageStop6Months => '6 kuukautta';

  @override
  String get ageStopYear => '1 vuosi';

  @override
  String get ageStop2Years => '2 vuotta';

  @override
  String get ageStop5Years => '5 vuotta';

  @override
  String get ageStop10Years => '10 vuotta';

  @override
  String get ageStopAll => 'kaikki';

  @override
  String get ageWindowAll => 'Kaikki kuvat';

  @override
  String ageWindowNewerThan(String stop) {
    return 'Enintään $stop vanhat';
  }

  @override
  String ageWindowOlderThan(String stop) {
    return 'Yli $stop vanhat';
  }

  @override
  String ageWindowBetween(String newest, String oldest) {
    return '$newest – $oldest vanhat';
  }

  @override
  String get ageWindowReset => 'Palauta';

  @override
  String mapDotCountCapped(int count) {
    return '$count+ kuvaa';
  }
}
