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
}
