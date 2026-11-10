// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Catalan Valencian (`ca`).
class AppLocalizationsCa extends AppLocalizations {
  AppLocalizationsCa([String locale = 'ca']) : super(locale);

  @override
  String get appTitle => 'Been Here';

  @override
  String get hereTabLabel => 'Aquí';

  @override
  String get placesTabLabel => 'Llocs';

  @override
  String get settingsTabLabel => 'Configuració';

  @override
  String get hereEmptyTitle => 'No has fet fotos aquí';

  @override
  String get hereEmptyBody =>
      'Amplia el radi de cerca o torna a algun lloc on ja hagis estat.';

  @override
  String get hereNotIndexedTitle => 'Encara no hi ha res indexat';

  @override
  String get hereNotIndexedBody =>
      'Been Here ha de llegir la teva fototeca una vegada per saber on has estat. Res no surt del teu telèfon.';

  @override
  String get indexStartAction => 'Indexa les meves fotos';

  @override
  String get indexPermissionTitle => 'Been Here necessita les teves fotos';

  @override
  String get indexPermissionBody =>
      'Només llegeix on i quan es va fer cada foto, i ho guarda en aquest telèfon.';

  @override
  String get indexPermissionAction => 'Permet l\'accés';

  @override
  String get indexPermissionDeniedTitle =>
      'L\'accés a les fotos està desactivat';

  @override
  String get indexPermissionDeniedBody =>
      'Sense això, Been Here no et pot mostrar res. Pots activar-lo a la configuració del sistema.';

  @override
  String get indexLimitedAccessNotice =>
      'Només has compartit algunes fotos, així que Been Here només veu aquestes. Amb accés complet pot trobar tots els llocs on has estat.';

  @override
  String get indexRunningTitle => 'S\'està llegint la teva fototeca';

  @override
  String indexRunningProgress(int processed, int total) {
    return '$processed de $total';
  }

  @override
  String get indexFailedTitle => 'La indexació s\'ha aturat';

  @override
  String get indexFailedBody =>
      'Alguna cosa ha fallat a mig camí. Si ho tornes a provar, continua des d\'on s\'havia aturat.';

  @override
  String indexedPhotoCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotos indexades',
      one: '$count foto indexada',
      zero: 'Cap foto indexada',
    );
    return '$_temp0';
  }

  @override
  String indexedLocationCoverage(int percent) {
    return 'El $percent% tenen ubicació';
  }

  @override
  String get commonLoading => 'S\'està carregant…';

  @override
  String get commonRetry => 'Torna-ho a provar';

  @override
  String get commonCancel => 'Cancel·la';

  @override
  String hereRadiusLabel(String radius) {
    return 'A menys de $radius';
  }

  @override
  String herePhotoCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotos',
      one: '$count foto',
      zero: 'Cap foto',
    );
    return '$_temp0';
  }

  @override
  String hereVisitCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count visites',
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
  String get ageToday => 'Avui';

  @override
  String get ageYesterday => 'Ahir';

  @override
  String ageDaysAgo(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Fa $days dies',
    );
    return '$_temp0';
  }

  @override
  String ageMonthsAgo(int months) {
    String _temp0 = intl.Intl.pluralLogic(
      months,
      locale: localeName,
      other: 'Fa $months mesos',
      one: 'Fa un mes',
    );
    return '$_temp0';
  }

  @override
  String ageYearsAgo(int years) {
    String _temp0 = intl.Intl.pluralLogic(
      years,
      locale: localeName,
      other: 'Fa $years anys',
      one: 'Fa un any',
    );
    return '$_temp0';
  }

  @override
  String get locationPermissionTitle => 'On ets?';

  @override
  String get locationPermissionBody =>
      'Been Here compara la teva posició amb els llocs on es van fer les teves fotos. La comparació es fa en aquest telèfon.';

  @override
  String get locationPermissionAction => 'Utilitza la meva ubicació';

  @override
  String get locationDeniedTitle => 'La ubicació està desactivada';

  @override
  String get locationDeniedBody =>
      'Sense ella, l\'app no pot saber què tens aquí. Pots activar-la a la configuració del sistema.';

  @override
  String get locationUnavailableTitle => 'Encara sense posició';

  @override
  String get locationUnavailableBody =>
      'El telèfon encara no sap on és. A l\'interior pot trigar una mica.';

  @override
  String get locationServicesDisabledTitle =>
      'Els serveis d\'ubicació estan desactivats';

  @override
  String get locationServicesDisabledBody =>
      'Activa\'ls a la configuració del sistema i torna.';

  @override
  String get hereNothingTitle => 'No has fet fotos aquí';

  @override
  String get hereNothingBody =>
      'Prova un radi més gran o torna a algun lloc on ja hagis estat.';

  @override
  String hereNearestHint(String distance) {
    return 'El teu record més proper és a $distance.';
  }

  @override
  String get photoDetailRephoto => 'Refotografia';

  @override
  String get photoDetailRephotoSoon =>
      'La refotografia arribarà en una versió posterior.';

  @override
  String photoDetailOf(int index, int total) {
    return '$index de $total';
  }

  @override
  String get debugLocationTitle => 'Ubicació de depuració';

  @override
  String get debugLocationBody =>
      'Fes veure que ets en un altre lloc, per provar la pantalla Aquí des del sofà.';

  @override
  String get debugLocationLatitude => 'Latitud';

  @override
  String get debugLocationLongitude => 'Longitud';

  @override
  String get debugLocationApply => 'Ves-hi';

  @override
  String get debugLocationClear => 'Utilitza la ubicació real';

  @override
  String get debugLocationActive => 'Ubicació de depuració activa';

  @override
  String get commonClose => 'Tanca';

  @override
  String get placesEmptyTitle => 'Encara no hi ha llocs';

  @override
  String get placesEmptyBody =>
      'Els llocs apareixen quan les teves fotos s\'han indexat.';

  @override
  String get placesSortLabel => 'Ordena per';

  @override
  String get placesSortLongestAgo => 'Fa més temps';

  @override
  String get placesSortMostPhotos => 'Més fotos';

  @override
  String get placesSortNearest => 'Més a prop';

  @override
  String placesMutedSection(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count llocs silenciats',
      one: '$count lloc silenciat',
    );
    return '$_temp0';
  }

  @override
  String get placesMute => 'Silencia';

  @override
  String get placesUnmute => 'Deixa de silenciar';

  @override
  String get placesUseAutoRule => 'Decideix automàticament';

  @override
  String get placesAutoMutedNote =>
      'Silenciat automàticament: hi ets gairebé cada dia';

  @override
  String get placesUserMutedNote => 'Silenciat per tu';

  @override
  String get placesUserUnmutedNote => 'Mantingut visible per tu';

  @override
  String placesDayCount(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days dies',
      one: '$days dia',
    );
    return '$_temp0';
  }

  @override
  String get settingsPlaceNamesTitle => 'Posa nom als llocs';

  @override
  String get settingsPlaceNamesBody =>
      'Demana al sistema que converteixi les coordenades d\'un lloc en un nom. Aquesta coordenada va a Apple o Google: és l\'única cosa d\'aquesta app que surt del teu telèfon. Desactivat per defecte; si el tornes a desactivar, s\'obliden tots els noms.';

  @override
  String get settingsAutoMuteTitle =>
      'Silencia els llocs quotidians després de';

  @override
  String get settingsAutoMuteBody =>
      'Un lloc amb fotos de tants dies diferents és on vius, no un lloc que visites.';

  @override
  String settingsAutoMuteValue(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days dies',
    );
    return '$_temp0';
  }

  @override
  String get settingsIndexTitle => 'Índex de fotos';

  @override
  String get settingsReindex => 'Torna a indexar des de zero';

  @override
  String get settingsPrivacyTitle => 'Què es queda en aquest telèfon';

  @override
  String get settingsPrivacyBody =>
      'Les teves fotos, on es van fer i tot el que aquesta app en dedueix. No hi ha compte, ni servidor, ni analítiques.';

  @override
  String get placesName => 'Posa nom a aquest lloc';

  @override
  String get placesRename => 'Canvia el nom';

  @override
  String get placesNameDialogTitle => 'Nom del lloc';

  @override
  String get placesNameHint => 'Cal la iaia, el llac, l\'oficina…';

  @override
  String get placesNameSave => 'Desa';

  @override
  String get placesNameClear => 'Elimina el nom';

  @override
  String placesSummary(String age, String photos) {
    return '$age · $photos';
  }

  @override
  String get notificationTitle => 'Ja hi has estat abans';

  @override
  String notificationBody(String age, String photos) {
    return 'L\'última vegada que hi vas ser: $age. $photos.';
  }

  @override
  String get alwaysLocationTitle => 'Deixa que Been Here s\'hi fixi per tu';

  @override
  String get alwaysLocationBody =>
      'Amb la ubicació en segon pla, el telèfon pot avisar Been Here quan arribes a un lloc que ja has fotografiat, i l\'app t\'ho pot dir una vegada, sense que obris res.\n\nL\'app no et segueix mai. El telèfon vigila un grapat de cercles i només desperta l\'app quan entres en un. Res sobre on ets no surt d\'aquest dispositiu.';

  @override
  String get alwaysLocationAction => 'Activa les arribades';

  @override
  String get alwaysLocationLater => 'Ara no';

  @override
  String get alwaysLocationDeniedBody =>
      'La ubicació en segon pla està desactivada, així que les arribades es queden en silenci. Tota la resta funciona com abans; la pots activar a la configuració del sistema quan vulguis.';

  @override
  String get settingsArrivalsTitle => 'Arribades';

  @override
  String get settingsArrivalsOn =>
      'Been Here t\'avisarà quan arribis a un lloc que fa temps que no fotografies.';

  @override
  String get settingsArrivalsOff =>
      'Been Here es queda en silenci. Si ho actives, es demanarà la ubicació en segon pla.';

  @override
  String get settingsMemoryAgeTitle => 'Esmenta només llocs de fa més de';

  @override
  String settingsMemoryAgeValue(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days dies',
      one: '$days dia',
    );
    return '$_temp0';
  }

  @override
  String get settingsPlaceCooldownTitle =>
      'Després, deixa aquest lloc tranquil durant';

  @override
  String get settingsDailyLimitTitle => 'I no diguis res de res durant';

  @override
  String settingsDailyLimitValue(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours hores',
      one: '$hours hora',
      zero: 'gens de temps',
    );
    return '$_temp0';
  }

  @override
  String get settingsThresholdsBody =>
      'Abaixa aquests valors per provar les arribades sense esperar mig any.';

  @override
  String get placesTestArrival => 'Prova una arribada aquí';

  @override
  String get arrivalTestNotified => 'Notificació enviada';

  @override
  String get arrivalTestMuted => 'Res: el lloc està silenciat';

  @override
  String get arrivalTestTooFewPhotos => 'Res: hi ha massa poques fotos aquí';

  @override
  String get arrivalTestTooRecent => 'Res: hi has fet fotos fa massa poc';

  @override
  String get arrivalTestPlaceCooldown => 'Res: aquest lloc ja ha parlat fa poc';

  @override
  String get arrivalTestDailyLimit => 'Res: avui ja ha parlat una altra cosa';

  @override
  String get alwaysLocationNeedsSettingsBody =>
      'El telèfon ha deixat la ubicació a «Mentre s\'utilitza». iOS no torna a oferir l\'opció des d\'una app, així que cal canviar la ubicació en segon pla a «Sempre» a la configuració del sistema; aleshores les arribades començaran a funcionar.';

  @override
  String get commonOpenSettings => 'Obre la configuració';

  @override
  String get settingsArrivalsPending =>
      'Gairebé: la ubicació encara és a «Mentre s\'utilitza». Canvia-la a «Sempre» a la configuració del sistema.';

  @override
  String get placesSortVisits => 'Més visites';

  @override
  String get placesSortAscending => 'Ordre invers';

  @override
  String placesVisitCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count visites',
      one: '$count visita',
      zero: 'mai',
    );
    return '$_temp0';
  }

  @override
  String get settingsMapTitle => 'Mostra els llocs en un mapa';

  @override
  String get settingsMapBody =>
      'Les tessel·les del mapa es baixen d\'OpenStreetMap mentre et desplaces i fas zoom, així que aquest servidor veu contínuament cap on mires. A diferència d\'un nom de lloc, que es demana una sola vegada, això continua mentre el mapa estigui obert. Desactivat per defecte.';

  @override
  String get placesShowMap => 'Mapa';

  @override
  String get placesShowList => 'Llista';

  @override
  String get placesMapAttribution => '© Col·laboradors d\'OpenStreetMap';

  @override
  String get rephotoOverlay => 'Fos';

  @override
  String get rephotoEdges => 'Contorn';

  @override
  String get rephotoCapture => 'Fes-la';

  @override
  String get rephotoSaved => 'Desada a les teves fotos';

  @override
  String get rephotoNotSaved =>
      'No s\'ha pogut desar. Potser afegir fotos està desactivat.';

  @override
  String get rephotoNoCamera =>
      'No hi ha cap càmera disponible. Been Here necessita la càmera per fer una foto que respongui a una d\'antiga.';

  @override
  String get rephotoThenAndNow => 'Abans i ara';

  @override
  String get rephotoShare => 'Comparteix';

  @override
  String get rephotoThen => 'Abans';

  @override
  String get rephotoNow => 'Ara';

  @override
  String get rephotoShareFailed =>
      'No s\'ha pogut crear la imatge per compartir.';

  @override
  String get onboardingSkip => 'Omet';

  @override
  String get onboardingNext => 'Següent';

  @override
  String get onboardingWhatTitle => 'Fotos del lloc exacte on ets';

  @override
  String get onboardingWhatBody =>
      'Arriba a un lloc que ja hagis fotografiat i Been Here et mostra què hi vas fer, visita a visita, començant per la més antiga.';

  @override
  String get onboardingPrivacyTitle => 'Res no surt del teu telèfon';

  @override
  String get onboardingPrivacyBody =>
      'Sense compte, sense servidor, sense analítiques. Been Here llegeix la teva fototeca al dispositiu i en guarda un petit índex al costat. Les teves fotos, i on es van fer, es queden on són.';

  @override
  String get onboardingPrivacyFootnote =>
      'Dues coses poden arribar a la xarxa, i totes dues estan desactivades fins que les activis: els noms dels llocs i el mapa.';

  @override
  String get onboardingPhotosTitle => 'Necessita les teves fotos';

  @override
  String get onboardingPhotosBody =>
      'Been Here anota quina foto es va fer on. Mai no copia ni mou res: recorda identificadors i coordenades, i només llegeix les imatges quan te les mostra.';

  @override
  String get onboardingPhotosAction => 'Permet les fotos';

  @override
  String get onboardingDone => 'Comença';

  @override
  String get settingsAboutTitle => 'Quant a';

  @override
  String settingsVersion(String version, String build) {
    return 'Versió $version ($build)';
  }

  @override
  String get settingsSourceTitle => 'Codi font';

  @override
  String get settingsShowIntro => 'Torna a mostrar la introducció';

  @override
  String photoSemanticLabel(String date) {
    return 'Foto del $date';
  }

  @override
  String photoOpenSemanticLabel(int index, int total, String date) {
    return 'Foto $index de $total, $date';
  }

  @override
  String get placesActionsLabel => 'Què fer amb aquest lloc';

  @override
  String get radiusSemanticLabel => 'Radi de cerca';

  @override
  String get hereMapTitle => 'Per aquí';

  @override
  String get hereOpenInMaps => 'Obre a Mapes';

  @override
  String get hereBackToMe => 'Torna a on soc';

  @override
  String get herePlaceFallbackTitle => 'Un lloc que coneixes';

  @override
  String get arrivalTestNearHome => 'Massa a prop de casa per ser notícia.';

  @override
  String get settingsHomeRadiusTitle => 'Silenci a menys de';

  @override
  String settingsHomeRadiusValue(num km) {
    String _temp0 = intl.Intl.pluralLogic(
      km,
      locale: localeName,
      other: '$km km de casa',
      one: '$km km de casa',
      zero: 'cap distància: mai en silenci',
    );
    return '$_temp0';
  }

  @override
  String get settingsHomeRadiusBody =>
      'La vida de cada dia passa a prop de casa, i és allà on menys agrada un telèfon que la comenti. Els llocs més propers que això no es vigilen mai.';

  @override
  String get settingsQuietTitle => 'Per què està en silenci';

  @override
  String settingsQuietWatching(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Es vigilen $count llocs',
      one: 'Es vigila $count lloc',
      zero: 'No es vigila cap lloc',
    );
    return '$_temp0';
  }

  @override
  String settingsQuietNearest(String distance) {
    return 'Lloc vigilat més proper: $distance';
  }

  @override
  String get settingsQuietNothingWatched =>
      'No es vigila res, així que no hi pot haver cap arribada.';

  @override
  String settingsQuietLastNotified(String when) {
    return 'Última notificació: $when';
  }

  @override
  String get settingsQuietNever => 'mai';

  @override
  String settingsQuietBreakdown(int total, String reasons) {
    return 'De $total llocs: $reasons';
  }

  @override
  String settingsQuietReasonMuted(Object count) {
    return '$count silenciats';
  }

  @override
  String settingsQuietReasonNearHome(Object count) {
    return '$count a prop de casa';
  }

  @override
  String settingsQuietReasonTooFewPhotos(Object count) {
    return '$count amb massa poques fotos';
  }

  @override
  String settingsQuietReasonTooRecent(Object count) {
    return '$count fotografiats fa poc';
  }

  @override
  String settingsQuietReasonPlaceCooldown(Object count) {
    return '$count encara en pausa';
  }

  @override
  String settingsQuietReasonEligible(Object count) {
    return '$count que val la pena vigilar';
  }

  @override
  String get ageSemanticLabel => 'Antiguitat de les fotos';

  @override
  String get ageStopNow => 'ara';

  @override
  String get ageStopDay => '1 dia';

  @override
  String get ageStop3Days => '3 dies';

  @override
  String get ageStopWeek => '1 setmana';

  @override
  String get ageStop2Weeks => '2 setmanes';

  @override
  String get ageStopMonth => '1 mes';

  @override
  String get ageStop3Months => '3 mesos';

  @override
  String get ageStop6Months => '6 mesos';

  @override
  String get ageStopYear => '1 any';

  @override
  String get ageStop2Years => '2 anys';

  @override
  String get ageStop5Years => '5 anys';

  @override
  String get ageStop10Years => '10 anys';

  @override
  String get ageStopAll => 'tot';

  @override
  String get ageWindowAll => 'Totes les fotos';

  @override
  String ageWindowNewerThan(String stop) {
    return 'Fins a $stop';
  }

  @override
  String ageWindowOlderThan(String stop) {
    return 'Més de $stop';
  }

  @override
  String ageWindowBetween(String newest, String oldest) {
    return 'De $newest a $oldest';
  }

  @override
  String get ageWindowReset => 'Restableix';

  @override
  String mapDotCountCapped(int count) {
    return '$count+ fotos';
  }
}
