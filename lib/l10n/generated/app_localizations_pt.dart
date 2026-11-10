// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'Been Here';

  @override
  String get hereTabLabel => 'Aqui';

  @override
  String get placesTabLabel => 'Lugares';

  @override
  String get settingsTabLabel => 'Ajustes';

  @override
  String get hereEmptyTitle => 'Você não tirou fotos aqui';

  @override
  String get hereEmptyBody =>
      'Aumente o raio de busca ou volte a algum lugar onde você já esteve.';

  @override
  String get hereNotIndexedTitle => 'Nada indexado ainda';

  @override
  String get hereNotIndexedBody =>
      'O Been Here precisa ler sua fototeca uma vez para saber onde você já esteve. Nada sai do seu celular.';

  @override
  String get indexStartAction => 'Indexar minhas fotos';

  @override
  String get indexPermissionTitle => 'O Been Here precisa das suas fotos';

  @override
  String get indexPermissionBody =>
      'Ele lê apenas onde e quando cada foto foi tirada, e guarda isso neste celular.';

  @override
  String get indexPermissionAction => 'Permitir acesso';

  @override
  String get indexPermissionDeniedTitle => 'O acesso às fotos está desativado';

  @override
  String get indexPermissionDeniedBody =>
      'Sem ele, o Been Here não consegue mostrar nada. Você pode ativá-lo nos ajustes do sistema.';

  @override
  String get indexLimitedAccessNotice =>
      'Você compartilhou só algumas fotos, então o Been Here vê apenas essas. Com acesso total, ele encontra todos os lugares onde você esteve.';

  @override
  String get indexRunningTitle => 'Lendo sua fototeca';

  @override
  String indexRunningProgress(int processed, int total) {
    return '$processed de $total';
  }

  @override
  String get indexFailedTitle => 'A indexação parou';

  @override
  String get indexFailedBody =>
      'Algo deu errado no meio do caminho. Tentar de novo continua de onde parou.';

  @override
  String indexedPhotoCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotos indexadas',
      one: '$count foto indexada',
      zero: 'Nenhuma foto indexada',
    );
    return '$_temp0';
  }

  @override
  String indexedLocationCoverage(int percent) {
    return '$percent% delas têm localização';
  }

  @override
  String get commonLoading => 'Carregando…';

  @override
  String get commonRetry => 'Tentar de novo';

  @override
  String get commonCancel => 'Cancelar';

  @override
  String hereRadiusLabel(String radius) {
    return 'Num raio de $radius';
  }

  @override
  String herePhotoCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotos',
      one: '$count foto',
      zero: 'Nenhuma foto',
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
  String get ageToday => 'Hoje';

  @override
  String get ageYesterday => 'Ontem';

  @override
  String ageDaysAgo(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Há $days dias',
    );
    return '$_temp0';
  }

  @override
  String ageMonthsAgo(int months) {
    String _temp0 = intl.Intl.pluralLogic(
      months,
      locale: localeName,
      other: 'Há $months meses',
      one: 'Há um mês',
    );
    return '$_temp0';
  }

  @override
  String ageYearsAgo(int years) {
    String _temp0 = intl.Intl.pluralLogic(
      years,
      locale: localeName,
      other: 'Há $years anos',
      one: 'Há um ano',
    );
    return '$_temp0';
  }

  @override
  String get locationPermissionTitle => 'Onde você está?';

  @override
  String get locationPermissionBody =>
      'O Been Here compara sua posição com os lugares onde suas fotos foram tiradas. A comparação acontece neste celular.';

  @override
  String get locationPermissionAction => 'Usar minha localização';

  @override
  String get locationDeniedTitle => 'A localização está desativada';

  @override
  String get locationDeniedBody =>
      'Sem ela, o app não sabe o que você tem aqui. Você pode ativá-la nos ajustes do sistema.';

  @override
  String get locationUnavailableTitle => 'Ainda sem posição';

  @override
  String get locationUnavailableBody =>
      'Seu celular ainda não descobriu onde está. Em locais fechados, isso pode levar um momento.';

  @override
  String get locationServicesDisabledTitle =>
      'Os serviços de localização estão desativados';

  @override
  String get locationServicesDisabledBody =>
      'Ative-os nos ajustes do sistema e volte aqui.';

  @override
  String get hereNothingTitle => 'Você não tirou fotos aqui';

  @override
  String get hereNothingBody =>
      'Tente um raio maior ou volte a algum lugar onde você já esteve.';

  @override
  String hereNearestHint(String distance) {
    return 'Sua lembrança mais próxima está a $distance.';
  }

  @override
  String get photoDetailRephoto => 'Refotografar';

  @override
  String get photoDetailRephotoSoon => 'Refotografar chega numa versão futura.';

  @override
  String photoDetailOf(int index, int total) {
    return '$index de $total';
  }

  @override
  String get debugLocationTitle => 'Localização de depuração';

  @override
  String get debugLocationBody =>
      'Finja estar em outro lugar, para testar a tela Aqui do sofá.';

  @override
  String get debugLocationLatitude => 'Latitude';

  @override
  String get debugLocationLongitude => 'Longitude';

  @override
  String get debugLocationApply => 'Ir para lá';

  @override
  String get debugLocationClear => 'Usar a localização real';

  @override
  String get debugLocationActive => 'Localização de depuração ativa';

  @override
  String get commonClose => 'Fechar';

  @override
  String get placesEmptyTitle => 'Nenhum lugar ainda';

  @override
  String get placesEmptyBody =>
      'Os lugares aparecem depois que suas fotos forem indexadas.';

  @override
  String get placesSortLabel => 'Ordenar por';

  @override
  String get placesSortLongestAgo => 'Há mais tempo';

  @override
  String get placesSortMostPhotos => 'Mais fotos';

  @override
  String get placesSortNearest => 'Mais perto';

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
  String get placesUnmute => 'Reativar';

  @override
  String get placesUseAutoRule => 'Decidir automaticamente';

  @override
  String get placesAutoMutedNote =>
      'Silenciado automaticamente: você está aqui quase todo dia';

  @override
  String get placesUserMutedNote => 'Silenciado por você';

  @override
  String get placesUserUnmutedNote => 'Mantido visível por você';

  @override
  String placesDayCount(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days dias',
      one: '$days dia',
    );
    return '$_temp0';
  }

  @override
  String get settingsPlaceNamesTitle => 'Dar nome aos lugares';

  @override
  String get settingsPlaceNamesBody =>
      'Pede ao sistema que transforme as coordenadas de um lugar num nome. Essa coordenada vai para a Apple ou o Google — é a única coisa neste app que sai do seu celular. Desativado por padrão; desativar de novo esquece todos os nomes.';

  @override
  String get settingsAutoMuteTitle => 'Silenciar lugares do dia a dia após';

  @override
  String get settingsAutoMuteBody =>
      'Um lugar com fotos em tantos dias diferentes é onde você mora, não um lugar que você visita.';

  @override
  String settingsAutoMuteValue(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days dias',
    );
    return '$_temp0';
  }

  @override
  String get settingsIndexTitle => 'Índice de fotos';

  @override
  String get settingsReindex => 'Indexar tudo de novo do zero';

  @override
  String get settingsPrivacyTitle => 'O que fica neste celular';

  @override
  String get settingsPrivacyBody =>
      'Suas fotos, onde foram tiradas e tudo o que este app deduz delas. Não há conta, servidor nem análises.';

  @override
  String get placesName => 'Dar nome a este lugar';

  @override
  String get placesRename => 'Renomear';

  @override
  String get placesNameDialogTitle => 'Nome do lugar';

  @override
  String get placesNameHint => 'Casa da vó, o lago, o escritório…';

  @override
  String get placesNameSave => 'Salvar';

  @override
  String get placesNameClear => 'Remover nome';

  @override
  String placesSummary(String age, String photos) {
    return '$age · $photos';
  }

  @override
  String get notificationTitle => 'Você já esteve aqui';

  @override
  String notificationBody(String age, String photos) {
    return 'Sua última visita aqui: $age. $photos.';
  }

  @override
  String get alwaysLocationTitle => 'Deixe o Been Here perceber por você';

  @override
  String get alwaysLocationBody =>
      'Com a localização em segundo plano, seu celular pode avisar o Been Here quando você chega a um lugar que já fotografou — e o app pode dizer isso uma vez, sem você abrir nada.\n\nO app nunca segue você. Seu celular observa alguns círculos e só acorda o app quando você entra em um deles. Nada sobre onde você está sai deste aparelho.';

  @override
  String get alwaysLocationAction => 'Ativar chegadas';

  @override
  String get alwaysLocationLater => 'Agora não';

  @override
  String get alwaysLocationDeniedBody =>
      'A localização em segundo plano está desativada, então as chegadas ficam em silêncio. Todo o resto funciona como antes; você pode ativá-la nos ajustes do sistema quando quiser.';

  @override
  String get settingsArrivalsTitle => 'Chegadas';

  @override
  String get settingsArrivalsOn =>
      'O Been Here vai avisar quando você chegar a um lugar que não fotografa há algum tempo.';

  @override
  String get settingsArrivalsOff =>
      'O Been Here fica em silêncio. Ativar isto pede a localização em segundo plano.';

  @override
  String get settingsMemoryAgeTitle => 'Mencionar só lugares com mais de';

  @override
  String settingsMemoryAgeValue(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days dias',
      one: '$days dia',
    );
    return '$_temp0';
  }

  @override
  String get settingsPlaceCooldownTitle =>
      'Depois, deixar esse lugar quieto por';

  @override
  String get settingsDailyLimitTitle => 'E não dizer nada por';

  @override
  String settingsDailyLimitValue(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours horas',
      one: '$hours hora',
      zero: 'nenhum tempo',
    );
    return '$_temp0';
  }

  @override
  String get settingsThresholdsBody =>
      'Diminua estes valores para experimentar as chegadas sem esperar meio ano.';

  @override
  String get placesTestArrival => 'Testar uma chegada aqui';

  @override
  String get arrivalTestNotified => 'Notificação enviada';

  @override
  String get arrivalTestMuted => 'Nada: o lugar está silenciado';

  @override
  String get arrivalTestTooFewPhotos => 'Nada: poucas fotos aqui';

  @override
  String get arrivalTestTooRecent =>
      'Nada: você fotografou aqui há pouco tempo';

  @override
  String get arrivalTestPlaceCooldown =>
      'Nada: este lugar já falou recentemente';

  @override
  String get arrivalTestDailyLimit => 'Nada: outra coisa já falou hoje';

  @override
  String get alwaysLocationNeedsSettingsBody =>
      'Seu celular deixou a localização em \"Durante o Uso\". O iOS não oferece a escolha de novo dentro de um app, então a localização em segundo plano precisa ser mudada para \"Sempre\" nos ajustes do sistema — aí as chegadas começam a funcionar.';

  @override
  String get commonOpenSettings => 'Abrir ajustes';

  @override
  String get settingsArrivalsPending =>
      'Quase: a localização ainda está em \"Durante o Uso\". Mude para \"Sempre\" nos ajustes do sistema.';

  @override
  String get placesSortVisits => 'Mais visitas';

  @override
  String get placesSortAscending => 'Ordem inversa';

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
  String get settingsMapTitle => 'Mostrar lugares num mapa';

  @override
  String get settingsMapBody =>
      'Os blocos do mapa são baixados do OpenStreetMap conforme você arrasta e dá zoom, então esse servidor vê continuamente para onde você está olhando. Diferente do nome de um lugar, pedido uma única vez, isso continua enquanto o mapa estiver aberto. Desativado por padrão.';

  @override
  String get placesShowMap => 'Mapa';

  @override
  String get placesShowList => 'Lista';

  @override
  String get placesMapAttribution => '© Colaboradores do OpenStreetMap';

  @override
  String get rephotoOverlay => 'Esmaecer';

  @override
  String get rephotoEdges => 'Contorno';

  @override
  String get rephotoCapture => 'Tirar';

  @override
  String get rephotoSaved => 'Salva nas suas fotos';

  @override
  String get rephotoNotSaved =>
      'Não foi possível salvar. Adicionar fotos pode estar desativado.';

  @override
  String get rephotoNoCamera =>
      'Nenhuma câmera disponível. O Been Here precisa da câmera para tirar uma foto que responda a uma antiga.';

  @override
  String get rephotoThenAndNow => 'Antes e agora';

  @override
  String get rephotoShare => 'Compartilhar';

  @override
  String get rephotoThen => 'Antes';

  @override
  String get rephotoNow => 'Agora';

  @override
  String get rephotoShareFailed =>
      'Não foi possível criar a imagem para compartilhar.';

  @override
  String get onboardingSkip => 'Pular';

  @override
  String get onboardingNext => 'Próximo';

  @override
  String get onboardingWhatTitle => 'Fotos do lugar exato onde você está';

  @override
  String get onboardingWhatBody =>
      'Chegue a um lugar que você já fotografou e o Been Here mostra o que você tirou ali — visita por visita, da mais antiga primeiro.';

  @override
  String get onboardingPrivacyTitle => 'Nada sai do seu celular';

  @override
  String get onboardingPrivacyBody =>
      'Sem conta, sem servidor, sem análises. O Been Here lê sua fototeca no aparelho e mantém um pequeno índice ao lado. Suas fotos, e onde foram tiradas, ficam onde estão.';

  @override
  String get onboardingPrivacyFootnote =>
      'Duas coisas podem chegar à rede, e ambas ficam desativadas até você ativá-las: nomes de lugares e o mapa.';

  @override
  String get onboardingPhotosTitle => 'Ele precisa das suas fotos';

  @override
  String get onboardingPhotosBody =>
      'O Been Here anota qual foto foi tirada onde. Ele nunca copia nem move nada — guarda identificadores e coordenadas, e só lê as imagens quando as mostra para você.';

  @override
  String get onboardingPhotosAction => 'Permitir fotos';

  @override
  String get onboardingDone => 'Começar';

  @override
  String get settingsAboutTitle => 'Sobre';

  @override
  String settingsVersion(String version, String build) {
    return 'Versão $version ($build)';
  }

  @override
  String get settingsSourceTitle => 'Código-fonte';

  @override
  String get settingsShowIntro => 'Mostrar a introdução de novo';

  @override
  String photoSemanticLabel(String date) {
    return 'Foto de $date';
  }

  @override
  String photoOpenSemanticLabel(int index, int total, String date) {
    return 'Foto $index de $total, $date';
  }

  @override
  String get placesActionsLabel => 'O que fazer com este lugar';

  @override
  String get radiusSemanticLabel => 'Raio de busca';

  @override
  String get hereMapTitle => 'Por aqui';

  @override
  String get hereOpenInMaps => 'Abrir no Mapas';

  @override
  String get hereBackToMe => 'Voltar para onde estou';

  @override
  String get herePlaceFallbackTitle => 'Um lugar que você conhece';

  @override
  String get arrivalTestNearHome => 'Perto demais de casa para ser novidade.';

  @override
  String get settingsHomeRadiusTitle => 'Ficar quieto num raio de';

  @override
  String settingsHomeRadiusValue(num km) {
    String _temp0 = intl.Intl.pluralLogic(
      km,
      locale: localeName,
      other: '$km km de casa',
      one: '$km km de casa',
      zero: 'nenhuma distância — nunca quieto',
    );
    return '$_temp0';
  }

  @override
  String get settingsHomeRadiusBody =>
      'O dia a dia acontece perto de casa, e é ali que um celular comentando sobre ele é menos bem-vindo. Lugares mais perto que isso nunca são observados.';

  @override
  String get settingsQuietTitle => 'Por que está quieto';

  @override
  String settingsQuietWatching(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count lugares observados',
      one: '$count lugar observado',
      zero: 'Nenhum lugar observado',
    );
    return '$_temp0';
  }

  @override
  String settingsQuietNearest(String distance) {
    return 'Lugar observado mais próximo: $distance';
  }

  @override
  String get settingsQuietNothingWatched =>
      'Nada está sendo observado, então nenhuma chegada pode acontecer.';

  @override
  String settingsQuietLastNotified(String when) {
    return 'Última notificação: $when';
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
    return '$count perto de casa';
  }

  @override
  String settingsQuietReasonTooFewPhotos(Object count) {
    return '$count com poucas fotos';
  }

  @override
  String settingsQuietReasonTooRecent(Object count) {
    return '$count fotografados recentemente';
  }

  @override
  String settingsQuietReasonPlaceCooldown(Object count) {
    return '$count ainda em pausa';
  }

  @override
  String settingsQuietReasonEligible(Object count) {
    return '$count que valem a pena observar';
  }

  @override
  String get ageSemanticLabel => 'Idade das fotos';

  @override
  String get ageStopNow => 'agora';

  @override
  String get ageStopDay => '1 dia';

  @override
  String get ageStop3Days => '3 dias';

  @override
  String get ageStopWeek => '1 semana';

  @override
  String get ageStop2Weeks => '2 semanas';

  @override
  String get ageStopMonth => '1 mês';

  @override
  String get ageStop3Months => '3 meses';

  @override
  String get ageStop6Months => '6 meses';

  @override
  String get ageStopYear => '1 ano';

  @override
  String get ageStop2Years => '2 anos';

  @override
  String get ageStop5Years => '5 anos';

  @override
  String get ageStop10Years => '10 anos';

  @override
  String get ageStopAll => 'tudo';

  @override
  String get ageWindowAll => 'Todas as fotos';

  @override
  String ageWindowNewerThan(String stop) {
    return 'Até $stop';
  }

  @override
  String ageWindowOlderThan(String stop) {
    return 'Mais de $stop';
  }

  @override
  String ageWindowBetween(String newest, String oldest) {
    return 'De $newest a $oldest';
  }

  @override
  String get ageWindowReset => 'Redefinir';

  @override
  String mapDotCountCapped(int count) {
    return '$count+ fotos';
  }
}

/// The translations for Portuguese, as used in Portugal (`pt_PT`).
class AppLocalizationsPtPt extends AppLocalizationsPt {
  AppLocalizationsPtPt() : super('pt_PT');

  @override
  String get appTitle => 'Been Here';

  @override
  String get hereTabLabel => 'Aqui';

  @override
  String get placesTabLabel => 'Locais';

  @override
  String get settingsTabLabel => 'Definições';

  @override
  String get hereEmptyTitle => 'Não tirou fotografias aqui';

  @override
  String get hereEmptyBody =>
      'Alargue o raio de pesquisa ou volte a um sítio onde já tenha estado.';

  @override
  String get hereNotIndexedTitle => 'Ainda nada indexado';

  @override
  String get hereNotIndexedBody =>
      'O Been Here precisa de ler a sua fototeca uma vez para saber onde já esteve. Nada sai do seu telemóvel.';

  @override
  String get indexStartAction => 'Indexar as minhas fotografias';

  @override
  String get indexPermissionTitle => 'O Been Here precisa das suas fotografias';

  @override
  String get indexPermissionBody =>
      'Lê apenas onde e quando cada fotografia foi tirada, e guarda isso neste telemóvel.';

  @override
  String get indexPermissionAction => 'Permitir acesso';

  @override
  String get indexPermissionDeniedTitle =>
      'O acesso às fotografias está desativado';

  @override
  String get indexPermissionDeniedBody =>
      'Sem ele, o Been Here não consegue mostrar nada. Pode ativá-lo nas definições do sistema.';

  @override
  String get indexLimitedAccessNotice =>
      'Partilhou apenas algumas fotografias, por isso o Been Here só vê essas. Com acesso total, consegue encontrar todos os sítios onde esteve.';

  @override
  String get indexRunningTitle => 'A ler a sua fototeca';

  @override
  String indexRunningProgress(int processed, int total) {
    return '$processed de $total';
  }

  @override
  String get indexFailedTitle => 'A indexação parou';

  @override
  String get indexFailedBody =>
      'Algo correu mal a meio. Tentar novamente continua a partir de onde parou.';

  @override
  String indexedPhotoCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotografias indexadas',
      one: '$count fotografia indexada',
      zero: 'Nenhuma fotografia indexada',
    );
    return '$_temp0';
  }

  @override
  String indexedLocationCoverage(int percent) {
    return '$percent% delas têm localização';
  }

  @override
  String get commonLoading => 'A carregar…';

  @override
  String get commonRetry => 'Tentar novamente';

  @override
  String get commonCancel => 'Cancelar';

  @override
  String hereRadiusLabel(String radius) {
    return 'Num raio de $radius';
  }

  @override
  String herePhotoCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotografias',
      one: '$count fotografia',
      zero: 'Nenhuma fotografia',
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
  String get ageToday => 'Hoje';

  @override
  String get ageYesterday => 'Ontem';

  @override
  String ageDaysAgo(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Há $days dias',
    );
    return '$_temp0';
  }

  @override
  String ageMonthsAgo(int months) {
    String _temp0 = intl.Intl.pluralLogic(
      months,
      locale: localeName,
      other: 'Há $months meses',
      one: 'Há um mês',
    );
    return '$_temp0';
  }

  @override
  String ageYearsAgo(int years) {
    String _temp0 = intl.Intl.pluralLogic(
      years,
      locale: localeName,
      other: 'Há $years anos',
      one: 'Há um ano',
    );
    return '$_temp0';
  }

  @override
  String get locationPermissionTitle => 'Onde está?';

  @override
  String get locationPermissionBody =>
      'O Been Here compara a sua posição com os locais onde as suas fotografias foram tiradas. A comparação é feita neste telemóvel.';

  @override
  String get locationPermissionAction => 'Usar a minha localização';

  @override
  String get locationDeniedTitle => 'A localização está desativada';

  @override
  String get locationDeniedBody =>
      'Sem ela, a app não sabe o que tem aqui. Pode ativá-la nas definições do sistema.';

  @override
  String get locationUnavailableTitle => 'Ainda sem posição';

  @override
  String get locationUnavailableBody =>
      'O seu telemóvel ainda não determinou onde está. Em interiores, isto pode demorar um pouco.';

  @override
  String get locationServicesDisabledTitle =>
      'Os serviços de localização estão desativados';

  @override
  String get locationServicesDisabledBody =>
      'Ative-os nas definições do sistema e volte.';

  @override
  String get hereNothingTitle => 'Não tirou fotografias aqui';

  @override
  String get hereNothingBody =>
      'Experimente um raio maior ou volte a um sítio onde já tenha estado.';

  @override
  String hereNearestHint(String distance) {
    return 'A sua recordação mais próxima está a $distance.';
  }

  @override
  String get photoDetailRephoto => 'Refotografar';

  @override
  String get photoDetailRephotoSoon => 'Refotografar chega numa versão futura.';

  @override
  String photoDetailOf(int index, int total) {
    return '$index de $total';
  }

  @override
  String get debugLocationTitle => 'Localização de depuração';

  @override
  String get debugLocationBody =>
      'Finja estar noutro sítio, para testar o ecrã Aqui a partir do sofá.';

  @override
  String get debugLocationLatitude => 'Latitude';

  @override
  String get debugLocationLongitude => 'Longitude';

  @override
  String get debugLocationApply => 'Ir para lá';

  @override
  String get debugLocationClear => 'Usar a localização real';

  @override
  String get debugLocationActive => 'Localização de depuração ativa';

  @override
  String get commonClose => 'Fechar';

  @override
  String get placesEmptyTitle => 'Ainda não há locais';

  @override
  String get placesEmptyBody =>
      'Os locais aparecem depois de as suas fotografias serem indexadas.';

  @override
  String get placesSortLabel => 'Ordenar por';

  @override
  String get placesSortLongestAgo => 'Há mais tempo';

  @override
  String get placesSortMostPhotos => 'Mais fotografias';

  @override
  String get placesSortNearest => 'Mais perto';

  @override
  String placesMutedSection(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count locais silenciados',
      one: '$count local silenciado',
    );
    return '$_temp0';
  }

  @override
  String get placesMute => 'Silenciar';

  @override
  String get placesUnmute => 'Reativar';

  @override
  String get placesUseAutoRule => 'Decidir automaticamente';

  @override
  String get placesAutoMutedNote =>
      'Silenciado automaticamente: está aqui quase todos os dias';

  @override
  String get placesUserMutedNote => 'Silenciado por si';

  @override
  String get placesUserUnmutedNote => 'Mantido visível por si';

  @override
  String placesDayCount(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days dias',
      one: '$days dia',
    );
    return '$_temp0';
  }

  @override
  String get settingsPlaceNamesTitle => 'Dar nome aos locais';

  @override
  String get settingsPlaceNamesBody =>
      'Pede ao sistema que transforme as coordenadas de um local num nome. Essa coordenada vai para a Apple ou a Google — é a única coisa nesta app que sai do seu telemóvel. Desativado por predefinição; voltar a desativar esquece todos os nomes.';

  @override
  String get settingsAutoMuteTitle => 'Silenciar locais do dia a dia após';

  @override
  String get settingsAutoMuteBody =>
      'Um local com fotografias em tantos dias diferentes é onde vive, não um sítio que visita.';

  @override
  String settingsAutoMuteValue(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days dias',
    );
    return '$_temp0';
  }

  @override
  String get settingsIndexTitle => 'Índice de fotografias';

  @override
  String get settingsReindex => 'Indexar tudo de novo';

  @override
  String get settingsPrivacyTitle => 'O que fica neste telemóvel';

  @override
  String get settingsPrivacyBody =>
      'As suas fotografias, onde foram tiradas e tudo o que esta app deduz delas. Não há conta, servidor nem estatísticas.';

  @override
  String get placesName => 'Dar nome a este local';

  @override
  String get placesRename => 'Mudar o nome';

  @override
  String get placesNameDialogTitle => 'Nome do local';

  @override
  String get placesNameHint => 'Casa da avó, o lago, o escritório…';

  @override
  String get placesNameSave => 'Guardar';

  @override
  String get placesNameClear => 'Remover nome';

  @override
  String placesSummary(String age, String photos) {
    return '$age · $photos';
  }

  @override
  String get notificationTitle => 'Já esteve aqui';

  @override
  String notificationBody(String age, String photos) {
    return 'A sua última visita aqui: $age. $photos.';
  }

  @override
  String get alwaysLocationTitle => 'Deixe o Been Here reparar por si';

  @override
  String get alwaysLocationBody =>
      'Com a localização em segundo plano, o seu telemóvel pode avisar o Been Here quando chega a um sítio que já fotografou — e a app pode dizê-lo uma vez, sem que abra nada.\n\nA app nunca o segue. O seu telemóvel vigia uma mão-cheia de círculos e só acorda a app quando entra num deles. Nada sobre onde está sai deste dispositivo.';

  @override
  String get alwaysLocationAction => 'Ativar chegadas';

  @override
  String get alwaysLocationLater => 'Agora não';

  @override
  String get alwaysLocationDeniedBody =>
      'A localização em segundo plano está desativada, por isso as chegadas ficam em silêncio. Tudo o resto funciona como antes; pode ativá-la nas definições do sistema quando quiser.';

  @override
  String get settingsArrivalsTitle => 'Chegadas';

  @override
  String get settingsArrivalsOn =>
      'O Been Here avisa quando chegar a um sítio que não fotografa há algum tempo.';

  @override
  String get settingsArrivalsOff =>
      'O Been Here fica em silêncio. Ativar isto pede a localização em segundo plano.';

  @override
  String get settingsMemoryAgeTitle => 'Mencionar só locais com mais de';

  @override
  String settingsMemoryAgeValue(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days dias',
      one: '$days dia',
    );
    return '$_temp0';
  }

  @override
  String get settingsPlaceCooldownTitle =>
      'Depois, deixar esse local sossegado durante';

  @override
  String get settingsDailyLimitTitle => 'E não dizer nada durante';

  @override
  String settingsDailyLimitValue(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours horas',
      one: '$hours hora',
      zero: 'nenhum tempo',
    );
    return '$_temp0';
  }

  @override
  String get settingsThresholdsBody =>
      'Baixe estes valores para experimentar as chegadas sem esperar meio ano.';

  @override
  String get placesTestArrival => 'Testar uma chegada aqui';

  @override
  String get arrivalTestNotified => 'Notificação enviada';

  @override
  String get arrivalTestMuted => 'Nada: o local está silenciado';

  @override
  String get arrivalTestTooFewPhotos => 'Nada: poucas fotografias aqui';

  @override
  String get arrivalTestTooRecent =>
      'Nada: fotografou aqui há muito pouco tempo';

  @override
  String get arrivalTestPlaceCooldown =>
      'Nada: este local já falou recentemente';

  @override
  String get arrivalTestDailyLimit => 'Nada: outra coisa já falou hoje';

  @override
  String get alwaysLocationNeedsSettingsBody =>
      'O seu telemóvel deixou a localização em \"Durante a utilização\". O iOS não volta a oferecer a escolha dentro de uma app, por isso a localização em segundo plano tem de ser mudada para \"Sempre\" nas definições do sistema — e as chegadas começam a funcionar.';

  @override
  String get commonOpenSettings => 'Abrir definições';

  @override
  String get settingsArrivalsPending =>
      'Quase: a localização ainda está em \"Durante a utilização\". Mude-a para \"Sempre\" nas definições do sistema.';

  @override
  String get placesSortVisits => 'Mais visitas';

  @override
  String get placesSortAscending => 'Ordem inversa';

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
  String get settingsMapTitle => 'Mostrar locais num mapa';

  @override
  String get settingsMapBody =>
      'Os mosaicos do mapa são descarregados do OpenStreetMap à medida que desloca e amplia, por isso esse servidor vê continuamente para onde está a olhar. Ao contrário do nome de um local, pedido uma só vez, isto continua enquanto o mapa estiver aberto. Desativado por predefinição.';

  @override
  String get placesShowMap => 'Mapa';

  @override
  String get placesShowList => 'Lista';

  @override
  String get placesMapAttribution => '© Contribuidores do OpenStreetMap';

  @override
  String get rephotoOverlay => 'Esbater';

  @override
  String get rephotoEdges => 'Contorno';

  @override
  String get rephotoCapture => 'Tirar';

  @override
  String get rephotoSaved => 'Guardada nas suas fotografias';

  @override
  String get rephotoNotSaved =>
      'Não foi possível guardar. Adicionar fotografias pode estar desativado.';

  @override
  String get rephotoNoCamera =>
      'Nenhuma câmara disponível. O Been Here precisa da câmara para tirar uma fotografia que responda a uma antiga.';

  @override
  String get rephotoThenAndNow => 'Antes e agora';

  @override
  String get rephotoShare => 'Partilhar';

  @override
  String get rephotoThen => 'Antes';

  @override
  String get rephotoNow => 'Agora';

  @override
  String get rephotoShareFailed =>
      'Não foi possível criar a imagem para partilhar.';

  @override
  String get onboardingSkip => 'Saltar';

  @override
  String get onboardingNext => 'Seguinte';

  @override
  String get onboardingWhatTitle => 'Fotografias do sítio exato onde está';

  @override
  String get onboardingWhatBody =>
      'Chegue a um sítio que já fotografou e o Been Here mostra-lhe o que tirou lá — visita a visita, a mais antiga primeiro.';

  @override
  String get onboardingPrivacyTitle => 'Nada sai do seu telemóvel';

  @override
  String get onboardingPrivacyBody =>
      'Sem conta, sem servidor, sem estatísticas. O Been Here lê a sua fototeca no dispositivo e guarda um pequeno índice ao lado. As suas fotografias, e onde foram tiradas, ficam onde estão.';

  @override
  String get onboardingPrivacyFootnote =>
      'Duas coisas podem chegar à rede, e ambas estão desativadas até as ativar: nomes de locais e o mapa.';

  @override
  String get onboardingPhotosTitle => 'Precisa das suas fotografias';

  @override
  String get onboardingPhotosBody =>
      'O Been Here regista que fotografia foi tirada onde. Nunca copia nem move nada — guarda identificadores e coordenadas, e só lê as imagens quando lhas mostra.';

  @override
  String get onboardingPhotosAction => 'Permitir fotografias';

  @override
  String get onboardingDone => 'Começar';

  @override
  String get settingsAboutTitle => 'Acerca de';

  @override
  String settingsVersion(String version, String build) {
    return 'Versão $version ($build)';
  }

  @override
  String get settingsSourceTitle => 'Código-fonte';

  @override
  String get settingsShowIntro => 'Mostrar a introdução novamente';

  @override
  String photoSemanticLabel(String date) {
    return 'Fotografia de $date';
  }

  @override
  String photoOpenSemanticLabel(int index, int total, String date) {
    return 'Fotografia $index de $total, $date';
  }

  @override
  String get placesActionsLabel => 'O que fazer com este local';

  @override
  String get radiusSemanticLabel => 'Raio de pesquisa';

  @override
  String get hereMapTitle => 'Por aqui';

  @override
  String get hereOpenInMaps => 'Abrir no Mapas';

  @override
  String get hereBackToMe => 'Voltar para onde estou';

  @override
  String get herePlaceFallbackTitle => 'Um local que conhece';

  @override
  String get arrivalTestNearHome =>
      'Demasiado perto de casa para ser novidade.';

  @override
  String get settingsHomeRadiusTitle => 'Ficar em silêncio num raio de';

  @override
  String settingsHomeRadiusValue(num km) {
    String _temp0 = intl.Intl.pluralLogic(
      km,
      locale: localeName,
      other: '$km km de casa',
      one: '$km km de casa',
      zero: 'nenhuma distância — nunca em silêncio',
    );
    return '$_temp0';
  }

  @override
  String get settingsHomeRadiusBody =>
      'O dia a dia acontece perto de casa, e é aí que um telemóvel a comentá-lo é menos bem-vindo. Locais mais perto do que isto nunca são vigiados.';

  @override
  String get settingsQuietTitle => 'Porque está em silêncio';

  @override
  String settingsQuietWatching(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count locais vigiados',
      one: '$count local vigiado',
      zero: 'Nenhum local vigiado',
    );
    return '$_temp0';
  }

  @override
  String settingsQuietNearest(String distance) {
    return 'Local vigiado mais próximo: $distance';
  }

  @override
  String get settingsQuietNothingWatched =>
      'Nada está a ser vigiado, por isso não pode haver chegadas.';

  @override
  String settingsQuietLastNotified(String when) {
    return 'Última notificação: $when';
  }

  @override
  String get settingsQuietNever => 'nunca';

  @override
  String settingsQuietBreakdown(int total, String reasons) {
    return 'De $total locais: $reasons';
  }

  @override
  String settingsQuietReasonMuted(Object count) {
    return '$count silenciados';
  }

  @override
  String settingsQuietReasonNearHome(Object count) {
    return '$count perto de casa';
  }

  @override
  String settingsQuietReasonTooFewPhotos(Object count) {
    return '$count com poucas fotografias';
  }

  @override
  String settingsQuietReasonTooRecent(Object count) {
    return '$count fotografados recentemente';
  }

  @override
  String settingsQuietReasonPlaceCooldown(Object count) {
    return '$count ainda em pausa';
  }

  @override
  String settingsQuietReasonEligible(Object count) {
    return '$count que vale a pena vigiar';
  }

  @override
  String get ageSemanticLabel => 'Idade das fotografias';

  @override
  String get ageStopNow => 'agora';

  @override
  String get ageStopDay => '1 dia';

  @override
  String get ageStop3Days => '3 dias';

  @override
  String get ageStopWeek => '1 semana';

  @override
  String get ageStop2Weeks => '2 semanas';

  @override
  String get ageStopMonth => '1 mês';

  @override
  String get ageStop3Months => '3 meses';

  @override
  String get ageStop6Months => '6 meses';

  @override
  String get ageStopYear => '1 ano';

  @override
  String get ageStop2Years => '2 anos';

  @override
  String get ageStop5Years => '5 anos';

  @override
  String get ageStop10Years => '10 anos';

  @override
  String get ageStopAll => 'tudo';

  @override
  String get ageWindowAll => 'Todas as fotografias';

  @override
  String ageWindowNewerThan(String stop) {
    return 'Até $stop';
  }

  @override
  String ageWindowOlderThan(String stop) {
    return 'Mais de $stop';
  }

  @override
  String ageWindowBetween(String newest, String oldest) {
    return 'De $newest a $oldest';
  }

  @override
  String get ageWindowReset => 'Repor';

  @override
  String mapDotCountCapped(int count) {
    return '$count+ fotografias';
  }
}
