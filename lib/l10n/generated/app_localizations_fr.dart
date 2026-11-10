// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'Been Here';

  @override
  String get hereTabLabel => 'Ici';

  @override
  String get placesTabLabel => 'Lieux';

  @override
  String get settingsTabLabel => 'Réglages';

  @override
  String get hereEmptyTitle => 'Vous n\'avez pas pris de photos ici';

  @override
  String get hereEmptyBody =>
      'Élargissez le rayon de recherche, ou revenez dans un endroit où vous êtes déjà allé.';

  @override
  String get hereNotIndexedTitle => 'Rien d\'indexé pour l\'instant';

  @override
  String get hereNotIndexedBody =>
      'Been Here doit lire votre photothèque une fois pour savoir où vous êtes allé. Rien ne quitte votre téléphone.';

  @override
  String get indexStartAction => 'Indexer mes photos';

  @override
  String get indexPermissionTitle => 'Been Here a besoin de vos photos';

  @override
  String get indexPermissionBody =>
      'L\'app lit uniquement où et quand chaque photo a été prise, et garde ces données sur ce téléphone.';

  @override
  String get indexPermissionAction => 'Autoriser l\'accès';

  @override
  String get indexPermissionDeniedTitle => 'L\'accès aux photos est désactivé';

  @override
  String get indexPermissionDeniedBody =>
      'Sans lui, Been Here ne peut rien vous montrer. Vous pouvez l\'activer dans les réglages du système.';

  @override
  String get indexLimitedAccessNotice =>
      'Vous n\'avez partagé que certaines photos, Been Here ne voit donc qu\'elles. L\'accès complet lui permet de retrouver tous les lieux où vous êtes allé.';

  @override
  String get indexRunningTitle => 'Lecture de votre photothèque';

  @override
  String indexRunningProgress(int processed, int total) {
    return '$processed sur $total';
  }

  @override
  String get indexFailedTitle => 'L\'indexation s\'est arrêtée';

  @override
  String get indexFailedBody =>
      'Un problème est survenu en cours de route. Réessayer reprend là où ça s\'est arrêté.';

  @override
  String indexedPhotoCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count photos indexées',
      one: '$count photo indexée',
      zero: 'Aucune photo indexée',
    );
    return '$_temp0';
  }

  @override
  String indexedLocationCoverage(int percent) {
    return '$percent % d\'entre elles ont une position';
  }

  @override
  String get commonLoading => 'Chargement…';

  @override
  String get commonRetry => 'Réessayer';

  @override
  String get commonCancel => 'Annuler';

  @override
  String hereRadiusLabel(String radius) {
    return 'Dans un rayon de $radius';
  }

  @override
  String herePhotoCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count photos',
      one: '$count photo',
      zero: 'Aucune photo',
    );
    return '$_temp0';
  }

  @override
  String hereVisitCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count visites',
      one: '$count visite',
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
  String get ageToday => 'Aujourd\'hui';

  @override
  String get ageYesterday => 'Hier';

  @override
  String ageDaysAgo(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Il y a $days jours',
    );
    return '$_temp0';
  }

  @override
  String ageMonthsAgo(int months) {
    String _temp0 = intl.Intl.pluralLogic(
      months,
      locale: localeName,
      other: 'Il y a $months mois',
      one: 'Il y a un mois',
    );
    return '$_temp0';
  }

  @override
  String ageYearsAgo(int years) {
    String _temp0 = intl.Intl.pluralLogic(
      years,
      locale: localeName,
      other: 'Il y a $years ans',
      one: 'Il y a un an',
    );
    return '$_temp0';
  }

  @override
  String get locationPermissionTitle => 'Où êtes-vous ?';

  @override
  String get locationPermissionBody =>
      'Been Here compare votre position avec les lieux où vos photos ont été prises. La comparaison se fait sur ce téléphone.';

  @override
  String get locationPermissionAction => 'Utiliser ma position';

  @override
  String get locationDeniedTitle => 'La localisation est désactivée';

  @override
  String get locationDeniedBody =>
      'Sans elle, l\'app ne peut pas savoir ce que vous avez ici. Vous pouvez l\'activer dans les réglages du système.';

  @override
  String get locationUnavailableTitle => 'Pas encore de position';

  @override
  String get locationUnavailableBody =>
      'Votre téléphone n\'a pas encore déterminé où il se trouve. À l\'intérieur, cela peut prendre un moment.';

  @override
  String get locationServicesDisabledTitle =>
      'Le service de localisation est désactivé';

  @override
  String get locationServicesDisabledBody =>
      'Activez-le dans les réglages du système, puis revenez.';

  @override
  String get hereNothingTitle => 'Vous n\'avez pas pris de photos ici';

  @override
  String get hereNothingBody =>
      'Essayez un rayon plus large, ou revenez dans un endroit où vous êtes déjà allé.';

  @override
  String hereNearestHint(String distance) {
    return 'Votre souvenir le plus proche est à $distance.';
  }

  @override
  String get photoDetailRephoto => 'Rephotographier';

  @override
  String get photoDetailRephotoSoon =>
      'La rephotographie arrivera dans une version ultérieure.';

  @override
  String photoDetailOf(int index, int total) {
    return '$index sur $total';
  }

  @override
  String get debugLocationTitle => 'Position de débogage';

  @override
  String get debugLocationBody =>
      'Faire comme si vous étiez ailleurs, pour tester l\'écran Ici depuis le canapé.';

  @override
  String get debugLocationLatitude => 'Latitude';

  @override
  String get debugLocationLongitude => 'Longitude';

  @override
  String get debugLocationApply => 'Y aller';

  @override
  String get debugLocationClear => 'Utiliser la vraie position';

  @override
  String get debugLocationActive => 'Position de débogage active';

  @override
  String get commonClose => 'Fermer';

  @override
  String get placesEmptyTitle => 'Aucun lieu pour l\'instant';

  @override
  String get placesEmptyBody =>
      'Les lieux apparaissent une fois vos photos indexées.';

  @override
  String get placesSortLabel => 'Trier par';

  @override
  String get placesSortLongestAgo => 'Le plus ancien';

  @override
  String get placesSortMostPhotos => 'Le plus de photos';

  @override
  String get placesSortNearest => 'Le plus proche';

  @override
  String placesMutedSection(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count lieux en sourdine',
      one: '$count lieu en sourdine',
    );
    return '$_temp0';
  }

  @override
  String get placesMute => 'Mettre en sourdine';

  @override
  String get placesUnmute => 'Réactiver';

  @override
  String get placesUseAutoRule => 'Décider automatiquement';

  @override
  String get placesAutoMutedNote =>
      'En sourdine automatiquement — vous êtes ici presque tous les jours';

  @override
  String get placesUserMutedNote => 'Mis en sourdine par vous';

  @override
  String get placesUserUnmutedNote => 'Gardé visible par vous';

  @override
  String placesDayCount(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days jours',
      one: '$days jour',
    );
    return '$_temp0';
  }

  @override
  String get settingsPlaceNamesTitle => 'Nommer les lieux';

  @override
  String get settingsPlaceNamesBody =>
      'Demande au système de transformer les coordonnées d\'un lieu en nom. Ces coordonnées sont envoyées à Apple ou Google — c\'est la seule chose dans cette app qui quitte votre téléphone. Désactivé par défaut ; le désactiver à nouveau efface tous les noms.';

  @override
  String get settingsAutoMuteTitle =>
      'Mettre en sourdine les lieux du quotidien après';

  @override
  String get settingsAutoMuteBody =>
      'Un lieu avec des photos prises sur autant de jours différents est un endroit où vous vivez, pas un endroit que vous visitez.';

  @override
  String settingsAutoMuteValue(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days jours',
    );
    return '$_temp0';
  }

  @override
  String get settingsIndexTitle => 'Index des photos';

  @override
  String get settingsReindex => 'Tout réindexer depuis le début';

  @override
  String get settingsPrivacyTitle => 'Ce qui reste sur ce téléphone';

  @override
  String get settingsPrivacyBody =>
      'Vos photos, l\'endroit où elles ont été prises, et tout ce que cette app en déduit. Pas de compte, pas de serveur, pas de statistiques.';

  @override
  String get placesName => 'Nommer ce lieu';

  @override
  String get placesRename => 'Renommer';

  @override
  String get placesNameDialogTitle => 'Nom du lieu';

  @override
  String get placesNameHint => 'Chez mamie, le lac, le bureau…';

  @override
  String get placesNameSave => 'Enregistrer';

  @override
  String get placesNameClear => 'Supprimer le nom';

  @override
  String placesSummary(String age, String photos) {
    return '$age · $photos';
  }

  @override
  String get notificationTitle => 'Vous êtes déjà venu ici';

  @override
  String notificationBody(String age, String photos) {
    return 'Votre dernière visite ici : $age. $photos.';
  }

  @override
  String get alwaysLocationTitle => 'Laissez Been Here remarquer pour vous';

  @override
  String get alwaysLocationBody =>
      'Avec la localisation en arrière-plan, votre téléphone peut prévenir Been Here quand vous arrivez dans un endroit déjà photographié — et l\'app peut vous le dire, une fois, sans que vous ouvriez quoi que ce soit.\n\nL\'app ne vous suit jamais. Votre téléphone surveille une poignée de cercles et ne réveille l\'app que lorsque vous entrez dans l\'un d\'eux. Rien sur l\'endroit où vous êtes ne quitte cet appareil.';

  @override
  String get alwaysLocationAction => 'Activer les arrivées';

  @override
  String get alwaysLocationLater => 'Pas maintenant';

  @override
  String get alwaysLocationDeniedBody =>
      'La localisation en arrière-plan est désactivée, les arrivées restent donc silencieuses. Tout le reste fonctionne comme avant ; vous pouvez l\'activer dans les réglages du système quand vous voulez.';

  @override
  String get settingsArrivalsTitle => 'Arrivées';

  @override
  String get settingsArrivalsOn =>
      'Been Here vous préviendra quand vous arriverez dans un endroit que vous n\'avez pas photographié depuis un moment.';

  @override
  String get settingsArrivalsOff =>
      'Been Here reste silencieux. L\'activer demande la localisation en arrière-plan.';

  @override
  String get settingsMemoryAgeTitle => 'Ne mentionner que les lieux de plus de';

  @override
  String settingsMemoryAgeValue(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days jours',
      one: '$days jour',
    );
    return '$_temp0';
  }

  @override
  String get settingsPlaceCooldownTitle =>
      'Puis laisser ce lieu tranquille pendant';

  @override
  String get settingsDailyLimitTitle => 'Et ne rien dire du tout pendant';

  @override
  String settingsDailyLimitValue(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours heures',
      one: '$hours heure',
      zero: 'aucune durée',
    );
    return '$_temp0';
  }

  @override
  String get settingsThresholdsBody =>
      'Baissez ces valeurs pour essayer les arrivées sans attendre six mois.';

  @override
  String get placesTestArrival => 'Tester une arrivée ici';

  @override
  String get arrivalTestNotified => 'Notification envoyée';

  @override
  String get arrivalTestMuted => 'Rien : le lieu est en sourdine';

  @override
  String get arrivalTestTooFewPhotos => 'Rien : trop peu de photos ici';

  @override
  String get arrivalTestTooRecent =>
      'Rien : vous avez photographié ici trop récemment';

  @override
  String get arrivalTestPlaceCooldown =>
      'Rien : ce lieu s\'est déjà manifesté récemment';

  @override
  String get arrivalTestDailyLimit =>
      'Rien : autre chose s\'est déjà manifesté aujourd\'hui';

  @override
  String get alwaysLocationNeedsSettingsBody =>
      'Votre téléphone a gardé la localisation sur « Lorsque l\'app est active ». iOS ne repropose pas ce choix depuis une app, la localisation en arrière-plan doit donc être réglée sur « Toujours » dans les réglages du système — les arrivées fonctionneront alors.';

  @override
  String get commonOpenSettings => 'Ouvrir les réglages';

  @override
  String get settingsArrivalsPending =>
      'Presque : la localisation est encore sur « Lorsque l\'app est active ». Réglez-la sur « Toujours » dans les réglages du système.';

  @override
  String get placesSortVisits => 'Le plus de visites';

  @override
  String get placesSortAscending => 'Ordre inverse';

  @override
  String placesVisitCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count visites',
      one: '$count visite',
      zero: 'jamais',
    );
    return '$_temp0';
  }

  @override
  String get settingsMapTitle => 'Afficher les lieux sur une carte';

  @override
  String get settingsMapBody =>
      'Les tuiles de carte sont téléchargées depuis OpenStreetMap à mesure que vous déplacez et zoomez, ce serveur voit donc en continu où vous regardez. Contrairement à un nom de lieu, demandé une seule fois, cela continue tant que la carte est ouverte. Désactivé par défaut.';

  @override
  String get placesShowMap => 'Carte';

  @override
  String get placesShowList => 'Liste';

  @override
  String get placesMapAttribution => '© Contributeurs OpenStreetMap';

  @override
  String get rephotoOverlay => 'Fondu';

  @override
  String get rephotoEdges => 'Contours';

  @override
  String get rephotoCapture => 'Prendre';

  @override
  String get rephotoSaved => 'Enregistrée dans vos photos';

  @override
  String get rephotoNotSaved =>
      'Impossible de l\'enregistrer. L\'ajout de photos est peut-être désactivé.';

  @override
  String get rephotoNoCamera =>
      'Aucun appareil photo disponible. Been Here a besoin de l\'appareil photo pour prendre une photo qui répond à une ancienne.';

  @override
  String get rephotoThenAndNow => 'Avant & maintenant';

  @override
  String get rephotoShare => 'Partager';

  @override
  String get rephotoThen => 'Avant';

  @override
  String get rephotoNow => 'Maintenant';

  @override
  String get rephotoShareFailed => 'Impossible de créer l\'image à partager.';

  @override
  String get onboardingSkip => 'Passer';

  @override
  String get onboardingNext => 'Suivant';

  @override
  String get onboardingWhatTitle =>
      'Les photos de l\'endroit exact où vous êtes';

  @override
  String get onboardingWhatBody =>
      'Arrivez dans un endroit que vous avez déjà photographié et Been Here vous montre ce que vous y avez pris — visite par visite, la plus ancienne d\'abord.';

  @override
  String get onboardingPrivacyTitle => 'Rien ne quitte votre téléphone';

  @override
  String get onboardingPrivacyBody =>
      'Pas de compte, pas de serveur, pas de statistiques. Been Here lit votre photothèque sur l\'appareil et garde un petit index à côté. Vos photos, et l\'endroit où elles ont été prises, restent où elles sont.';

  @override
  String get onboardingPrivacyFootnote =>
      'Deux choses peuvent atteindre le réseau, et toutes deux sont désactivées tant que vous ne les activez pas : les noms de lieux et la carte.';

  @override
  String get onboardingPhotosTitle => 'L\'app a besoin de vos photos';

  @override
  String get onboardingPhotosBody =>
      'Been Here note quelle photo a été prise où. Elle ne copie ni ne déplace jamais rien — elle retient des identifiants et des coordonnées, et ne lit les images elles-mêmes que pour vous les montrer.';

  @override
  String get onboardingPhotosAction => 'Autoriser les photos';

  @override
  String get onboardingDone => 'Commencer';

  @override
  String get settingsAboutTitle => 'À propos';

  @override
  String settingsVersion(String version, String build) {
    return 'Version $version ($build)';
  }

  @override
  String get settingsSourceTitle => 'Code source';

  @override
  String get settingsShowIntro => 'Revoir l\'introduction';

  @override
  String photoSemanticLabel(String date) {
    return 'Photo du $date';
  }

  @override
  String photoOpenSemanticLabel(int index, int total, String date) {
    return 'Photo $index sur $total, $date';
  }

  @override
  String get placesActionsLabel => 'Que faire de ce lieu';

  @override
  String get radiusSemanticLabel => 'Rayon de recherche';

  @override
  String get hereMapTitle => 'Autour d\'ici';

  @override
  String get hereOpenInMaps => 'Ouvrir dans Plans';

  @override
  String get hereBackToMe => 'Revenir à ma position';

  @override
  String get herePlaceFallbackTitle => 'Un lieu que vous connaissez';

  @override
  String get arrivalTestNearHome =>
      'Trop près de chez vous pour être une nouvelle.';

  @override
  String get settingsHomeRadiusTitle => 'Rester silencieux dans un rayon de';

  @override
  String settingsHomeRadiusValue(num km) {
    String _temp0 = intl.Intl.pluralLogic(
      km,
      locale: localeName,
      other: '$km km autour de chez vous',
      one: '$km km autour de chez vous',
      zero: 'aucune distance — jamais silencieux',
    );
    return '$_temp0';
  }

  @override
  String get settingsHomeRadiusBody =>
      'La vie quotidienne se passe près de chez soi, et c\'est là qu\'un téléphone qui la commente est le moins bienvenu. Les lieux plus proches que cela ne sont jamais surveillés.';

  @override
  String get settingsQuietTitle => 'Pourquoi c\'est silencieux';

  @override
  String settingsQuietWatching(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count lieux surveillés',
      one: '$count lieu surveillé',
      zero: 'Aucun lieu surveillé',
    );
    return '$_temp0';
  }

  @override
  String settingsQuietNearest(String distance) {
    return 'Lieu surveillé le plus proche : $distance';
  }

  @override
  String get settingsQuietNothingWatched =>
      'Rien n\'est surveillé, donc aucune arrivée n\'est possible.';

  @override
  String settingsQuietLastNotified(String when) {
    return 'Dernière notification : $when';
  }

  @override
  String get settingsQuietNever => 'jamais';

  @override
  String settingsQuietBreakdown(int total, String reasons) {
    return 'Sur $total lieux : $reasons';
  }

  @override
  String settingsQuietReasonMuted(Object count) {
    return '$count en sourdine';
  }

  @override
  String settingsQuietReasonNearHome(Object count) {
    return '$count près de chez vous';
  }

  @override
  String settingsQuietReasonTooFewPhotos(Object count) {
    return '$count avec trop peu de photos';
  }

  @override
  String settingsQuietReasonTooRecent(Object count) {
    return '$count photographiés trop récemment';
  }

  @override
  String settingsQuietReasonPlaceCooldown(Object count) {
    return '$count encore en pause';
  }

  @override
  String settingsQuietReasonEligible(Object count) {
    return '$count à surveiller';
  }

  @override
  String get ageSemanticLabel => 'Âge des photos';

  @override
  String get ageStopNow => 'maintenant';

  @override
  String get ageStopDay => '1 jour';

  @override
  String get ageStop3Days => '3 jours';

  @override
  String get ageStopWeek => '1 semaine';

  @override
  String get ageStop2Weeks => '2 semaines';

  @override
  String get ageStopMonth => '1 mois';

  @override
  String get ageStop3Months => '3 mois';

  @override
  String get ageStop6Months => '6 mois';

  @override
  String get ageStopYear => '1 an';

  @override
  String get ageStop2Years => '2 ans';

  @override
  String get ageStop5Years => '5 ans';

  @override
  String get ageStop10Years => '10 ans';

  @override
  String get ageStopAll => 'tout';

  @override
  String get ageWindowAll => 'Toutes les photos';

  @override
  String ageWindowNewerThan(String stop) {
    return 'Jusqu\'à $stop';
  }

  @override
  String ageWindowOlderThan(String stop) {
    return 'Plus de $stop';
  }

  @override
  String ageWindowBetween(String newest, String oldest) {
    return 'De $newest à $oldest';
  }

  @override
  String get ageWindowReset => 'Réinitialiser';

  @override
  String mapDotCountCapped(int count) {
    return '$count+ photos';
  }
}
