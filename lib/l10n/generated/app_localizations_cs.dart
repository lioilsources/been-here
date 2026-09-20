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
  String get commonLoading => 'Načítám…';

  @override
  String get commonRetry => 'Zkusit znovu';

  @override
  String get commonCancel => 'Zrušit';
}
