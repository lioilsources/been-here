// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Ukrainian (`uk`).
class AppLocalizationsUk extends AppLocalizations {
  AppLocalizationsUk([String locale = 'uk']) : super(locale);

  @override
  String get appTitle => 'Been Here';

  @override
  String get hereTabLabel => 'Тут';

  @override
  String get placesTabLabel => 'Місця';

  @override
  String get settingsTabLabel => 'Налаштування';

  @override
  String get hereEmptyTitle => 'Ви тут не фотографували';

  @override
  String get hereEmptyBody =>
      'Збільште радіус пошуку або поверніться туди, де вже бували.';

  @override
  String get hereNotIndexedTitle => 'Ще нічого не проіндексовано';

  @override
  String get hereNotIndexedBody =>
      'Been Here має один раз прочитати вашу фототеку, щоб знати, де ви бували. Ніщо не залишає телефон.';

  @override
  String get indexStartAction => 'Проіндексувати фото';

  @override
  String get indexPermissionTitle => 'Been Here потрібні ваші фото';

  @override
  String get indexPermissionBody =>
      'Застосунок читає лише, де й коли зроблено кожне фото, і зберігає це на цьому телефоні.';

  @override
  String get indexPermissionAction => 'Дозволити доступ';

  @override
  String get indexPermissionDeniedTitle => 'Доступ до фото вимкнено';

  @override
  String get indexPermissionDeniedBody =>
      'Без нього Been Here нічого не може показати. Увімкнути доступ можна в налаштуваннях системи.';

  @override
  String get indexLimitedAccessNotice =>
      'Ви поділилися лише вибраними фото, тож Been Here бачить тільки їх. З повним доступом застосунок знайде всі місця, де ви бували.';

  @override
  String get indexRunningTitle => 'Читання фототеки';

  @override
  String indexRunningProgress(int processed, int total) {
    return '$processed з $total';
  }

  @override
  String get indexFailedTitle => 'Індексацію зупинено';

  @override
  String get indexFailedBody =>
      'Щось пішло не так посеред процесу. Повторна спроба продовжить з того самого місця.';

  @override
  String indexedPhotoCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count фото проіндексовано',
      one: '$count фото проіндексовано',
      zero: 'Немає проіндексованих фото',
    );
    return '$_temp0';
  }

  @override
  String indexedLocationCoverage(int percent) {
    return '$percent% з них мають геопозицію';
  }

  @override
  String get commonLoading => 'Завантаження…';

  @override
  String get commonRetry => 'Спробувати ще';

  @override
  String get commonCancel => 'Скасувати';

  @override
  String hereRadiusLabel(String radius) {
    return 'У радіусі $radius';
  }

  @override
  String herePhotoCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count фото',
      one: '$count фото',
      zero: 'Немає фото',
    );
    return '$_temp0';
  }

  @override
  String hereVisitCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count відвідування',
      many: '$count відвідувань',
      few: '$count відвідування',
      one: '$count відвідування',
    );
    return '$_temp0';
  }

  @override
  String distanceMeters(int meters) {
    return '$meters м';
  }

  @override
  String distanceKilometers(String km) {
    return '$km км';
  }

  @override
  String get ageToday => 'Сьогодні';

  @override
  String get ageYesterday => 'Учора';

  @override
  String ageDaysAgo(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days дня тому',
      many: '$days днів тому',
      few: '$days дні тому',
      one: '$days день тому',
    );
    return '$_temp0';
  }

  @override
  String ageMonthsAgo(int months) {
    String _temp0 = intl.Intl.pluralLogic(
      months,
      locale: localeName,
      other: '$months місяця тому',
      many: '$months місяців тому',
      few: '$months місяці тому',
      one: '$months місяць тому',
    );
    return '$_temp0';
  }

  @override
  String ageYearsAgo(int years) {
    String _temp0 = intl.Intl.pluralLogic(
      years,
      locale: localeName,
      other: '$years року тому',
      many: '$years років тому',
      few: '$years роки тому',
      one: '$years рік тому',
    );
    return '$_temp0';
  }

  @override
  String get locationPermissionTitle => 'Де ви?';

  @override
  String get locationPermissionBody =>
      'Been Here порівнює ваше положення з місцями, де зроблено ваші фото. Порівняння відбувається на цьому телефоні.';

  @override
  String get locationPermissionAction => 'Використати мою геопозицію';

  @override
  String get locationDeniedTitle => 'Геопозицію вимкнено';

  @override
  String get locationDeniedBody =>
      'Без неї застосунок не знає, що у вас є тут. Увімкнути її можна в налаштуваннях системи.';

  @override
  String get locationUnavailableTitle => 'Позицію ще не визначено';

  @override
  String get locationUnavailableBody =>
      'Телефон ще не з\'ясував, де він. У приміщенні це може тривати якийсь час.';

  @override
  String get locationServicesDisabledTitle => 'Служби геолокації вимкнено';

  @override
  String get locationServicesDisabledBody =>
      'Увімкніть їх у налаштуваннях системи й поверніться.';

  @override
  String get hereNothingTitle => 'Ви тут не фотографували';

  @override
  String get hereNothingBody =>
      'Спробуйте більший радіус або поверніться туди, де вже бували.';

  @override
  String hereNearestHint(String distance) {
    return 'Найближчий спогад — за $distance звідси.';
  }

  @override
  String get photoDetailRephoto => 'Перезняти';

  @override
  String get photoDetailRephotoSoon =>
      'Перезйомка з\'явиться в наступній версії.';

  @override
  String photoDetailOf(int index, int total) {
    return '$index з $total';
  }

  @override
  String get debugLocationTitle => 'Тестова геопозиція';

  @override
  String get debugLocationBody =>
      'Удайте, що ви деінде, щоб перевірити екран «Тут», не встаючи з дивана.';

  @override
  String get debugLocationLatitude => 'Широта';

  @override
  String get debugLocationLongitude => 'Довгота';

  @override
  String get debugLocationApply => 'Перенестися';

  @override
  String get debugLocationClear => 'Використати справжню геопозицію';

  @override
  String get debugLocationActive => 'Тестова геопозиція активна';

  @override
  String get commonClose => 'Закрити';

  @override
  String get placesEmptyTitle => 'Місць поки немає';

  @override
  String get placesEmptyBody =>
      'Місця з\'являться, коли фото буде проіндексовано.';

  @override
  String get placesSortLabel => 'Сортування';

  @override
  String get placesSortLongestAgo => 'Найдавніше';

  @override
  String get placesSortMostPhotos => 'Найбільше фото';

  @override
  String get placesSortNearest => 'Найближчі';

  @override
  String placesMutedSection(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Без сповіщень: $count',
      one: '$count місце без сповіщень',
    );
    return '$_temp0';
  }

  @override
  String get placesMute => 'Вимкнути сповіщення';

  @override
  String get placesUnmute => 'Увімкнути сповіщення';

  @override
  String get placesUseAutoRule => 'Вирішувати автоматично';

  @override
  String get placesAutoMutedNote => 'Вимкнено автоматично — ви тут майже щодня';

  @override
  String get placesUserMutedNote => 'Вимкнено вами';

  @override
  String get placesUserUnmutedNote => 'Залишено вами';

  @override
  String placesDayCount(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days дня',
      many: '$days днів',
      few: '$days дні',
      one: '$days день',
    );
    return '$_temp0';
  }

  @override
  String get settingsPlaceNamesTitle => 'Назви місць';

  @override
  String get settingsPlaceNamesBody =>
      'Просить систему перетворити координати місця на назву. Ці координати надсилаються Apple або Google — це єдине, що в цьому застосунку залишає телефон. Типово вимкнено; повторне вимкнення забуває всі назви.';

  @override
  String get settingsAutoMuteTitle =>
      'Вимикати сповіщення для буденних місць після';

  @override
  String get settingsAutoMuteBody =>
      'Місце з фото за стільки різних днів — це місце, де ви живете, а не куди приїжджаєте.';

  @override
  String settingsAutoMuteValue(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days дня',
      many: '$days днів',
      few: '$days днів',
      one: '$days дня',
    );
    return '$_temp0';
  }

  @override
  String get settingsIndexTitle => 'Індекс фото';

  @override
  String get settingsReindex => 'Проіндексувати заново';

  @override
  String get settingsPrivacyTitle => 'Що залишається на телефоні';

  @override
  String get settingsPrivacyBody =>
      'Ваші фото, місця, де їх зроблено, і все, що застосунок із них виводить. Немає ні облікового запису, ні сервера, ні аналітики.';

  @override
  String get placesName => 'Назвати це місце';

  @override
  String get placesRename => 'Перейменувати';

  @override
  String get placesNameDialogTitle => 'Назва місця';

  @override
  String get placesNameHint => 'У бабусі, озеро, офіс…';

  @override
  String get placesNameSave => 'Зберегти';

  @override
  String get placesNameClear => 'Видалити назву';

  @override
  String placesSummary(String age, String photos) {
    return '$age · $photos';
  }

  @override
  String get notificationTitle => 'Ви тут уже бували';

  @override
  String notificationBody(String age, String photos) {
    return 'Востаннє тут: $age. $photos.';
  }

  @override
  String get alwaysLocationTitle => 'Нехай Been Here помічає за вас';

  @override
  String get alwaysLocationBody =>
      'З фоновою геопозицією телефон може повідомити Been Here, коли ви приїжджаєте туди, де вже фотографували, — і застосунок може сказати про це один раз, без того щоб ви щось відкривали.\n\nЗастосунок ніколи за вами не стежить. Телефон спостерігає за кількома колами й будить застосунок, лише коли ви входите в одне з них. Ніщо про ваше місцеперебування не залишає цей пристрій.';

  @override
  String get alwaysLocationAction => 'Увімкнути прибуття';

  @override
  String get alwaysLocationLater => 'Не зараз';

  @override
  String get alwaysLocationDeniedBody =>
      'Фонову геопозицію вимкнено, тож прибуття мовчать. Усе інше працює як раніше; увімкнути її можна в налаштуваннях системи будь-коли.';

  @override
  String get settingsArrivalsTitle => 'Прибуття';

  @override
  String get settingsArrivalsOn =>
      'Been Here повідомить, коли ви приїдете туди, де давно не фотографували.';

  @override
  String get settingsArrivalsOff =>
      'Been Here мовчить. Під час увімкнення буде запитано фонову геопозицію.';

  @override
  String get settingsMemoryAgeTitle => 'Згадувати лише місця, старші за';

  @override
  String settingsMemoryAgeValue(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days дня',
      many: '$days днів',
      few: '$days дні',
      one: '$days день',
    );
    return '$_temp0';
  }

  @override
  String get settingsPlaceCooldownTitle =>
      'Потім не турбувати щодо цього місця';

  @override
  String get settingsDailyLimitTitle => 'І взагалі мовчати';

  @override
  String settingsDailyLimitValue(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours години',
      many: '$hours годин',
      few: '$hours години',
      one: '$hours годину',
      zero: 'жодного часу',
    );
    return '$_temp0';
  }

  @override
  String get settingsThresholdsBody =>
      'Зменште ці значення, щоб спробувати прибуття, не чекаючи пів року.';

  @override
  String get placesTestArrival => 'Перевірити прибуття сюди';

  @override
  String get arrivalTestNotified => 'Сповіщення надіслано';

  @override
  String get arrivalTestMuted => 'Нічого: для місця вимкнено сповіщення';

  @override
  String get arrivalTestTooFewPhotos => 'Нічого: тут замало фото';

  @override
  String get arrivalTestTooRecent =>
      'Нічого: ви фотографували тут надто нещодавно';

  @override
  String get arrivalTestPlaceCooldown =>
      'Нічого: це місце нещодавно вже нагадувало про себе';

  @override
  String get arrivalTestDailyLimit =>
      'Нічого: сьогодні вже було інше сповіщення';

  @override
  String get alwaysLocationNeedsSettingsBody =>
      'Телефон залишив геопозицію в режимі «Коли застосунок використовується». iOS не запропонує цей вибір знову зсередини застосунку, тож фонову геопозицію треба перемкнути на «Завжди» в налаштуваннях системи — тоді прибуття запрацюють.';

  @override
  String get commonOpenSettings => 'Відкрити налаштування';

  @override
  String get settingsArrivalsPending =>
      'Майже: геопозиція досі в режимі «Коли застосунок використовується». Перемкніть її на «Завжди» в налаштуваннях системи.';

  @override
  String get placesSortVisits => 'Найбільше відвідувань';

  @override
  String get placesSortAscending => 'Зворотний порядок';

  @override
  String placesVisitCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count відвідування',
      many: '$count відвідувань',
      few: '$count відвідування',
      one: '$count відвідування',
      zero: 'ніколи',
    );
    return '$_temp0';
  }

  @override
  String get settingsMapTitle => 'Показувати місця на карті';

  @override
  String get settingsMapBody =>
      'Фрагменти карти завантажуються з OpenStreetMap, поки ви рухаєте й масштабуєте її, тож цей сервер постійно бачить, куди ви дивитеся. На відміну від назви місця, яку запитують один раз, це триває, доки карта відкрита. Типово вимкнено.';

  @override
  String get placesShowMap => 'Карта';

  @override
  String get placesShowList => 'Список';

  @override
  String get placesMapAttribution => '© Учасники OpenStreetMap';

  @override
  String get rephotoOverlay => 'Накладання';

  @override
  String get rephotoEdges => 'Контур';

  @override
  String get rephotoCapture => 'Зняти';

  @override
  String get rephotoSaved => 'Збережено у фото';

  @override
  String get rephotoNotSaved =>
      'Не вдалося зберегти. Можливо, додавання фото заборонено.';

  @override
  String get rephotoNoCamera =>
      'Камера недоступна. Been Here потрібна камера, щоб зробити знімок у відповідь на старий.';

  @override
  String get rephotoThenAndNow => 'Тоді й зараз';

  @override
  String get rephotoShare => 'Поділитися';

  @override
  String get rephotoThen => 'Тоді';

  @override
  String get rephotoNow => 'Зараз';

  @override
  String get rephotoShareFailed =>
      'Не вдалося створити зображення для поширення.';

  @override
  String get onboardingSkip => 'Пропустити';

  @override
  String get onboardingNext => 'Далі';

  @override
  String get onboardingWhatTitle => 'Фото з того місця, де ви стоїте';

  @override
  String get onboardingWhatBody =>
      'Приїдьте туди, де вже фотографували, і Been Here покаже, що ви там зняли, — відвідування за відвідуванням, починаючи з найдавнішого.';

  @override
  String get onboardingPrivacyTitle => 'Ніщо не залишає телефон';

  @override
  String get onboardingPrivacyBody =>
      'Ні облікового запису, ні сервера, ні аналітики. Been Here читає фототеку на пристрої й зберігає поруч невеликий індекс. Ваші фото й місця, де їх зроблено, залишаються там, де є.';

  @override
  String get onboardingPrivacyFootnote =>
      'До мережі можуть потрапити дві речі, і обидві вимкнені, доки ви їх не ввімкнете: назви місць і карта.';

  @override
  String get onboardingPhotosTitle => 'Потрібні ваші фото';

  @override
  String get onboardingPhotosBody =>
      'Been Here записує, яке фото зроблено де. Він нічого не копіює й не переміщує — пам\'ятає ідентифікатори й координати, а самі знімки читає, лише коли показує їх вам.';

  @override
  String get onboardingPhotosAction => 'Дозволити фото';

  @override
  String get onboardingDone => 'Почати';

  @override
  String get settingsAboutTitle => 'Про застосунок';

  @override
  String settingsVersion(String version, String build) {
    return 'Версія $version ($build)';
  }

  @override
  String get settingsSourceTitle => 'Вихідний код';

  @override
  String get settingsShowIntro => 'Показати вступ знову';

  @override
  String photoSemanticLabel(String date) {
    return 'Фото від $date';
  }

  @override
  String photoOpenSemanticLabel(int index, int total, String date) {
    return 'Фото $index з $total, $date';
  }

  @override
  String get placesActionsLabel => 'Що зробити з цим місцем';

  @override
  String get radiusSemanticLabel => 'Радіус пошуку';

  @override
  String get hereMapTitle => 'Поблизу';

  @override
  String get hereOpenInMaps => 'Відкрити в Картах';

  @override
  String get hereBackToMe => 'Назад до мого місця';

  @override
  String get herePlaceFallbackTitle => 'Знайоме місце';

  @override
  String get arrivalTestNearHome => 'Надто близько до дому, щоб бути новиною.';

  @override
  String get settingsHomeRadiusTitle => 'Мовчати в радіусі';

  @override
  String settingsHomeRadiusValue(num km) {
    String _temp0 = intl.Intl.pluralLogic(
      km,
      locale: localeName,
      other: '$km км від дому',
      one: '$km км від дому',
      zero: 'нуль — ніколи не мовчати',
    );
    return '$_temp0';
  }

  @override
  String get settingsHomeRadiusBody =>
      'Повсякденне життя минає біля дому, і саме там телефон, що його коментує, найменш доречний. Місця, ближчі за цю відстань, ніколи не відстежуються.';

  @override
  String get settingsQuietTitle => 'Чому тихо';

  @override
  String settingsQuietWatching(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Відстежується $count місця',
      many: 'Відстежується $count місць',
      few: 'Відстежуються $count місця',
      one: 'Відстежується $count місце',
      zero: 'Жодне місце не відстежується',
    );
    return '$_temp0';
  }

  @override
  String settingsQuietNearest(String distance) {
    return 'Найближче відстежуване місце: $distance';
  }

  @override
  String get settingsQuietNothingWatched =>
      'Нічого не відстежується, тож прибуттів бути не може.';

  @override
  String settingsQuietLastNotified(String when) {
    return 'Останнє сповіщення: $when';
  }

  @override
  String get settingsQuietNever => 'ніколи';

  @override
  String settingsQuietBreakdown(int total, String reasons) {
    return 'З $total місць: $reasons';
  }

  @override
  String settingsQuietReasonMuted(Object count) {
    return 'без сповіщень: $count';
  }

  @override
  String settingsQuietReasonNearHome(Object count) {
    return 'біля дому: $count';
  }

  @override
  String settingsQuietReasonTooFewPhotos(Object count) {
    return 'замало фото: $count';
  }

  @override
  String settingsQuietReasonTooRecent(Object count) {
    return 'знято нещодавно: $count';
  }

  @override
  String settingsQuietReasonPlaceCooldown(Object count) {
    return 'ще на паузі: $count';
  }

  @override
  String settingsQuietReasonEligible(Object count) {
    return 'варто відстежувати: $count';
  }

  @override
  String get ageSemanticLabel => 'Вік фото';

  @override
  String get ageStopNow => 'зараз';

  @override
  String get ageStopDay => '1 день';

  @override
  String get ageStop3Days => '3 дні';

  @override
  String get ageStopWeek => '1 тиждень';

  @override
  String get ageStop2Weeks => '2 тижні';

  @override
  String get ageStopMonth => '1 місяць';

  @override
  String get ageStop3Months => '3 місяці';

  @override
  String get ageStop6Months => '6 місяців';

  @override
  String get ageStopYear => '1 рік';

  @override
  String get ageStop2Years => '2 роки';

  @override
  String get ageStop5Years => '5 років';

  @override
  String get ageStop10Years => '10 років';

  @override
  String get ageStopAll => 'усі';

  @override
  String get ageWindowAll => 'Усі фото';

  @override
  String ageWindowNewerThan(String stop) {
    return 'Не старші: $stop';
  }

  @override
  String ageWindowOlderThan(String stop) {
    return 'Старші: $stop';
  }

  @override
  String ageWindowBetween(String newest, String oldest) {
    return 'Від $newest до $oldest';
  }

  @override
  String get ageWindowReset => 'Скинути';

  @override
  String mapDotCountCapped(int count) {
    return '$count+ фото';
  }
}
