// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'Been Here';

  @override
  String get hereTabLabel => 'Здесь';

  @override
  String get placesTabLabel => 'Места';

  @override
  String get settingsTabLabel => 'Настройки';

  @override
  String get hereEmptyTitle => 'Здесь вы не фотографировали';

  @override
  String get hereEmptyBody =>
      'Увеличьте радиус поиска или вернитесь туда, где уже бывали.';

  @override
  String get hereNotIndexedTitle => 'Пока ничего не проиндексировано';

  @override
  String get hereNotIndexedBody =>
      'Been Here нужно один раз прочитать вашу медиатеку, чтобы узнать, где вы бывали. Ничего не покидает телефон.';

  @override
  String get indexStartAction => 'Проиндексировать фото';

  @override
  String get indexPermissionTitle => 'Been Here нужны ваши фото';

  @override
  String get indexPermissionBody =>
      'Приложение читает только, где и когда сделан каждый снимок, и хранит это на этом телефоне.';

  @override
  String get indexPermissionAction => 'Разрешить доступ';

  @override
  String get indexPermissionDeniedTitle => 'Доступ к фото выключен';

  @override
  String get indexPermissionDeniedBody =>
      'Без него Been Here ничего не может показать. Включить доступ можно в настройках системы.';

  @override
  String get indexLimitedAccessNotice =>
      'Вы открыли доступ только к выбранным фото, поэтому Been Here видит только их. С полным доступом приложение найдёт все места, где вы бывали.';

  @override
  String get indexRunningTitle => 'Чтение медиатеки';

  @override
  String indexRunningProgress(int processed, int total) {
    return '$processed из $total';
  }

  @override
  String get indexFailedTitle => 'Индексация остановлена';

  @override
  String get indexFailedBody =>
      'Что-то пошло не так на полпути. Повторная попытка продолжит с того же места.';

  @override
  String indexedPhotoCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count фото проиндексировано',
      many: '$count фото проиндексировано',
      few: '$count фото проиндексированы',
      one: '$count фото проиндексировано',
      zero: 'Нет проиндексированных фото',
    );
    return '$_temp0';
  }

  @override
  String indexedLocationCoverage(int percent) {
    return 'У $percent% из них есть геопозиция';
  }

  @override
  String get commonLoading => 'Загрузка…';

  @override
  String get commonRetry => 'Повторить';

  @override
  String get commonCancel => 'Отмена';

  @override
  String hereRadiusLabel(String radius) {
    return 'В радиусе $radius';
  }

  @override
  String herePhotoCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count фото',
      one: '$count фото',
      zero: 'Нет фото',
    );
    return '$_temp0';
  }

  @override
  String hereVisitCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count посещения',
      many: '$count посещений',
      few: '$count посещения',
      one: '$count посещение',
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
  String get ageToday => 'Сегодня';

  @override
  String get ageYesterday => 'Вчера';

  @override
  String ageDaysAgo(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days дня назад',
      many: '$days дней назад',
      few: '$days дня назад',
      one: '$days день назад',
    );
    return '$_temp0';
  }

  @override
  String ageMonthsAgo(int months) {
    String _temp0 = intl.Intl.pluralLogic(
      months,
      locale: localeName,
      other: '$months месяца назад',
      many: '$months месяцев назад',
      few: '$months месяца назад',
      one: '$months месяц назад',
    );
    return '$_temp0';
  }

  @override
  String ageYearsAgo(int years) {
    String _temp0 = intl.Intl.pluralLogic(
      years,
      locale: localeName,
      other: '$years года назад',
      many: '$years лет назад',
      few: '$years года назад',
      one: '$years год назад',
    );
    return '$_temp0';
  }

  @override
  String get locationPermissionTitle => 'Где вы?';

  @override
  String get locationPermissionBody =>
      'Been Here сравнивает ваше положение с местами, где сделаны ваши фото. Сравнение происходит на этом телефоне.';

  @override
  String get locationPermissionAction => 'Использовать геопозицию';

  @override
  String get locationDeniedTitle => 'Геопозиция выключена';

  @override
  String get locationDeniedBody =>
      'Без неё приложение не знает, что у вас есть здесь. Включить её можно в настройках системы.';

  @override
  String get locationUnavailableTitle => 'Позиция ещё не определена';

  @override
  String get locationUnavailableBody =>
      'Телефон пока не понял, где находится. В помещении это может занять немного времени.';

  @override
  String get locationServicesDisabledTitle => 'Службы геолокации выключены';

  @override
  String get locationServicesDisabledBody =>
      'Включите их в настройках системы и вернитесь.';

  @override
  String get hereNothingTitle => 'Здесь вы не фотографировали';

  @override
  String get hereNothingBody =>
      'Попробуйте радиус побольше или вернитесь туда, где уже бывали.';

  @override
  String hereNearestHint(String distance) {
    return 'Ближайшее воспоминание — в $distance отсюда.';
  }

  @override
  String get photoDetailRephoto => 'Переснять';

  @override
  String get photoDetailRephotoSoon =>
      'Пересъёмка появится в следующей версии.';

  @override
  String photoDetailOf(int index, int total) {
    return '$index из $total';
  }

  @override
  String get debugLocationTitle => 'Отладочная геопозиция';

  @override
  String get debugLocationBody =>
      'Притворитесь, что вы в другом месте, чтобы проверить экран «Здесь», не вставая с дивана.';

  @override
  String get debugLocationLatitude => 'Широта';

  @override
  String get debugLocationLongitude => 'Долгота';

  @override
  String get debugLocationApply => 'Перенестись';

  @override
  String get debugLocationClear => 'Использовать настоящую геопозицию';

  @override
  String get debugLocationActive => 'Отладочная геопозиция включена';

  @override
  String get commonClose => 'Закрыть';

  @override
  String get placesEmptyTitle => 'Мест пока нет';

  @override
  String get placesEmptyBody =>
      'Места появятся, когда фото будут проиндексированы.';

  @override
  String get placesSortLabel => 'Сортировка';

  @override
  String get placesSortLongestAgo => 'Давно не были';

  @override
  String get placesSortMostPhotos => 'Больше всего фото';

  @override
  String get placesSortNearest => 'Ближайшие';

  @override
  String placesMutedSection(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Без уведомлений: $count',
      one: '$count место без уведомлений',
    );
    return '$_temp0';
  }

  @override
  String get placesMute => 'Отключить уведомления';

  @override
  String get placesUnmute => 'Включить уведомления';

  @override
  String get placesUseAutoRule => 'Решать автоматически';

  @override
  String get placesAutoMutedNote =>
      'Отключено автоматически — вы здесь почти каждый день';

  @override
  String get placesUserMutedNote => 'Отключено вами';

  @override
  String get placesUserUnmutedNote => 'Оставлено вами';

  @override
  String placesDayCount(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days дня',
      many: '$days дней',
      few: '$days дня',
      one: '$days день',
    );
    return '$_temp0';
  }

  @override
  String get settingsPlaceNamesTitle => 'Названия мест';

  @override
  String get settingsPlaceNamesBody =>
      'Просит систему превратить координаты места в название. Эти координаты уходят в Apple или Google — это единственное, что покидает телефон в этом приложении. По умолчанию выключено; при повторном выключении все названия забываются.';

  @override
  String get settingsAutoMuteTitle =>
      'Отключать уведомления для повседневных мест после';

  @override
  String get settingsAutoMuteBody =>
      'Место, где есть фото за столько разных дней, — это место, где вы живёте, а не куда приезжаете.';

  @override
  String settingsAutoMuteValue(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days дня',
      many: '$days дней',
      few: '$days дней',
      one: '$days дня',
    );
    return '$_temp0';
  }

  @override
  String get settingsIndexTitle => 'Индекс фото';

  @override
  String get settingsReindex => 'Проиндексировать заново';

  @override
  String get settingsPrivacyTitle => 'Что остаётся на телефоне';

  @override
  String get settingsPrivacyBody =>
      'Ваши фото, места, где они сделаны, и всё, что приложение из них выводит. Нет ни аккаунта, ни сервера, ни аналитики.';

  @override
  String get placesName => 'Назвать это место';

  @override
  String get placesRename => 'Переименовать';

  @override
  String get placesNameDialogTitle => 'Название места';

  @override
  String get placesNameHint => 'У бабушки, озеро, офис…';

  @override
  String get placesNameSave => 'Сохранить';

  @override
  String get placesNameClear => 'Удалить название';

  @override
  String placesSummary(String age, String photos) {
    return '$age · $photos';
  }

  @override
  String get notificationTitle => 'Вы здесь уже бывали';

  @override
  String notificationBody(String age, String photos) {
    return 'Последний раз здесь: $age. $photos.';
  }

  @override
  String get alwaysLocationTitle => 'Пусть Been Here замечает за вас';

  @override
  String get alwaysLocationBody =>
      'С фоновой геопозицией телефон может сообщить Been Here, когда вы приезжаете туда, где уже фотографировали, — и приложение может сказать об этом один раз, без того чтобы вы что-то открывали.\n\nПриложение никогда за вами не следит. Телефон наблюдает за несколькими кругами и будит приложение, только когда вы входите в один из них. Ничего о вашем местоположении не покидает это устройство.';

  @override
  String get alwaysLocationAction => 'Включить прибытия';

  @override
  String get alwaysLocationLater => 'Не сейчас';

  @override
  String get alwaysLocationDeniedBody =>
      'Фоновая геопозиция выключена, поэтому прибытия молчат. Всё остальное работает как раньше; включить её можно в настройках системы в любой момент.';

  @override
  String get settingsArrivalsTitle => 'Прибытия';

  @override
  String get settingsArrivalsOn =>
      'Been Here сообщит, когда вы приедете туда, где давно не фотографировали.';

  @override
  String get settingsArrivalsOff =>
      'Been Here молчит. При включении будет запрошена фоновая геопозиция.';

  @override
  String get settingsMemoryAgeTitle => 'Упоминать только места старше';

  @override
  String settingsMemoryAgeValue(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days дня',
      many: '$days дней',
      few: '$days дней',
      one: '$days дня',
    );
    return '$_temp0';
  }

  @override
  String get settingsPlaceCooldownTitle => 'Потом не беспокоить об этом месте';

  @override
  String get settingsDailyLimitTitle => 'И вообще молчать';

  @override
  String settingsDailyLimitValue(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours часа',
      many: '$hours часов',
      few: '$hours часа',
      one: '$hours час',
      zero: 'нисколько',
    );
    return '$_temp0';
  }

  @override
  String get settingsThresholdsBody =>
      'Уменьшите эти значения, чтобы попробовать прибытия, не дожидаясь полгода.';

  @override
  String get placesTestArrival => 'Проверить прибытие сюда';

  @override
  String get arrivalTestNotified => 'Уведомление отправлено';

  @override
  String get arrivalTestMuted => 'Ничего: уведомления для места отключены';

  @override
  String get arrivalTestTooFewPhotos => 'Ничего: здесь слишком мало фото';

  @override
  String get arrivalTestTooRecent =>
      'Ничего: вы фотографировали здесь слишком недавно';

  @override
  String get arrivalTestPlaceCooldown =>
      'Ничего: это место недавно уже напоминало о себе';

  @override
  String get arrivalTestDailyLimit =>
      'Ничего: сегодня уже было другое уведомление';

  @override
  String get alwaysLocationNeedsSettingsBody =>
      'Телефон оставил геопозицию в режиме «При использовании». iOS не предложит этот выбор снова изнутри приложения, поэтому фоновую геопозицию нужно переключить на «Всегда» в настройках системы — тогда прибытия заработают.';

  @override
  String get commonOpenSettings => 'Открыть настройки';

  @override
  String get settingsArrivalsPending =>
      'Почти: геопозиция всё ещё в режиме «При использовании». Переключите её на «Всегда» в настройках системы.';

  @override
  String get placesSortVisits => 'Больше всего посещений';

  @override
  String get placesSortAscending => 'Обратный порядок';

  @override
  String placesVisitCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count посещения',
      many: '$count посещений',
      few: '$count посещения',
      one: '$count посещение',
      zero: 'никогда',
    );
    return '$_temp0';
  }

  @override
  String get settingsMapTitle => 'Показывать места на карте';

  @override
  String get settingsMapBody =>
      'Фрагменты карты загружаются с OpenStreetMap, пока вы двигаете и масштабируете её, поэтому этот сервер постоянно видит, куда вы смотрите. В отличие от названия места, которое запрашивается один раз, это продолжается, пока карта открыта. По умолчанию выключено.';

  @override
  String get placesShowMap => 'Карта';

  @override
  String get placesShowList => 'Список';

  @override
  String get placesMapAttribution => '© Участники OpenStreetMap';

  @override
  String get rephotoOverlay => 'Наложение';

  @override
  String get rephotoEdges => 'Контур';

  @override
  String get rephotoCapture => 'Снять';

  @override
  String get rephotoSaved => 'Сохранено в фото';

  @override
  String get rephotoNotSaved =>
      'Не удалось сохранить. Возможно, добавление фото запрещено.';

  @override
  String get rephotoNoCamera =>
      'Камера недоступна. Been Here нужна камера, чтобы сделать снимок в ответ на старый.';

  @override
  String get rephotoThenAndNow => 'Тогда и сейчас';

  @override
  String get rephotoShare => 'Поделиться';

  @override
  String get rephotoThen => 'Тогда';

  @override
  String get rephotoNow => 'Сейчас';

  @override
  String get rephotoShareFailed =>
      'Не удалось создать изображение для отправки.';

  @override
  String get onboardingSkip => 'Пропустить';

  @override
  String get onboardingNext => 'Далее';

  @override
  String get onboardingWhatTitle => 'Фото с того места, где вы стоите';

  @override
  String get onboardingWhatBody =>
      'Приезжайте туда, где уже фотографировали, и Been Here покажет, что вы там сняли, — посещение за посещением, начиная с самого давнего.';

  @override
  String get onboardingPrivacyTitle => 'Ничего не покидает телефон';

  @override
  String get onboardingPrivacyBody =>
      'Ни аккаунта, ни сервера, ни аналитики. Been Here читает медиатеку на устройстве и хранит рядом небольшой индекс. Ваши фото и места, где они сделаны, остаются там, где были.';

  @override
  String get onboardingPrivacyFootnote =>
      'В сеть могут попасть две вещи, и обе выключены, пока вы их не включите: названия мест и карта.';

  @override
  String get onboardingPhotosTitle => 'Нужны ваши фото';

  @override
  String get onboardingPhotosBody =>
      'Been Here отмечает, какое фото сделано где. Он ничего не копирует и не перемещает — запоминает идентификаторы и координаты, а сами снимки читает, только когда показывает их вам.';

  @override
  String get onboardingPhotosAction => 'Разрешить доступ к фото';

  @override
  String get onboardingDone => 'Начать';

  @override
  String get settingsAboutTitle => 'О приложении';

  @override
  String settingsVersion(String version, String build) {
    return 'Версия $version ($build)';
  }

  @override
  String get settingsSourceTitle => 'Исходный код';

  @override
  String get settingsShowIntro => 'Показать вступление снова';

  @override
  String photoSemanticLabel(String date) {
    return 'Фото от $date';
  }

  @override
  String photoOpenSemanticLabel(int index, int total, String date) {
    return 'Фото $index из $total, $date';
  }

  @override
  String get placesActionsLabel => 'Что сделать с этим местом';

  @override
  String get radiusSemanticLabel => 'Радиус поиска';

  @override
  String get hereMapTitle => 'Поблизости';

  @override
  String get hereOpenInMaps => 'Открыть в Картах';

  @override
  String get hereBackToMe => 'Вернуться к моему местоположению';

  @override
  String get herePlaceFallbackTitle => 'Знакомое место';

  @override
  String get arrivalTestNearHome =>
      'Слишком близко к дому, чтобы быть новостью.';

  @override
  String get settingsHomeRadiusTitle => 'Молчать в радиусе';

  @override
  String settingsHomeRadiusValue(num km) {
    String _temp0 = intl.Intl.pluralLogic(
      km,
      locale: localeName,
      other: '$km км от дома',
      one: '$km км от дома',
      zero: 'нисколько — никогда не молчать',
    );
    return '$_temp0';
  }

  @override
  String get settingsHomeRadiusBody =>
      'Повседневная жизнь проходит рядом с домом, и именно там телефон, который её комментирует, меньше всего уместен. Места ближе этого расстояния никогда не отслеживаются.';

  @override
  String get settingsQuietTitle => 'Почему тихо';

  @override
  String settingsQuietWatching(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Отслеживается $count места',
      many: 'Отслеживается $count мест',
      few: 'Отслеживаются $count места',
      one: 'Отслеживается $count место',
      zero: 'Ни одно место не отслеживается',
    );
    return '$_temp0';
  }

  @override
  String settingsQuietNearest(String distance) {
    return 'Ближайшее отслеживаемое место: $distance';
  }

  @override
  String get settingsQuietNothingWatched =>
      'Ничего не отслеживается, поэтому прибытий быть не может.';

  @override
  String settingsQuietLastNotified(String when) {
    return 'Последнее уведомление: $when';
  }

  @override
  String get settingsQuietNever => 'никогда';

  @override
  String settingsQuietBreakdown(int total, String reasons) {
    return 'Из $total мест: $reasons';
  }

  @override
  String settingsQuietReasonMuted(Object count) {
    return 'без уведомлений: $count';
  }

  @override
  String settingsQuietReasonNearHome(Object count) {
    return 'рядом с домом: $count';
  }

  @override
  String settingsQuietReasonTooFewPhotos(Object count) {
    return 'мало фото: $count';
  }

  @override
  String settingsQuietReasonTooRecent(Object count) {
    return 'снято недавно: $count';
  }

  @override
  String settingsQuietReasonPlaceCooldown(Object count) {
    return 'ещё на паузе: $count';
  }

  @override
  String settingsQuietReasonEligible(Object count) {
    return 'стоит отслеживать: $count';
  }

  @override
  String get ageSemanticLabel => 'Возраст фото';

  @override
  String get ageStopNow => 'сейчас';

  @override
  String get ageStopDay => '1 день';

  @override
  String get ageStop3Days => '3 дня';

  @override
  String get ageStopWeek => '1 неделя';

  @override
  String get ageStop2Weeks => '2 недели';

  @override
  String get ageStopMonth => '1 месяц';

  @override
  String get ageStop3Months => '3 месяца';

  @override
  String get ageStop6Months => '6 месяцев';

  @override
  String get ageStopYear => '1 год';

  @override
  String get ageStop2Years => '2 года';

  @override
  String get ageStop5Years => '5 лет';

  @override
  String get ageStop10Years => '10 лет';

  @override
  String get ageStopAll => 'все';

  @override
  String get ageWindowAll => 'Все фото';

  @override
  String ageWindowNewerThan(String stop) {
    return 'Не старше: $stop';
  }

  @override
  String ageWindowOlderThan(String stop) {
    return 'Старше: $stop';
  }

  @override
  String ageWindowBetween(String newest, String oldest) {
    return 'От $newest до $oldest';
  }

  @override
  String get ageWindowReset => 'Сбросить';

  @override
  String mapDotCountCapped(int count) {
    return '$count+ фото';
  }
}
