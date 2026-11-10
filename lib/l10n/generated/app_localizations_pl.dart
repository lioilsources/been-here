// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get appTitle => 'Been Here';

  @override
  String get hereTabLabel => 'Tutaj';

  @override
  String get placesTabLabel => 'Miejsca';

  @override
  String get settingsTabLabel => 'Ustawienia';

  @override
  String get hereEmptyTitle => 'Nie robiłeś tu zdjęć';

  @override
  String get hereEmptyBody =>
      'Zwiększ promień wyszukiwania albo wróć tam, gdzie już kiedyś byłeś.';

  @override
  String get hereNotIndexedTitle => 'Jeszcze nic nie zindeksowano';

  @override
  String get hereNotIndexedBody =>
      'Been Here musi raz przeczytać Twoją bibliotekę zdjęć, żeby wiedzieć, gdzie byłeś. Nic nie opuszcza Twojego telefonu.';

  @override
  String get indexStartAction => 'Zindeksuj moje zdjęcia';

  @override
  String get indexPermissionTitle => 'Been Here potrzebuje Twoich zdjęć';

  @override
  String get indexPermissionBody =>
      'Odczytuje tylko, gdzie i kiedy zrobiono każde zdjęcie, i przechowuje to na tym telefonie.';

  @override
  String get indexPermissionAction => 'Zezwól na dostęp';

  @override
  String get indexPermissionDeniedTitle => 'Dostęp do zdjęć jest wyłączony';

  @override
  String get indexPermissionDeniedBody =>
      'Bez niego Been Here nie może nic pokazać. Możesz go włączyć w ustawieniach systemu.';

  @override
  String get indexLimitedAccessNotice =>
      'Udostępniłeś tylko wybrane zdjęcia, więc Been Here widzi tylko je. Pełny dostęp pozwoli znaleźć każde miejsce, w którym byłeś.';

  @override
  String get indexRunningTitle => 'Czytanie biblioteki zdjęć';

  @override
  String indexRunningProgress(int processed, int total) {
    return '$processed z $total';
  }

  @override
  String get indexFailedTitle => 'Indeksowanie zatrzymane';

  @override
  String get indexFailedBody =>
      'Coś poszło nie tak w trakcie. Ponowna próba zacznie od miejsca, w którym przerwano.';

  @override
  String indexedPhotoCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count zdjęcia zindeksowanego',
      many: '$count zdjęć zindeksowanych',
      few: '$count zdjęcia zindeksowane',
      one: '$count zdjęcie zindeksowane',
      zero: 'Brak zindeksowanych zdjęć',
    );
    return '$_temp0';
  }

  @override
  String indexedLocationCoverage(int percent) {
    return '$percent% z nich ma lokalizację';
  }

  @override
  String get commonLoading => 'Ładowanie…';

  @override
  String get commonRetry => 'Spróbuj ponownie';

  @override
  String get commonCancel => 'Anuluj';

  @override
  String hereRadiusLabel(String radius) {
    return 'W promieniu $radius';
  }

  @override
  String herePhotoCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count zdjęcia',
      many: '$count zdjęć',
      few: '$count zdjęcia',
      one: '$count zdjęcie',
      zero: 'Brak zdjęć',
    );
    return '$_temp0';
  }

  @override
  String hereVisitCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count wizyty',
      many: '$count wizyt',
      few: '$count wizyty',
      one: '$count wizyta',
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
  String get ageToday => 'Dzisiaj';

  @override
  String get ageYesterday => 'Wczoraj';

  @override
  String ageDaysAgo(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days dnia temu',
      many: '$days dni temu',
      few: '$days dni temu',
    );
    return '$_temp0';
  }

  @override
  String ageMonthsAgo(int months) {
    String _temp0 = intl.Intl.pluralLogic(
      months,
      locale: localeName,
      other: '$months miesiąca temu',
      many: '$months miesięcy temu',
      few: '$months miesiące temu',
      one: 'Miesiąc temu',
    );
    return '$_temp0';
  }

  @override
  String ageYearsAgo(int years) {
    String _temp0 = intl.Intl.pluralLogic(
      years,
      locale: localeName,
      other: '$years roku temu',
      many: '$years lat temu',
      few: '$years lata temu',
      one: 'Rok temu',
    );
    return '$_temp0';
  }

  @override
  String get locationPermissionTitle => 'Gdzie jesteś?';

  @override
  String get locationPermissionBody =>
      'Been Here porównuje Twoje położenie z miejscami, w których zrobiono Twoje zdjęcia. Porównanie odbywa się na tym telefonie.';

  @override
  String get locationPermissionAction => 'Użyj mojej lokalizacji';

  @override
  String get locationDeniedTitle => 'Lokalizacja jest wyłączona';

  @override
  String get locationDeniedBody =>
      'Bez niej aplikacja nie wie, co masz w tym miejscu. Możesz ją włączyć w ustawieniach systemu.';

  @override
  String get locationUnavailableTitle => 'Jeszcze brak pozycji';

  @override
  String get locationUnavailableBody =>
      'Telefon jeszcze nie ustalił, gdzie jest. W budynku może to chwilę potrwać.';

  @override
  String get locationServicesDisabledTitle => 'Usługi lokalizacji są wyłączone';

  @override
  String get locationServicesDisabledBody =>
      'Włącz je w ustawieniach systemu i wróć.';

  @override
  String get hereNothingTitle => 'Nie robiłeś tu zdjęć';

  @override
  String get hereNothingBody =>
      'Spróbuj większego promienia albo wróć tam, gdzie już kiedyś byłeś.';

  @override
  String hereNearestHint(String distance) {
    return 'Najbliższe wspomnienie jest $distance stąd.';
  }

  @override
  String get photoDetailRephoto => 'Powtórz zdjęcie';

  @override
  String get photoDetailRephotoSoon =>
      'Powtarzanie zdjęć pojawi się w późniejszej wersji.';

  @override
  String photoDetailOf(int index, int total) {
    return '$index z $total';
  }

  @override
  String get debugLocationTitle => 'Lokalizacja testowa';

  @override
  String get debugLocationBody =>
      'Udawaj, że jesteś gdzie indziej, żeby przetestować ekran Tutaj z kanapy.';

  @override
  String get debugLocationLatitude => 'Szerokość geograficzna';

  @override
  String get debugLocationLongitude => 'Długość geograficzna';

  @override
  String get debugLocationApply => 'Przenieś mnie tam';

  @override
  String get debugLocationClear => 'Użyj prawdziwej lokalizacji';

  @override
  String get debugLocationActive => 'Lokalizacja testowa aktywna';

  @override
  String get commonClose => 'Zamknij';

  @override
  String get placesEmptyTitle => 'Jeszcze brak miejsc';

  @override
  String get placesEmptyBody => 'Miejsca pojawią się po zindeksowaniu zdjęć.';

  @override
  String get placesSortLabel => 'Sortuj według';

  @override
  String get placesSortLongestAgo => 'Najdawniej';

  @override
  String get placesSortMostPhotos => 'Najwięcej zdjęć';

  @override
  String get placesSortNearest => 'Najbliżej';

  @override
  String placesMutedSection(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count wyciszonego miejsca',
      many: '$count wyciszonych miejsc',
      few: '$count wyciszone miejsca',
      one: '$count wyciszone miejsce',
    );
    return '$_temp0';
  }

  @override
  String get placesMute => 'Wycisz';

  @override
  String get placesUnmute => 'Wyłącz wyciszenie';

  @override
  String get placesUseAutoRule => 'Decyduj automatycznie';

  @override
  String get placesAutoMutedNote =>
      'Wyciszone automatycznie — bywasz tu prawie codziennie';

  @override
  String get placesUserMutedNote => 'Wyciszone przez Ciebie';

  @override
  String get placesUserUnmutedNote => 'Pozostawione widoczne przez Ciebie';

  @override
  String placesDayCount(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days dnia',
      many: '$days dni',
      few: '$days dni',
      one: '$days dzień',
    );
    return '$_temp0';
  }

  @override
  String get settingsPlaceNamesTitle => 'Nazywaj miejsca';

  @override
  String get settingsPlaceNamesBody =>
      'Prosi system o zamianę współrzędnych miejsca na nazwę. Te współrzędne trafiają do Apple lub Google — to jedyna rzecz w tej aplikacji, która opuszcza telefon. Domyślnie wyłączone; ponowne wyłączenie usuwa wszystkie nazwy.';

  @override
  String get settingsAutoMuteTitle => 'Wyciszaj codzienne miejsca po';

  @override
  String get settingsAutoMuteBody =>
      'Miejsce ze zdjęciami z tylu różnych dni to miejsce, w którym mieszkasz, a nie takie, które odwiedzasz.';

  @override
  String settingsAutoMuteValue(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days dnia',
      many: '$days dniach',
      few: '$days dniach',
    );
    return '$_temp0';
  }

  @override
  String get settingsIndexTitle => 'Indeks zdjęć';

  @override
  String get settingsReindex => 'Zindeksuj od nowa';

  @override
  String get settingsPrivacyTitle => 'Co zostaje na tym telefonie';

  @override
  String get settingsPrivacyBody =>
      'Twoje zdjęcia, miejsca ich zrobienia i wszystko, co ta aplikacja z nich wywnioskuje. Nie ma konta, serwera ani analityki.';

  @override
  String get placesName => 'Nazwij to miejsce';

  @override
  String get placesRename => 'Zmień nazwę';

  @override
  String get placesNameDialogTitle => 'Nazwa miejsca';

  @override
  String get placesNameHint => 'U babci, jezioro, biuro…';

  @override
  String get placesNameSave => 'Zapisz';

  @override
  String get placesNameClear => 'Usuń nazwę';

  @override
  String placesSummary(String age, String photos) {
    return '$age · $photos';
  }

  @override
  String get notificationTitle => 'Byłeś tu już wcześniej';

  @override
  String notificationBody(String age, String photos) {
    return 'Ostatnio tutaj: $age. $photos.';
  }

  @override
  String get alwaysLocationTitle => 'Niech Been Here zauważa za Ciebie';

  @override
  String get alwaysLocationBody =>
      'Dzięki lokalizacji w tle telefon może dać znać Been Here, gdy przyjedziesz w miejsce, które już fotografowałeś — a aplikacja może Ci o tym powiedzieć raz, bez otwierania czegokolwiek.\n\nAplikacja nigdy Cię nie śledzi. Telefon obserwuje kilka okręgów i budzi aplikację tylko wtedy, gdy wejdziesz do jednego z nich. Nic o tym, gdzie jesteś, nie opuszcza tego urządzenia.';

  @override
  String get alwaysLocationAction => 'Włącz przybycia';

  @override
  String get alwaysLocationLater => 'Nie teraz';

  @override
  String get alwaysLocationDeniedBody =>
      'Lokalizacja w tle jest wyłączona, więc przybycia milczą. Wszystko inne działa jak wcześniej; możesz ją włączyć w ustawieniach systemu, kiedy chcesz.';

  @override
  String get settingsArrivalsTitle => 'Przybycia';

  @override
  String get settingsArrivalsOn =>
      'Been Here da znać, gdy przybędziesz w miejsce, którego dawno nie fotografowałeś.';

  @override
  String get settingsArrivalsOff =>
      'Been Here milczy. Włączenie poprosi o lokalizację w tle.';

  @override
  String get settingsMemoryAgeTitle => 'Wspominaj tylko miejsca starsze niż';

  @override
  String settingsMemoryAgeValue(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days dnia',
      many: '$days dni',
      few: '$days dni',
      one: '$days dzień',
    );
    return '$_temp0';
  }

  @override
  String get settingsPlaceCooldownTitle =>
      'Potem zostaw to miejsce w spokoju na';

  @override
  String get settingsDailyLimitTitle => 'I nie mów nic przez';

  @override
  String settingsDailyLimitValue(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours godziny',
      many: '$hours godzin',
      few: '$hours godziny',
      one: '$hours godzinę',
      zero: 'wcale',
    );
    return '$_temp0';
  }

  @override
  String get settingsThresholdsBody =>
      'Obniż te wartości, żeby wypróbować przybycia bez czekania pół roku.';

  @override
  String get placesTestArrival => 'Przetestuj tu przybycie';

  @override
  String get arrivalTestNotified => 'Powiadomienie wysłane';

  @override
  String get arrivalTestMuted => 'Nic: miejsce jest wyciszone';

  @override
  String get arrivalTestTooFewPhotos => 'Nic: za mało zdjęć w tym miejscu';

  @override
  String get arrivalTestTooRecent => 'Nic: fotografowałeś tu zbyt niedawno';

  @override
  String get arrivalTestPlaceCooldown =>
      'Nic: to miejsce odezwało się niedawno';

  @override
  String get arrivalTestDailyLimit => 'Nic: dziś odezwało się już coś innego';

  @override
  String get alwaysLocationNeedsSettingsBody =>
      'Telefon zostawił lokalizację na „Podczas używania aplikacji”. iOS nie zaproponuje tego wyboru ponownie z poziomu aplikacji, więc lokalizację w tle trzeba przełączyć na „Zawsze” w ustawieniach systemu — wtedy przybycia zaczną działać.';

  @override
  String get commonOpenSettings => 'Otwórz ustawienia';

  @override
  String get settingsArrivalsPending =>
      'Prawie: lokalizacja jest wciąż na „Podczas używania aplikacji”. Ustaw ją na „Zawsze” w ustawieniach systemu.';

  @override
  String get placesSortVisits => 'Najwięcej wizyt';

  @override
  String get placesSortAscending => 'Odwrotna kolejność';

  @override
  String placesVisitCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count wizyty',
      many: '$count wizyt',
      few: '$count wizyty',
      one: '$count wizyta',
      zero: 'nigdy',
    );
    return '$_temp0';
  }

  @override
  String get settingsMapTitle => 'Pokazuj miejsca na mapie';

  @override
  String get settingsMapBody =>
      'Kafelki mapy są pobierane z OpenStreetMap podczas przesuwania i powiększania, więc ten serwer na bieżąco widzi, gdzie patrzysz. W przeciwieństwie do nazwy miejsca, o którą pyta się raz, trwa to tak długo, jak długo mapa jest otwarta. Domyślnie wyłączone.';

  @override
  String get placesShowMap => 'Mapa';

  @override
  String get placesShowList => 'Lista';

  @override
  String get placesMapAttribution => '© Współtwórcy OpenStreetMap';

  @override
  String get rephotoOverlay => 'Przenikanie';

  @override
  String get rephotoEdges => 'Kontur';

  @override
  String get rephotoCapture => 'Zrób zdjęcie';

  @override
  String get rephotoSaved => 'Zapisano w zdjęciach';

  @override
  String get rephotoNotSaved =>
      'Nie udało się zapisać. Dodawanie zdjęć może być wyłączone.';

  @override
  String get rephotoNoCamera =>
      'Brak dostępnego aparatu. Been Here potrzebuje aparatu, żeby zrobić zdjęcie odpowiadające staremu.';

  @override
  String get rephotoThenAndNow => 'Kiedyś i teraz';

  @override
  String get rephotoShare => 'Udostępnij';

  @override
  String get rephotoThen => 'Kiedyś';

  @override
  String get rephotoNow => 'Teraz';

  @override
  String get rephotoShareFailed =>
      'Nie udało się utworzyć obrazu do udostępnienia.';

  @override
  String get onboardingSkip => 'Pomiń';

  @override
  String get onboardingNext => 'Dalej';

  @override
  String get onboardingWhatTitle => 'Zdjęcia z miejsca, w którym stoisz';

  @override
  String get onboardingWhatBody =>
      'Przybądź w miejsce, które już fotografowałeś, a Been Here pokaże, co tam zrobiłeś — wizyta po wizycie, od najdawniejszej.';

  @override
  String get onboardingPrivacyTitle => 'Nic nie opuszcza Twojego telefonu';

  @override
  String get onboardingPrivacyBody =>
      'Bez konta, bez serwera, bez analityki. Been Here czyta bibliotekę zdjęć na urządzeniu i trzyma obok mały indeks. Twoje zdjęcia i miejsca ich zrobienia zostają tam, gdzie są.';

  @override
  String get onboardingPrivacyFootnote =>
      'Dwie rzeczy mogą trafić do sieci i obie są wyłączone, dopóki ich nie włączysz: nazwy miejsc i mapa.';

  @override
  String get onboardingPhotosTitle => 'Potrzebuje Twoich zdjęć';

  @override
  String get onboardingPhotosBody =>
      'Been Here zapisuje, które zdjęcie zrobiono gdzie. Nigdy niczego nie kopiuje ani nie przenosi — pamięta identyfikatory i współrzędne, a same zdjęcia czyta tylko wtedy, gdy Ci je pokazuje.';

  @override
  String get onboardingPhotosAction => 'Zezwól na zdjęcia';

  @override
  String get onboardingDone => 'Zaczynamy';

  @override
  String get settingsAboutTitle => 'Informacje';

  @override
  String settingsVersion(String version, String build) {
    return 'Wersja $version ($build)';
  }

  @override
  String get settingsSourceTitle => 'Kod źródłowy';

  @override
  String get settingsShowIntro => 'Pokaż wprowadzenie ponownie';

  @override
  String photoSemanticLabel(String date) {
    return 'Zdjęcie z $date';
  }

  @override
  String photoOpenSemanticLabel(int index, int total, String date) {
    return 'Zdjęcie $index z $total, $date';
  }

  @override
  String get placesActionsLabel => 'Co zrobić z tym miejscem';

  @override
  String get radiusSemanticLabel => 'Promień wyszukiwania';

  @override
  String get hereMapTitle => 'W pobliżu';

  @override
  String get hereOpenInMaps => 'Otwórz w Mapach';

  @override
  String get hereBackToMe => 'Wróć do mojej pozycji';

  @override
  String get herePlaceFallbackTitle => 'Miejsce, które znasz';

  @override
  String get arrivalTestNearHome => 'Za blisko domu, żeby to była nowina.';

  @override
  String get settingsHomeRadiusTitle => 'Milcz w promieniu';

  @override
  String settingsHomeRadiusValue(num km) {
    String _temp0 = intl.Intl.pluralLogic(
      km,
      locale: localeName,
      other: '$km km od domu',
      many: '$km km od domu',
      few: '$km km od domu',
      one: '$km km od domu',
      zero: 'zero — nigdy nie milcz',
    );
    return '$_temp0';
  }

  @override
  String get settingsHomeRadiusBody =>
      'Codzienne życie toczy się blisko domu i tam telefon, który je komentuje, jest najmniej mile widziany. Miejsca bliżej niż ta odległość nigdy nie są obserwowane.';

  @override
  String get settingsQuietTitle => 'Dlaczego jest cicho';

  @override
  String settingsQuietWatching(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Obserwuje $count miejsca',
      many: 'Obserwuje $count miejsc',
      few: 'Obserwuje $count miejsca',
      one: 'Obserwuje $count miejsce',
      zero: 'Nie obserwuje żadnego miejsca',
    );
    return '$_temp0';
  }

  @override
  String settingsQuietNearest(String distance) {
    return 'Najbliższe obserwowane miejsce: $distance';
  }

  @override
  String get settingsQuietNothingWatched =>
      'Nic nie jest obserwowane, więc nie może być żadnego przybycia.';

  @override
  String settingsQuietLastNotified(String when) {
    return 'Ostatnie powiadomienie: $when';
  }

  @override
  String get settingsQuietNever => 'nigdy';

  @override
  String settingsQuietBreakdown(int total, String reasons) {
    return 'Z $total miejsc: $reasons';
  }

  @override
  String settingsQuietReasonMuted(Object count) {
    return 'wyciszone: $count';
  }

  @override
  String settingsQuietReasonNearHome(Object count) {
    return 'blisko domu: $count';
  }

  @override
  String settingsQuietReasonTooFewPhotos(Object count) {
    return 'za mało zdjęć: $count';
  }

  @override
  String settingsQuietReasonTooRecent(Object count) {
    return 'fotografowane niedawno: $count';
  }

  @override
  String settingsQuietReasonPlaceCooldown(Object count) {
    return 'jeszcze w przerwie: $count';
  }

  @override
  String settingsQuietReasonEligible(Object count) {
    return 'warte obserwowania: $count';
  }

  @override
  String get ageSemanticLabel => 'Wiek zdjęć';

  @override
  String get ageStopNow => 'teraz';

  @override
  String get ageStopDay => '1 dzień';

  @override
  String get ageStop3Days => '3 dni';

  @override
  String get ageStopWeek => '1 tydzień';

  @override
  String get ageStop2Weeks => '2 tygodnie';

  @override
  String get ageStopMonth => '1 miesiąc';

  @override
  String get ageStop3Months => '3 miesiące';

  @override
  String get ageStop6Months => '6 miesięcy';

  @override
  String get ageStopYear => '1 rok';

  @override
  String get ageStop2Years => '2 lata';

  @override
  String get ageStop5Years => '5 lat';

  @override
  String get ageStop10Years => '10 lat';

  @override
  String get ageStopAll => 'wszystko';

  @override
  String get ageWindowAll => 'Wszystkie zdjęcia';

  @override
  String ageWindowNewerThan(String stop) {
    return 'Do $stop';
  }

  @override
  String ageWindowOlderThan(String stop) {
    return 'Starsze niż $stop';
  }

  @override
  String ageWindowBetween(String newest, String oldest) {
    return 'Od $newest do $oldest';
  }

  @override
  String get ageWindowReset => 'Resetuj';

  @override
  String mapDotCountCapped(int count) {
    return '$count+ zdjęć';
  }
}
