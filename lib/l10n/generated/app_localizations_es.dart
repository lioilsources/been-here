// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Been Here';

  @override
  String get hereTabLabel => 'Aquí';

  @override
  String get placesTabLabel => 'Lugares';

  @override
  String get settingsTabLabel => 'Ajustes';

  @override
  String get hereEmptyTitle => 'No has hecho fotos aquí';

  @override
  String get hereEmptyBody =>
      'Amplía el radio de búsqueda o vuelve a algún sitio donde ya hayas estado.';

  @override
  String get hereNotIndexedTitle => 'Aún no hay nada indexado';

  @override
  String get hereNotIndexedBody =>
      'Been Here necesita leer tu fototeca una vez para saber dónde has estado. Nada sale de tu teléfono.';

  @override
  String get indexStartAction => 'Indexar mis fotos';

  @override
  String get indexPermissionTitle => 'Been Here necesita tus fotos';

  @override
  String get indexPermissionBody =>
      'Solo lee dónde y cuándo se hizo cada foto, y lo guarda en este teléfono.';

  @override
  String get indexPermissionAction => 'Permitir acceso';

  @override
  String get indexPermissionDeniedTitle =>
      'El acceso a las fotos está desactivado';

  @override
  String get indexPermissionDeniedBody =>
      'Sin él, Been Here no puede mostrarte nada. Puedes activarlo en los ajustes del sistema.';

  @override
  String get indexLimitedAccessNotice =>
      'Solo has compartido algunas fotos, así que Been Here solo puede ver esas. Con acceso completo puede encontrar todos los lugares donde has estado.';

  @override
  String get indexRunningTitle => 'Leyendo tu fototeca';

  @override
  String indexRunningProgress(int processed, int total) {
    return '$processed de $total';
  }

  @override
  String get indexFailedTitle => 'La indexación se detuvo';

  @override
  String get indexFailedBody =>
      'Algo salió mal a medio camino. Al volver a intentarlo, continúa desde donde se quedó.';

  @override
  String indexedPhotoCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotos indexadas',
      one: '$count foto indexada',
      zero: 'Ninguna foto indexada',
    );
    return '$_temp0';
  }

  @override
  String indexedLocationCoverage(int percent) {
    return 'El $percent % tiene ubicación';
  }

  @override
  String get commonLoading => 'Cargando…';

  @override
  String get commonRetry => 'Reintentar';

  @override
  String get commonCancel => 'Cancelar';

  @override
  String hereRadiusLabel(String radius) {
    return 'A menos de $radius';
  }

  @override
  String herePhotoCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotos',
      one: '$count foto',
      zero: 'Ninguna foto',
    );
    return '$_temp0';
  }

  @override
  String hereVisitCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count visitas',
      one: '$count visita',
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
  String get ageToday => 'Hoy';

  @override
  String get ageYesterday => 'Ayer';

  @override
  String ageDaysAgo(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Hace $days días',
    );
    return '$_temp0';
  }

  @override
  String ageMonthsAgo(int months) {
    String _temp0 = intl.Intl.pluralLogic(
      months,
      locale: localeName,
      other: 'Hace $months meses',
      one: 'Hace un mes',
    );
    return '$_temp0';
  }

  @override
  String ageYearsAgo(int years) {
    String _temp0 = intl.Intl.pluralLogic(
      years,
      locale: localeName,
      other: 'Hace $years años',
      one: 'Hace un año',
    );
    return '$_temp0';
  }

  @override
  String get locationPermissionTitle => '¿Dónde estás?';

  @override
  String get locationPermissionBody =>
      'Been Here compara tu posición con los lugares donde se hicieron tus fotos. La comparación se hace en este teléfono.';

  @override
  String get locationPermissionAction => 'Usar mi ubicación';

  @override
  String get locationDeniedTitle => 'La ubicación está desactivada';

  @override
  String get locationDeniedBody =>
      'Sin ella, la app no puede saber qué tienes aquí. Puedes activarla en los ajustes del sistema.';

  @override
  String get locationUnavailableTitle => 'Aún sin posición';

  @override
  String get locationUnavailableBody =>
      'Tu teléfono todavía no sabe dónde está. En interiores puede tardar un momento.';

  @override
  String get locationServicesDisabledTitle =>
      'Los servicios de ubicación están desactivados';

  @override
  String get locationServicesDisabledBody =>
      'Actívalos en los ajustes del sistema y vuelve.';

  @override
  String get hereNothingTitle => 'No has hecho fotos aquí';

  @override
  String get hereNothingBody =>
      'Prueba con un radio mayor o vuelve a algún sitio donde ya hayas estado.';

  @override
  String hereNearestHint(String distance) {
    return 'Tu recuerdo más cercano está a $distance.';
  }

  @override
  String get photoDetailRephoto => 'Refotografiar';

  @override
  String get photoDetailRephotoSoon =>
      'Refotografiar llegará en una versión posterior.';

  @override
  String photoDetailOf(int index, int total) {
    return '$index de $total';
  }

  @override
  String get debugLocationTitle => 'Ubicación de depuración';

  @override
  String get debugLocationBody =>
      'Haz como si estuvieras en otro sitio, para probar la pantalla Aquí desde el sofá.';

  @override
  String get debugLocationLatitude => 'Latitud';

  @override
  String get debugLocationLongitude => 'Longitud';

  @override
  String get debugLocationApply => 'Ir allí';

  @override
  String get debugLocationClear => 'Usar la ubicación real';

  @override
  String get debugLocationActive => 'Ubicación de depuración activa';

  @override
  String get commonClose => 'Cerrar';

  @override
  String get placesEmptyTitle => 'Aún no hay lugares';

  @override
  String get placesEmptyBody =>
      'Los lugares aparecen cuando tus fotos se han indexado.';

  @override
  String get placesSortLabel => 'Ordenar por';

  @override
  String get placesSortLongestAgo => 'Hace más tiempo';

  @override
  String get placesSortMostPhotos => 'Más fotos';

  @override
  String get placesSortNearest => 'Más cercano';

  @override
  String placesMutedSection(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count lugares silenciados',
      one: '$count lugar silenciado',
    );
    return '$_temp0';
  }

  @override
  String get placesMute => 'Silenciar';

  @override
  String get placesUnmute => 'Dejar de silenciar';

  @override
  String get placesUseAutoRule => 'Decidir automáticamente';

  @override
  String get placesAutoMutedNote =>
      'Silenciado automáticamente: estás aquí casi todos los días';

  @override
  String get placesUserMutedNote => 'Silenciado por ti';

  @override
  String get placesUserUnmutedNote => 'Mantenido visible por ti';

  @override
  String placesDayCount(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days días',
      one: '$days día',
    );
    return '$_temp0';
  }

  @override
  String get settingsPlaceNamesTitle => 'Poner nombre a los lugares';

  @override
  String get settingsPlaceNamesBody =>
      'Pide al sistema que convierta las coordenadas de un lugar en un nombre. Esa coordenada va a Apple o Google: es lo único de esta app que sale de tu teléfono. Desactivado por defecto; al volver a desactivarlo se olvidan todos los nombres.';

  @override
  String get settingsAutoMuteTitle => 'Silenciar lugares cotidianos tras';

  @override
  String get settingsAutoMuteBody =>
      'Un lugar con fotos de tantos días distintos es un sitio donde vives, no uno que visitas.';

  @override
  String settingsAutoMuteValue(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days días',
    );
    return '$_temp0';
  }

  @override
  String get settingsIndexTitle => 'Índice de fotos';

  @override
  String get settingsReindex => 'Volver a indexar desde cero';

  @override
  String get settingsPrivacyTitle => 'Lo que se queda en este teléfono';

  @override
  String get settingsPrivacyBody =>
      'Tus fotos, dónde se hicieron y todo lo que esta app deduce de ellas. No hay cuenta, ni servidor, ni analíticas.';

  @override
  String get placesName => 'Poner nombre a este lugar';

  @override
  String get placesRename => 'Renombrar';

  @override
  String get placesNameDialogTitle => 'Nombre del lugar';

  @override
  String get placesNameHint => 'Casa de la abuela, el lago, la oficina…';

  @override
  String get placesNameSave => 'Guardar';

  @override
  String get placesNameClear => 'Quitar nombre';

  @override
  String placesSummary(String age, String photos) {
    return '$age · $photos';
  }

  @override
  String get notificationTitle => 'Ya has estado aquí';

  @override
  String notificationBody(String age, String photos) {
    return 'Tu última visita aquí: $age. $photos.';
  }

  @override
  String get alwaysLocationTitle => 'Deja que Been Here se fije por ti';

  @override
  String get alwaysLocationBody =>
      'Con la ubicación en segundo plano, tu teléfono puede avisar a Been Here cuando llegas a un sitio que ya has fotografiado, y la app puede decírtelo una vez, sin que abras nada.\n\nLa app nunca te sigue. Tu teléfono vigila un puñado de círculos y solo despierta la app cuando entras en uno. Nada sobre dónde estás sale de este dispositivo.';

  @override
  String get alwaysLocationAction => 'Activar llegadas';

  @override
  String get alwaysLocationLater => 'Ahora no';

  @override
  String get alwaysLocationDeniedBody =>
      'La ubicación en segundo plano está desactivada, así que las llegadas se quedan en silencio. Todo lo demás funciona como antes; puedes activarla en los ajustes del sistema cuando quieras.';

  @override
  String get settingsArrivalsTitle => 'Llegadas';

  @override
  String get settingsArrivalsOn =>
      'Been Here te avisará cuando llegues a un sitio que no hayas fotografiado en un tiempo.';

  @override
  String get settingsArrivalsOff =>
      'Been Here se queda en silencio. Al activarlo se pide la ubicación en segundo plano.';

  @override
  String get settingsMemoryAgeTitle => 'Mencionar solo lugares de hace más de';

  @override
  String settingsMemoryAgeValue(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days días',
      one: '$days día',
    );
    return '$_temp0';
  }

  @override
  String get settingsPlaceCooldownTitle =>
      'Después, dejar ese lugar tranquilo durante';

  @override
  String get settingsDailyLimitTitle => 'Y no decir nada en absoluto durante';

  @override
  String settingsDailyLimitValue(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours horas',
      one: '$hours hora',
      zero: 'nada de tiempo',
    );
    return '$_temp0';
  }

  @override
  String get settingsThresholdsBody =>
      'Baja estos valores para probar las llegadas sin esperar medio año.';

  @override
  String get placesTestArrival => 'Probar una llegada aquí';

  @override
  String get arrivalTestNotified => 'Notificación enviada';

  @override
  String get arrivalTestMuted => 'Nada: el lugar está silenciado';

  @override
  String get arrivalTestTooFewPhotos => 'Nada: hay muy pocas fotos aquí';

  @override
  String get arrivalTestTooRecent => 'Nada: fotografiaste aquí hace muy poco';

  @override
  String get arrivalTestPlaceCooldown => 'Nada: este lugar ya habló hace poco';

  @override
  String get arrivalTestDailyLimit => 'Nada: otra cosa ya habló hoy';

  @override
  String get alwaysLocationNeedsSettingsBody =>
      'Tu teléfono dejó la ubicación en «Cuando se use la app». iOS no vuelve a ofrecer la opción desde dentro de una app, así que hay que cambiar la ubicación a «Siempre» en los ajustes del sistema; entonces las llegadas empezarán a funcionar.';

  @override
  String get commonOpenSettings => 'Abrir ajustes';

  @override
  String get settingsArrivalsPending =>
      'Casi: la ubicación sigue en «Cuando se use la app». Cámbiala a «Siempre» en los ajustes del sistema.';

  @override
  String get placesSortVisits => 'Más visitas';

  @override
  String get placesSortAscending => 'Orden inverso';

  @override
  String placesVisitCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count visitas',
      one: '$count visita',
      zero: 'nunca',
    );
    return '$_temp0';
  }

  @override
  String get settingsMapTitle => 'Mostrar lugares en un mapa';

  @override
  String get settingsMapBody =>
      'Las teselas del mapa se descargan de OpenStreetMap mientras te desplazas y haces zoom, así que ese servidor ve continuamente hacia dónde miras. A diferencia de un nombre de lugar, que se pide una vez, esto sigue mientras el mapa esté abierto. Desactivado por defecto.';

  @override
  String get placesShowMap => 'Mapa';

  @override
  String get placesShowList => 'Lista';

  @override
  String get placesMapAttribution => '© Colaboradores de OpenStreetMap';

  @override
  String get rephotoOverlay => 'Fundido';

  @override
  String get rephotoEdges => 'Contorno';

  @override
  String get rephotoCapture => 'Hacerla';

  @override
  String get rephotoSaved => 'Guardada en tus fotos';

  @override
  String get rephotoNotSaved =>
      'No se pudo guardar. Puede que añadir fotos esté desactivado.';

  @override
  String get rephotoNoCamera =>
      'No hay cámara disponible. Been Here necesita la cámara para hacer una foto que responda a una antigua.';

  @override
  String get rephotoThenAndNow => 'Antes y ahora';

  @override
  String get rephotoShare => 'Compartir';

  @override
  String get rephotoThen => 'Antes';

  @override
  String get rephotoNow => 'Ahora';

  @override
  String get rephotoShareFailed => 'No se pudo crear la imagen para compartir.';

  @override
  String get onboardingSkip => 'Omitir';

  @override
  String get onboardingNext => 'Siguiente';

  @override
  String get onboardingWhatTitle => 'Fotos del lugar exacto donde estás';

  @override
  String get onboardingWhatBody =>
      'Llega a un sitio que ya hayas fotografiado y Been Here te muestra lo que hiciste allí, visita a visita, empezando por la más antigua.';

  @override
  String get onboardingPrivacyTitle => 'Nada sale de tu teléfono';

  @override
  String get onboardingPrivacyBody =>
      'Sin cuenta, sin servidor, sin analíticas. Been Here lee tu fototeca en el dispositivo y guarda un pequeño índice al lado. Tus fotos, y dónde se hicieron, se quedan donde están.';

  @override
  String get onboardingPrivacyFootnote =>
      'Dos cosas pueden llegar a la red, y ambas están desactivadas hasta que las actives: los nombres de lugares y el mapa.';

  @override
  String get onboardingPhotosTitle => 'Necesita tus fotos';

  @override
  String get onboardingPhotosBody =>
      'Been Here anota qué foto se hizo dónde. Nunca copia ni mueve nada: recuerda identificadores y coordenadas, y solo lee las imágenes cuando te las muestra.';

  @override
  String get onboardingPhotosAction => 'Permitir fotos';

  @override
  String get onboardingDone => 'Empezar';

  @override
  String get settingsAboutTitle => 'Acerca de';

  @override
  String settingsVersion(String version, String build) {
    return 'Versión $version ($build)';
  }

  @override
  String get settingsSourceTitle => 'Código fuente';

  @override
  String get settingsShowIntro => 'Ver la introducción otra vez';

  @override
  String photoSemanticLabel(String date) {
    return 'Foto del $date';
  }

  @override
  String photoOpenSemanticLabel(int index, int total, String date) {
    return 'Foto $index de $total, $date';
  }

  @override
  String get placesActionsLabel => 'Qué hacer con este lugar';

  @override
  String get radiusSemanticLabel => 'Radio de búsqueda';

  @override
  String get hereMapTitle => 'Por aquí';

  @override
  String get hereOpenInMaps => 'Abrir en Mapas';

  @override
  String get hereBackToMe => 'Volver a donde estoy';

  @override
  String get herePlaceFallbackTitle => 'Un lugar que conoces';

  @override
  String get arrivalTestNearHome => 'Demasiado cerca de casa para ser noticia.';

  @override
  String get settingsHomeRadiusTitle => 'Silencio a menos de';

  @override
  String settingsHomeRadiusValue(num km) {
    String _temp0 = intl.Intl.pluralLogic(
      km,
      locale: localeName,
      other: '$km km de casa',
      one: '$km km de casa',
      zero: 'ninguna distancia: nunca en silencio',
    );
    return '$_temp0';
  }

  @override
  String get settingsHomeRadiusBody =>
      'La vida cotidiana ocurre cerca de casa, y ahí es donde menos se agradece un teléfono que la comente. Los lugares más cercanos que esto nunca se vigilan.';

  @override
  String get settingsQuietTitle => 'Por qué está en silencio';

  @override
  String settingsQuietWatching(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Se vigilan $count lugares',
      one: 'Se vigila $count lugar',
      zero: 'No se vigila ningún lugar',
    );
    return '$_temp0';
  }

  @override
  String settingsQuietNearest(String distance) {
    return 'Lugar vigilado más cercano: $distance';
  }

  @override
  String get settingsQuietNothingWatched =>
      'No se vigila nada, así que no puede haber llegadas.';

  @override
  String settingsQuietLastNotified(String when) {
    return 'Última notificación: $when';
  }

  @override
  String get settingsQuietNever => 'nunca';

  @override
  String settingsQuietBreakdown(int total, String reasons) {
    return 'De $total lugares: $reasons';
  }

  @override
  String settingsQuietReasonMuted(Object count) {
    return '$count silenciados';
  }

  @override
  String settingsQuietReasonNearHome(Object count) {
    return '$count cerca de casa';
  }

  @override
  String settingsQuietReasonTooFewPhotos(Object count) {
    return '$count con muy pocas fotos';
  }

  @override
  String settingsQuietReasonTooRecent(Object count) {
    return '$count fotografiados hace poco';
  }

  @override
  String settingsQuietReasonPlaceCooldown(Object count) {
    return '$count todavía en pausa';
  }

  @override
  String settingsQuietReasonEligible(Object count) {
    return '$count que vale la pena vigilar';
  }

  @override
  String get ageSemanticLabel => 'Antigüedad de las fotos';

  @override
  String get ageStopNow => 'ahora';

  @override
  String get ageStopDay => '1 día';

  @override
  String get ageStop3Days => '3 días';

  @override
  String get ageStopWeek => '1 semana';

  @override
  String get ageStop2Weeks => '2 semanas';

  @override
  String get ageStopMonth => '1 mes';

  @override
  String get ageStop3Months => '3 meses';

  @override
  String get ageStop6Months => '6 meses';

  @override
  String get ageStopYear => '1 año';

  @override
  String get ageStop2Years => '2 años';

  @override
  String get ageStop5Years => '5 años';

  @override
  String get ageStop10Years => '10 años';

  @override
  String get ageStopAll => 'todo';

  @override
  String get ageWindowAll => 'Todas las fotos';

  @override
  String ageWindowNewerThan(String stop) {
    return 'Hasta $stop';
  }

  @override
  String ageWindowOlderThan(String stop) {
    return 'Más de $stop';
  }

  @override
  String ageWindowBetween(String newest, String oldest) {
    return 'De $newest a $oldest';
  }

  @override
  String get ageWindowReset => 'Restablecer';

  @override
  String mapDotCountCapped(int count) {
    return '$count+ fotos';
  }
}
