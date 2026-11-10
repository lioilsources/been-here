// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get appTitle => 'Been Here';

  @override
  String get hereTabLabel => 'Qui';

  @override
  String get placesTabLabel => 'Luoghi';

  @override
  String get settingsTabLabel => 'Impostazioni';

  @override
  String get hereEmptyTitle => 'Non hai scattato foto qui';

  @override
  String get hereEmptyBody =>
      'Allarga il raggio di ricerca, oppure torna in un posto dove sei già stato.';

  @override
  String get hereNotIndexedTitle => 'Ancora niente di indicizzato';

  @override
  String get hereNotIndexedBody =>
      'Been Here deve leggere la tua libreria foto una volta per sapere dove sei stato. Nulla lascia il tuo telefono.';

  @override
  String get indexStartAction => 'Indicizza le mie foto';

  @override
  String get indexPermissionTitle => 'Been Here ha bisogno delle tue foto';

  @override
  String get indexPermissionBody =>
      'Legge solo dove e quando è stata scattata ogni foto, e lo tiene su questo telefono.';

  @override
  String get indexPermissionAction => 'Consenti l\'accesso';

  @override
  String get indexPermissionDeniedTitle => 'L\'accesso alle foto è disattivato';

  @override
  String get indexPermissionDeniedBody =>
      'Senza, Been Here non può mostrarti nulla. Puoi attivarlo nelle impostazioni di sistema.';

  @override
  String get indexLimitedAccessNotice =>
      'Hai condiviso solo alcune foto, quindi Been Here vede solo quelle. Con l\'accesso completo può trovare ogni posto in cui sei stato.';

  @override
  String get indexRunningTitle => 'Lettura della libreria foto';

  @override
  String indexRunningProgress(int processed, int total) {
    return '$processed di $total';
  }

  @override
  String get indexFailedTitle => 'Indicizzazione interrotta';

  @override
  String get indexFailedBody =>
      'Qualcosa è andato storto a metà strada. Riprovando si riparte da dove si era fermata.';

  @override
  String indexedPhotoCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count foto indicizzate',
      one: '$count foto indicizzata',
      zero: 'Nessuna foto indicizzata',
    );
    return '$_temp0';
  }

  @override
  String indexedLocationCoverage(int percent) {
    return 'Il $percent% ha una posizione';
  }

  @override
  String get commonLoading => 'Caricamento…';

  @override
  String get commonRetry => 'Riprova';

  @override
  String get commonCancel => 'Annulla';

  @override
  String hereRadiusLabel(String radius) {
    return 'Entro $radius';
  }

  @override
  String herePhotoCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count foto',
      one: '$count foto',
      zero: 'Nessuna foto',
    );
    return '$_temp0';
  }

  @override
  String hereVisitCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count visite',
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
  String get ageToday => 'Oggi';

  @override
  String get ageYesterday => 'Ieri';

  @override
  String ageDaysAgo(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days giorni fa',
    );
    return '$_temp0';
  }

  @override
  String ageMonthsAgo(int months) {
    String _temp0 = intl.Intl.pluralLogic(
      months,
      locale: localeName,
      other: '$months mesi fa',
      one: 'Un mese fa',
    );
    return '$_temp0';
  }

  @override
  String ageYearsAgo(int years) {
    String _temp0 = intl.Intl.pluralLogic(
      years,
      locale: localeName,
      other: '$years anni fa',
      one: 'Un anno fa',
    );
    return '$_temp0';
  }

  @override
  String get locationPermissionTitle => 'Dove sei?';

  @override
  String get locationPermissionBody =>
      'Been Here confronta la tua posizione con i luoghi in cui sono state scattate le tue foto. Il confronto avviene su questo telefono.';

  @override
  String get locationPermissionAction => 'Usa la mia posizione';

  @override
  String get locationDeniedTitle => 'La posizione è disattivata';

  @override
  String get locationDeniedBody =>
      'Senza, l\'app non può sapere cosa hai qui. Puoi attivarla nelle impostazioni di sistema.';

  @override
  String get locationUnavailableTitle => 'Ancora nessuna posizione';

  @override
  String get locationUnavailableBody =>
      'Il telefono non ha ancora capito dove si trova. Al chiuso può volerci un momento.';

  @override
  String get locationServicesDisabledTitle =>
      'I servizi di localizzazione sono disattivati';

  @override
  String get locationServicesDisabledBody =>
      'Attivali nelle impostazioni di sistema e torna qui.';

  @override
  String get hereNothingTitle => 'Non hai scattato foto qui';

  @override
  String get hereNothingBody =>
      'Prova un raggio più ampio, oppure torna in un posto dove sei già stato.';

  @override
  String hereNearestHint(String distance) {
    return 'Il tuo ricordo più vicino è a $distance.';
  }

  @override
  String get photoDetailRephoto => 'Rifotografa';

  @override
  String get photoDetailRephotoSoon =>
      'La rifotografia arriverà in una versione successiva.';

  @override
  String photoDetailOf(int index, int total) {
    return '$index di $total';
  }

  @override
  String get debugLocationTitle => 'Posizione di debug';

  @override
  String get debugLocationBody =>
      'Fai finta di essere altrove, per provare la schermata Qui dal divano.';

  @override
  String get debugLocationLatitude => 'Latitudine';

  @override
  String get debugLocationLongitude => 'Longitudine';

  @override
  String get debugLocationApply => 'Vai lì';

  @override
  String get debugLocationClear => 'Usa la posizione reale';

  @override
  String get debugLocationActive => 'Posizione di debug attiva';

  @override
  String get commonClose => 'Chiudi';

  @override
  String get placesEmptyTitle => 'Ancora nessun luogo';

  @override
  String get placesEmptyBody =>
      'I luoghi compaiono quando le tue foto sono state indicizzate.';

  @override
  String get placesSortLabel => 'Ordina per';

  @override
  String get placesSortLongestAgo => 'Più tempo fa';

  @override
  String get placesSortMostPhotos => 'Più foto';

  @override
  String get placesSortNearest => 'Più vicino';

  @override
  String placesMutedSection(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count luoghi silenziati',
      one: '$count luogo silenziato',
    );
    return '$_temp0';
  }

  @override
  String get placesMute => 'Silenzia';

  @override
  String get placesUnmute => 'Riattiva';

  @override
  String get placesUseAutoRule => 'Decidi automaticamente';

  @override
  String get placesAutoMutedNote =>
      'Silenziato automaticamente: sei qui quasi ogni giorno';

  @override
  String get placesUserMutedNote => 'Silenziato da te';

  @override
  String get placesUserUnmutedNote => 'Lasciato visibile da te';

  @override
  String placesDayCount(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days giorni',
      one: '$days giorno',
    );
    return '$_temp0';
  }

  @override
  String get settingsPlaceNamesTitle => 'Dai un nome ai luoghi';

  @override
  String get settingsPlaceNamesBody =>
      'Chiede al sistema di trasformare le coordinate di un luogo in un nome. Quella coordinata va ad Apple o Google: è l\'unica cosa di questa app che lascia il telefono. Disattivato per impostazione predefinita; disattivandolo di nuovo si dimenticano tutti i nomi.';

  @override
  String get settingsAutoMuteTitle => 'Silenzia i luoghi quotidiani dopo';

  @override
  String get settingsAutoMuteBody =>
      'Un luogo con foto in così tanti giorni diversi è un posto dove vivi, non uno che visiti.';

  @override
  String settingsAutoMuteValue(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days giorni',
    );
    return '$_temp0';
  }

  @override
  String get settingsIndexTitle => 'Indice delle foto';

  @override
  String get settingsReindex => 'Indicizza di nuovo da zero';

  @override
  String get settingsPrivacyTitle => 'Cosa resta su questo telefono';

  @override
  String get settingsPrivacyBody =>
      'Le tue foto, dove sono state scattate e tutto ciò che questa app ne ricava. Nessun account, nessun server, nessuna analisi.';

  @override
  String get placesName => 'Dai un nome a questo luogo';

  @override
  String get placesRename => 'Rinomina';

  @override
  String get placesNameDialogTitle => 'Nome del luogo';

  @override
  String get placesNameHint => 'Dalla nonna, il lago, l\'ufficio…';

  @override
  String get placesNameSave => 'Salva';

  @override
  String get placesNameClear => 'Rimuovi nome';

  @override
  String placesSummary(String age, String photos) {
    return '$age · $photos';
  }

  @override
  String get notificationTitle => 'Sei già stato qui';

  @override
  String notificationBody(String age, String photos) {
    return 'L\'ultima volta qui: $age. $photos.';
  }

  @override
  String get alwaysLocationTitle => 'Lascia che Been Here se ne accorga per te';

  @override
  String get alwaysLocationBody =>
      'Con la posizione in background, il telefono può avvisare Been Here quando arrivi in un posto che hai già fotografato, e l\'app può dirtelo, una volta, senza che tu apra nulla.\n\nL\'app non ti segue mai. Il telefono osserva una manciata di cerchi e sveglia l\'app solo quando entri in uno di essi. Nulla su dove ti trovi lascia questo dispositivo.';

  @override
  String get alwaysLocationAction => 'Attiva gli arrivi';

  @override
  String get alwaysLocationLater => 'Non ora';

  @override
  String get alwaysLocationDeniedBody =>
      'La posizione in background è disattivata, quindi gli arrivi restano in silenzio. Tutto il resto funziona come prima; puoi attivarla nelle impostazioni di sistema quando vuoi.';

  @override
  String get settingsArrivalsTitle => 'Arrivi';

  @override
  String get settingsArrivalsOn =>
      'Been Here ti avviserà quando arrivi in un posto che non fotografi da un po\'.';

  @override
  String get settingsArrivalsOff =>
      'Been Here resta in silenzio. Attivandolo viene chiesta la posizione in background.';

  @override
  String get settingsMemoryAgeTitle => 'Parla solo di luoghi più vecchi di';

  @override
  String settingsMemoryAgeValue(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days giorni',
      one: '$days giorno',
    );
    return '$_temp0';
  }

  @override
  String get settingsPlaceCooldownTitle =>
      'Poi lascia tranquillo quel luogo per';

  @override
  String get settingsDailyLimitTitle => 'E non dire proprio nulla per';

  @override
  String settingsDailyLimitValue(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours ore',
      one: '$hours ora',
      zero: 'nessun tempo',
    );
    return '$_temp0';
  }

  @override
  String get settingsThresholdsBody =>
      'Abbassa questi valori per provare gli arrivi senza aspettare sei mesi.';

  @override
  String get placesTestArrival => 'Prova un arrivo qui';

  @override
  String get arrivalTestNotified => 'Notifica inviata';

  @override
  String get arrivalTestMuted => 'Niente: il luogo è silenziato';

  @override
  String get arrivalTestTooFewPhotos => 'Niente: troppe poche foto qui';

  @override
  String get arrivalTestTooRecent =>
      'Niente: hai fotografato qui troppo di recente';

  @override
  String get arrivalTestPlaceCooldown =>
      'Niente: questo luogo ha già parlato di recente';

  @override
  String get arrivalTestDailyLimit =>
      'Niente: qualcos\'altro ha già parlato oggi';

  @override
  String get alwaysLocationNeedsSettingsBody =>
      'Il telefono ha lasciato la posizione su «Mentre usi l\'app». iOS non ripropone la scelta dall\'interno di un\'app, quindi la posizione in background va impostata su «Sempre» nelle impostazioni di sistema; poi gli arrivi funzioneranno.';

  @override
  String get commonOpenSettings => 'Apri impostazioni';

  @override
  String get settingsArrivalsPending =>
      'Quasi: la posizione è ancora su «Mentre usi l\'app». Impostala su «Sempre» nelle impostazioni di sistema.';

  @override
  String get placesSortVisits => 'Più visite';

  @override
  String get placesSortAscending => 'Ordine inverso';

  @override
  String placesVisitCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count visite',
      one: '$count visita',
      zero: 'mai',
    );
    return '$_temp0';
  }

  @override
  String get settingsMapTitle => 'Mostra i luoghi su una mappa';

  @override
  String get settingsMapBody =>
      'Le tessere della mappa vengono scaricate da OpenStreetMap mentre sposti e ingrandisci, quindi quel server vede di continuo dove stai guardando. A differenza del nome di un luogo, chiesto una volta sola, questo continua finché la mappa è aperta. Disattivato per impostazione predefinita.';

  @override
  String get placesShowMap => 'Mappa';

  @override
  String get placesShowList => 'Elenco';

  @override
  String get placesMapAttribution => '© Collaboratori di OpenStreetMap';

  @override
  String get rephotoOverlay => 'Dissolvenza';

  @override
  String get rephotoEdges => 'Contorno';

  @override
  String get rephotoCapture => 'Scatta';

  @override
  String get rephotoSaved => 'Salvata nelle tue foto';

  @override
  String get rephotoNotSaved =>
      'Impossibile salvarla. L\'aggiunta di foto potrebbe essere disattivata.';

  @override
  String get rephotoNoCamera =>
      'Nessuna fotocamera disponibile. Been Here ha bisogno della fotocamera per scattare una foto che risponda a una vecchia.';

  @override
  String get rephotoThenAndNow => 'Allora e adesso';

  @override
  String get rephotoShare => 'Condividi';

  @override
  String get rephotoThen => 'Allora';

  @override
  String get rephotoNow => 'Adesso';

  @override
  String get rephotoShareFailed =>
      'Impossibile creare l\'immagine da condividere.';

  @override
  String get onboardingSkip => 'Salta';

  @override
  String get onboardingNext => 'Avanti';

  @override
  String get onboardingWhatTitle => 'Le foto del punto esatto in cui ti trovi';

  @override
  String get onboardingWhatBody =>
      'Arriva in un posto che hai già fotografato e Been Here ti mostra cosa hai scattato lì, visita per visita, dalla più lontana.';

  @override
  String get onboardingPrivacyTitle => 'Nulla lascia il tuo telefono';

  @override
  String get onboardingPrivacyBody =>
      'Nessun account, nessun server, nessuna analisi. Been Here legge la tua libreria foto sul dispositivo e tiene un piccolo indice accanto. Le tue foto, e dove sono state scattate, restano dove sono.';

  @override
  String get onboardingPrivacyFootnote =>
      'Due cose possono raggiungere la rete, ed entrambe sono disattivate finché non le attivi: i nomi dei luoghi e la mappa.';

  @override
  String get onboardingPhotosTitle => 'Servono le tue foto';

  @override
  String get onboardingPhotosBody =>
      'Been Here annota quale foto è stata scattata dove. Non copia né sposta mai nulla: ricorda identificativi e coordinate, e legge le immagini solo quando te le mostra.';

  @override
  String get onboardingPhotosAction => 'Consenti foto';

  @override
  String get onboardingDone => 'Inizia';

  @override
  String get settingsAboutTitle => 'Informazioni';

  @override
  String settingsVersion(String version, String build) {
    return 'Versione $version ($build)';
  }

  @override
  String get settingsSourceTitle => 'Codice sorgente';

  @override
  String get settingsShowIntro => 'Mostra di nuovo l\'introduzione';

  @override
  String photoSemanticLabel(String date) {
    return 'Foto del $date';
  }

  @override
  String photoOpenSemanticLabel(int index, int total, String date) {
    return 'Foto $index di $total, $date';
  }

  @override
  String get placesActionsLabel => 'Cosa fare con questo luogo';

  @override
  String get radiusSemanticLabel => 'Raggio di ricerca';

  @override
  String get hereMapTitle => 'Qui intorno';

  @override
  String get hereOpenInMaps => 'Apri in Mappe';

  @override
  String get hereBackToMe => 'Torna dove sono';

  @override
  String get herePlaceFallbackTitle => 'Un luogo che conosci';

  @override
  String get arrivalTestNearHome =>
      'Troppo vicino a casa per essere una notizia.';

  @override
  String get settingsHomeRadiusTitle => 'Silenzio entro';

  @override
  String settingsHomeRadiusValue(num km) {
    String _temp0 = intl.Intl.pluralLogic(
      km,
      locale: localeName,
      other: '$km km da casa',
      one: '$km km da casa',
      zero: 'nessuna distanza: mai in silenzio',
    );
    return '$_temp0';
  }

  @override
  String get settingsHomeRadiusBody =>
      'La vita di tutti i giorni si svolge vicino a casa, ed è lì che un telefono che la commenta è meno gradito. I luoghi più vicini di così non vengono mai osservati.';

  @override
  String get settingsQuietTitle => 'Perché è silenzioso';

  @override
  String settingsQuietWatching(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count luoghi osservati',
      one: '$count luogo osservato',
      zero: 'Nessun luogo osservato',
    );
    return '$_temp0';
  }

  @override
  String settingsQuietNearest(String distance) {
    return 'Luogo osservato più vicino: $distance';
  }

  @override
  String get settingsQuietNothingWatched =>
      'Non si osserva nulla, quindi non può esserci nessun arrivo.';

  @override
  String settingsQuietLastNotified(String when) {
    return 'Ultima notifica: $when';
  }

  @override
  String get settingsQuietNever => 'mai';

  @override
  String settingsQuietBreakdown(int total, String reasons) {
    return 'Su $total luoghi: $reasons';
  }

  @override
  String settingsQuietReasonMuted(Object count) {
    return '$count silenziati';
  }

  @override
  String settingsQuietReasonNearHome(Object count) {
    return '$count vicino a casa';
  }

  @override
  String settingsQuietReasonTooFewPhotos(Object count) {
    return '$count con troppe poche foto';
  }

  @override
  String settingsQuietReasonTooRecent(Object count) {
    return '$count fotografati di recente';
  }

  @override
  String settingsQuietReasonPlaceCooldown(Object count) {
    return '$count ancora in pausa';
  }

  @override
  String settingsQuietReasonEligible(Object count) {
    return '$count da osservare';
  }

  @override
  String get ageSemanticLabel => 'Età delle foto';

  @override
  String get ageStopNow => 'ora';

  @override
  String get ageStopDay => '1 giorno';

  @override
  String get ageStop3Days => '3 giorni';

  @override
  String get ageStopWeek => '1 settimana';

  @override
  String get ageStop2Weeks => '2 settimane';

  @override
  String get ageStopMonth => '1 mese';

  @override
  String get ageStop3Months => '3 mesi';

  @override
  String get ageStop6Months => '6 mesi';

  @override
  String get ageStopYear => '1 anno';

  @override
  String get ageStop2Years => '2 anni';

  @override
  String get ageStop5Years => '5 anni';

  @override
  String get ageStop10Years => '10 anni';

  @override
  String get ageStopAll => 'tutte';

  @override
  String get ageWindowAll => 'Tutte le foto';

  @override
  String ageWindowNewerThan(String stop) {
    return 'Fino a $stop';
  }

  @override
  String ageWindowOlderThan(String stop) {
    return 'Più di $stop';
  }

  @override
  String ageWindowBetween(String newest, String oldest) {
    return 'Da $newest a $oldest';
  }

  @override
  String get ageWindowReset => 'Ripristina';

  @override
  String mapDotCountCapped(int count) {
    return '$count+ foto';
  }
}
