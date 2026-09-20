// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Czech (`cs`).
class AppLocalizationsCs extends AppLocalizations {
  AppLocalizationsCs([String locale = 'cs']) : super(locale);

  @override
  String get appTitle => 'Been Here';

  @override
  String get hereTabLabel => 'Tady';

  @override
  String get placesTabLabel => 'Místa';

  @override
  String get settingsTabLabel => 'Nastavení';

  @override
  String get hereEmptyTitle => 'Tady jsi ještě nefotil';

  @override
  String get hereEmptyBody =>
      'Zkus rozšířit okruh hledání, nebo se vrať někam, kde jsi už byl.';

  @override
  String get hereNotIndexedTitle => 'Zatím nic nezaindexováno';

  @override
  String get hereNotIndexedBody =>
      'Been Here si potřebuje jednou projít tvoje fotky, aby věděl, kde jsi byl. Nic neopustí telefon.';

  @override
  String get indexStartAction => 'Projít moje fotky';

  @override
  String get indexPermissionTitle => 'Been Here potřebuje tvoje fotky';

  @override
  String get indexPermissionBody =>
      'Čte z nich jen to, kde a kdy vznikly, a nechává si to v tomhle telefonu.';

  @override
  String get indexPermissionAction => 'Povolit přístup';

  @override
  String get indexPermissionDeniedTitle => 'Přístup k fotkám je vypnutý';

  @override
  String get indexPermissionDeniedBody =>
      'Bez něj ti Been Here nemá co ukázat. Zapnout ho jde v nastavení systému.';

  @override
  String get indexLimitedAccessNotice =>
      'Sdílíš jen vybrané fotky, takže Been Here vidí jenom je. S plným přístupem najde všechna místa, kde jsi byl.';

  @override
  String get indexRunningTitle => 'Procházím tvoje fotky';

  @override
  String indexRunningProgress(int processed, int total) {
    return '$processed z $total';
  }

  @override
  String get indexFailedTitle => 'Indexace se zastavila';

  @override
  String get indexFailedBody =>
      'Něco se cestou pokazilo. Další pokus naváže tam, kde skončil.';

  @override
  String indexedPhotoCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count zaindexovaných fotek',
      few: '$count zaindexované fotky',
      one: '1 zaindexovaná fotka',
      zero: 'Žádné zaindexované fotky',
    );
    return '$_temp0';
  }

  @override
  String indexedLocationCoverage(int percent) {
    return '$percent % z nich má polohu';
  }

  @override
  String get commonLoading => 'Načítám…';

  @override
  String get commonRetry => 'Zkusit znovu';

  @override
  String get commonCancel => 'Zrušit';

  @override
  String hereRadiusLabel(String radius) {
    return 'V okruhu $radius';
  }

  @override
  String herePhotoCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotek',
      few: '$count fotky',
      one: '1 fotka',
      zero: 'Žádné fotky',
    );
    return '$_temp0';
  }

  @override
  String hereVisitCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count návštěv',
      few: '$count návštěvy',
      one: '1 návštěva',
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
      other: 'před $days dny',
    );
    return '$_temp0';
  }

  @override
  String ageMonthsAgo(int months) {
    String _temp0 = intl.Intl.pluralLogic(
      months,
      locale: localeName,
      other: 'před $months měsíci',
      few: 'před $months měsíci',
      one: 'před měsícem',
    );
    return '$_temp0';
  }

  @override
  String ageYearsAgo(int years) {
    String _temp0 = intl.Intl.pluralLogic(
      years,
      locale: localeName,
      other: 'před $years lety',
      few: 'před $years lety',
      one: 'před rokem',
    );
    return '$_temp0';
  }

  @override
  String get locationPermissionTitle => 'Kde jsi?';

  @override
  String get locationPermissionBody =>
      'Been Here porovná tvoji polohu s místy, kde vznikly tvoje fotky. Porovnání proběhne v tomhle telefonu.';

  @override
  String get locationPermissionAction => 'Použít moji polohu';

  @override
  String get locationDeniedTitle => 'Poloha je vypnutá';

  @override
  String get locationDeniedBody =>
      'Bez ní appka nepozná, co tady máš. Zapnout ji jde v nastavení systému.';

  @override
  String get locationUnavailableTitle => 'Zatím bez signálu';

  @override
  String get locationUnavailableBody =>
      'Telefon ještě nezjistil, kde je. Uvnitř budovy to chvíli trvá.';

  @override
  String get locationServicesDisabledTitle => 'Služby polohy jsou vypnuté';

  @override
  String get locationServicesDisabledBody =>
      'Zapni je v nastavení systému a vrať se.';

  @override
  String get hereNothingTitle => 'Tady jsi ještě nefotil';

  @override
  String get hereNothingBody =>
      'Zkus větší okruh, nebo se vrať někam, kde jsi už byl.';

  @override
  String hereNearestHint(String distance) {
    return 'Nejbližší vzpomínku máš $distance odsud.';
  }

  @override
  String get photoDetailRephoto => 'Rephoto';

  @override
  String get photoDetailRephotoSoon => 'Rephoto přijde v další verzi.';

  @override
  String photoDetailOf(int index, int total) {
    return '$index z $total';
  }

  @override
  String get debugLocationTitle => 'Ladicí poloha';

  @override
  String get debugLocationBody =>
      'Tvař se, že jsi jinde — ať jde obrazovka Tady vyzkoušet z gauče.';

  @override
  String get debugLocationLatitude => 'Zeměpisná šířka';

  @override
  String get debugLocationLongitude => 'Zeměpisná délka';

  @override
  String get debugLocationApply => 'Přenést se';

  @override
  String get debugLocationClear => 'Zpět na skutečnou polohu';

  @override
  String get debugLocationActive => 'Ladicí poloha je aktivní';

  @override
  String get commonClose => 'Zavřít';
}
