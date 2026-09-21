import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_cs.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('cs'),
    Locale('en'),
  ];

  /// Application name, shown in the task switcher and about box
  ///
  /// In en, this message translates to:
  /// **'Been Here'**
  String get appTitle;

  /// Title of the main screen showing photos around you
  ///
  /// In en, this message translates to:
  /// **'Here'**
  String get hereTabLabel;

  /// No description provided for @placesTabLabel.
  ///
  /// In en, this message translates to:
  /// **'Places'**
  String get placesTabLabel;

  /// No description provided for @settingsTabLabel.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTabLabel;

  /// Shown on the Here screen when no indexed photo is nearby
  ///
  /// In en, this message translates to:
  /// **'You haven\'t taken photos here'**
  String get hereEmptyTitle;

  /// No description provided for @hereEmptyBody.
  ///
  /// In en, this message translates to:
  /// **'Widen the search radius, or come back somewhere you\'ve been before.'**
  String get hereEmptyBody;

  /// Shown before the photo library has been scanned
  ///
  /// In en, this message translates to:
  /// **'Nothing indexed yet'**
  String get hereNotIndexedTitle;

  /// No description provided for @hereNotIndexedBody.
  ///
  /// In en, this message translates to:
  /// **'Been Here needs to read your photo library once to know where you\'ve been. Nothing leaves your phone.'**
  String get hereNotIndexedBody;

  /// No description provided for @indexStartAction.
  ///
  /// In en, this message translates to:
  /// **'Index my photos'**
  String get indexStartAction;

  /// Shown when the app has no access to the photo library yet
  ///
  /// In en, this message translates to:
  /// **'Been Here needs your photos'**
  String get indexPermissionTitle;

  /// No description provided for @indexPermissionBody.
  ///
  /// In en, this message translates to:
  /// **'It reads only where and when each photo was taken, and keeps that on this phone.'**
  String get indexPermissionBody;

  /// No description provided for @indexPermissionAction.
  ///
  /// In en, this message translates to:
  /// **'Allow access'**
  String get indexPermissionAction;

  /// No description provided for @indexPermissionDeniedTitle.
  ///
  /// In en, this message translates to:
  /// **'Photo access is off'**
  String get indexPermissionDeniedTitle;

  /// No description provided for @indexPermissionDeniedBody.
  ///
  /// In en, this message translates to:
  /// **'Been Here can\'t show you anything without it. You can turn it on in the system settings.'**
  String get indexPermissionDeniedBody;

  /// iOS limited photo access explainer. Informational, never nagging.
  ///
  /// In en, this message translates to:
  /// **'You\'ve shared only selected photos, so Been Here can only see those. Allowing full access lets it find every place you\'ve been.'**
  String get indexLimitedAccessNotice;

  /// No description provided for @indexRunningTitle.
  ///
  /// In en, this message translates to:
  /// **'Reading your photo library'**
  String get indexRunningTitle;

  /// Indexing progress counter
  ///
  /// In en, this message translates to:
  /// **'{processed} of {total}'**
  String indexRunningProgress(int processed, int total);

  /// No description provided for @indexFailedTitle.
  ///
  /// In en, this message translates to:
  /// **'Indexing stopped'**
  String get indexFailedTitle;

  /// No description provided for @indexFailedBody.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong part way through. Trying again carries on from where it stopped.'**
  String get indexFailedBody;

  /// No description provided for @indexedPhotoCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{No photos indexed} =1{1 photo indexed} other{{count} photos indexed}}'**
  String indexedPhotoCount(int count);

  /// How many indexed photos carry GPS coordinates
  ///
  /// In en, this message translates to:
  /// **'{percent}% of them have a location'**
  String indexedLocationCoverage(int percent);

  /// No description provided for @commonLoading.
  ///
  /// In en, this message translates to:
  /// **'Loading…'**
  String get commonLoading;

  /// No description provided for @commonRetry.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get commonRetry;

  /// No description provided for @commonCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get commonCancel;

  /// Label above the radius slider
  ///
  /// In en, this message translates to:
  /// **'Within {radius}'**
  String hereRadiusLabel(String radius);

  /// No description provided for @herePhotoCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{No photos} =1{1 photo} other{{count} photos}}'**
  String herePhotoCount(int count);

  /// No description provided for @hereVisitCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 visit} other{{count} visits}}'**
  String hereVisitCount(int count);

  /// No description provided for @distanceMeters.
  ///
  /// In en, this message translates to:
  /// **'{meters} m'**
  String distanceMeters(int meters);

  /// No description provided for @distanceKilometers.
  ///
  /// In en, this message translates to:
  /// **'{km} km'**
  String distanceKilometers(String km);

  /// No description provided for @ageToday.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get ageToday;

  /// No description provided for @ageYesterday.
  ///
  /// In en, this message translates to:
  /// **'Yesterday'**
  String get ageYesterday;

  /// No description provided for @ageDaysAgo.
  ///
  /// In en, this message translates to:
  /// **'{days, plural, other{{days} days ago}}'**
  String ageDaysAgo(int days);

  /// No description provided for @ageMonthsAgo.
  ///
  /// In en, this message translates to:
  /// **'{months, plural, =1{A month ago} other{{months} months ago}}'**
  String ageMonthsAgo(int months);

  /// No description provided for @ageYearsAgo.
  ///
  /// In en, this message translates to:
  /// **'{years, plural, =1{A year ago} other{{years} years ago}}'**
  String ageYearsAgo(int years);

  /// No description provided for @locationPermissionTitle.
  ///
  /// In en, this message translates to:
  /// **'Where are you?'**
  String get locationPermissionTitle;

  /// No description provided for @locationPermissionBody.
  ///
  /// In en, this message translates to:
  /// **'Been Here compares your position with the places your photos were taken. The comparison happens on this phone.'**
  String get locationPermissionBody;

  /// No description provided for @locationPermissionAction.
  ///
  /// In en, this message translates to:
  /// **'Use my location'**
  String get locationPermissionAction;

  /// No description provided for @locationDeniedTitle.
  ///
  /// In en, this message translates to:
  /// **'Location is off'**
  String get locationDeniedTitle;

  /// No description provided for @locationDeniedBody.
  ///
  /// In en, this message translates to:
  /// **'Without it the app can\'t tell what you have here. You can turn it on in the system settings.'**
  String get locationDeniedBody;

  /// No description provided for @locationUnavailableTitle.
  ///
  /// In en, this message translates to:
  /// **'No fix yet'**
  String get locationUnavailableTitle;

  /// No description provided for @locationUnavailableBody.
  ///
  /// In en, this message translates to:
  /// **'Your phone hasn\'t worked out where it is. Indoors this can take a moment.'**
  String get locationUnavailableBody;

  /// No description provided for @locationServicesDisabledTitle.
  ///
  /// In en, this message translates to:
  /// **'Location services are off'**
  String get locationServicesDisabledTitle;

  /// No description provided for @locationServicesDisabledBody.
  ///
  /// In en, this message translates to:
  /// **'Turn them on in the system settings and come back.'**
  String get locationServicesDisabledBody;

  /// No description provided for @hereNothingTitle.
  ///
  /// In en, this message translates to:
  /// **'You haven\'t taken photos here'**
  String get hereNothingTitle;

  /// No description provided for @hereNothingBody.
  ///
  /// In en, this message translates to:
  /// **'Try a wider radius, or come back somewhere you\'ve been before.'**
  String get hereNothingBody;

  /// No description provided for @hereNearestHint.
  ///
  /// In en, this message translates to:
  /// **'Your closest memory is {distance} away.'**
  String hereNearestHint(String distance);

  /// No description provided for @photoDetailRephoto.
  ///
  /// In en, this message translates to:
  /// **'Rephoto'**
  String get photoDetailRephoto;

  /// No description provided for @photoDetailRephotoSoon.
  ///
  /// In en, this message translates to:
  /// **'Rephoto arrives in a later version.'**
  String get photoDetailRephotoSoon;

  /// No description provided for @photoDetailOf.
  ///
  /// In en, this message translates to:
  /// **'{index} of {total}'**
  String photoDetailOf(int index, int total);

  /// No description provided for @debugLocationTitle.
  ///
  /// In en, this message translates to:
  /// **'Debug location'**
  String get debugLocationTitle;

  /// No description provided for @debugLocationBody.
  ///
  /// In en, this message translates to:
  /// **'Pretend to be somewhere else, so the Here screen can be tested from the sofa.'**
  String get debugLocationBody;

  /// No description provided for @debugLocationLatitude.
  ///
  /// In en, this message translates to:
  /// **'Latitude'**
  String get debugLocationLatitude;

  /// No description provided for @debugLocationLongitude.
  ///
  /// In en, this message translates to:
  /// **'Longitude'**
  String get debugLocationLongitude;

  /// No description provided for @debugLocationApply.
  ///
  /// In en, this message translates to:
  /// **'Go there'**
  String get debugLocationApply;

  /// No description provided for @debugLocationClear.
  ///
  /// In en, this message translates to:
  /// **'Use the real location'**
  String get debugLocationClear;

  /// No description provided for @debugLocationActive.
  ///
  /// In en, this message translates to:
  /// **'Debug location active'**
  String get debugLocationActive;

  /// No description provided for @commonClose.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get commonClose;

  /// No description provided for @placesEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No places yet'**
  String get placesEmptyTitle;

  /// No description provided for @placesEmptyBody.
  ///
  /// In en, this message translates to:
  /// **'Places appear once your photos have been indexed.'**
  String get placesEmptyBody;

  /// No description provided for @placesSortLabel.
  ///
  /// In en, this message translates to:
  /// **'Sort by'**
  String get placesSortLabel;

  /// No description provided for @placesSortLongestAgo.
  ///
  /// In en, this message translates to:
  /// **'Longest since'**
  String get placesSortLongestAgo;

  /// No description provided for @placesSortMostPhotos.
  ///
  /// In en, this message translates to:
  /// **'Most photos'**
  String get placesSortMostPhotos;

  /// No description provided for @placesSortNearest.
  ///
  /// In en, this message translates to:
  /// **'Nearest'**
  String get placesSortNearest;

  /// No description provided for @placesMutedSection.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 muted place} other{{count} muted places}}'**
  String placesMutedSection(int count);

  /// No description provided for @placesMute.
  ///
  /// In en, this message translates to:
  /// **'Mute'**
  String get placesMute;

  /// No description provided for @placesUnmute.
  ///
  /// In en, this message translates to:
  /// **'Unmute'**
  String get placesUnmute;

  /// No description provided for @placesUseAutoRule.
  ///
  /// In en, this message translates to:
  /// **'Decide automatically'**
  String get placesUseAutoRule;

  /// No description provided for @placesAutoMutedNote.
  ///
  /// In en, this message translates to:
  /// **'Muted automatically — you\'re here most days'**
  String get placesAutoMutedNote;

  /// No description provided for @placesUserMutedNote.
  ///
  /// In en, this message translates to:
  /// **'Muted by you'**
  String get placesUserMutedNote;

  /// No description provided for @placesUserUnmutedNote.
  ///
  /// In en, this message translates to:
  /// **'Kept visible by you'**
  String get placesUserUnmutedNote;

  /// No description provided for @placesDayCount.
  ///
  /// In en, this message translates to:
  /// **'{days, plural, =1{1 day} other{{days} days}}'**
  String placesDayCount(int days);

  /// No description provided for @settingsPlaceNamesTitle.
  ///
  /// In en, this message translates to:
  /// **'Name places'**
  String get settingsPlaceNamesTitle;

  /// No description provided for @settingsPlaceNamesBody.
  ///
  /// In en, this message translates to:
  /// **'Asks the system to turn a place\'s coordinates into a name. That coordinate goes to Apple or Google — it is the only thing in this app that leaves your phone. Off by default; turning it off again forgets every name.'**
  String get settingsPlaceNamesBody;

  /// No description provided for @settingsAutoMuteTitle.
  ///
  /// In en, this message translates to:
  /// **'Mute everyday places after'**
  String get settingsAutoMuteTitle;

  /// No description provided for @settingsAutoMuteBody.
  ///
  /// In en, this message translates to:
  /// **'A place with photos on this many different days is somewhere you live, not somewhere you visit.'**
  String get settingsAutoMuteBody;

  /// No description provided for @settingsAutoMuteValue.
  ///
  /// In en, this message translates to:
  /// **'{days, plural, other{{days} days}}'**
  String settingsAutoMuteValue(int days);

  /// No description provided for @settingsIndexTitle.
  ///
  /// In en, this message translates to:
  /// **'Photo index'**
  String get settingsIndexTitle;

  /// No description provided for @settingsReindex.
  ///
  /// In en, this message translates to:
  /// **'Index again from scratch'**
  String get settingsReindex;

  /// No description provided for @settingsPrivacyTitle.
  ///
  /// In en, this message translates to:
  /// **'What stays on this phone'**
  String get settingsPrivacyTitle;

  /// No description provided for @settingsPrivacyBody.
  ///
  /// In en, this message translates to:
  /// **'Your photos, where they were taken, and everything this app works out from them. There is no account, no server and no analytics.'**
  String get settingsPrivacyBody;

  /// No description provided for @placesName.
  ///
  /// In en, this message translates to:
  /// **'Name this place'**
  String get placesName;

  /// No description provided for @placesRename.
  ///
  /// In en, this message translates to:
  /// **'Rename'**
  String get placesRename;

  /// No description provided for @placesNameDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Place name'**
  String get placesNameDialogTitle;

  /// No description provided for @placesNameHint.
  ///
  /// In en, this message translates to:
  /// **'Grandma\'s, the lake, the office…'**
  String get placesNameHint;

  /// No description provided for @placesNameSave.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get placesNameSave;

  /// No description provided for @placesNameClear.
  ///
  /// In en, this message translates to:
  /// **'Remove name'**
  String get placesNameClear;

  /// Headline of a place row when it has no name
  ///
  /// In en, this message translates to:
  /// **'{age} · {photos}'**
  String placesSummary(String age, String photos);

  /// No description provided for @notificationTitle.
  ///
  /// In en, this message translates to:
  /// **'You\'ve been here before'**
  String get notificationTitle;

  /// No description provided for @notificationBody.
  ///
  /// In en, this message translates to:
  /// **'You were last here {age}. {photos}.'**
  String notificationBody(String age, String photos);

  /// No description provided for @alwaysLocationTitle.
  ///
  /// In en, this message translates to:
  /// **'Let Been Here notice for you'**
  String get alwaysLocationTitle;

  /// No description provided for @alwaysLocationBody.
  ///
  /// In en, this message translates to:
  /// **'With background location, your phone can tell Been Here when you arrive somewhere you\'ve photographed before — and it can say so, once, without you opening anything.\n\nThe app never follows you. Your phone watches a handful of circles and wakes the app only when you enter one. Nothing about where you are leaves this device.'**
  String get alwaysLocationBody;

  /// No description provided for @alwaysLocationAction.
  ///
  /// In en, this message translates to:
  /// **'Turn on arrivals'**
  String get alwaysLocationAction;

  /// No description provided for @alwaysLocationLater.
  ///
  /// In en, this message translates to:
  /// **'Not now'**
  String get alwaysLocationLater;

  /// No description provided for @alwaysLocationDeniedBody.
  ///
  /// In en, this message translates to:
  /// **'Background location is off, so arrivals stay quiet. Everything else works as before; you can turn it on in the system settings whenever you like.'**
  String get alwaysLocationDeniedBody;

  /// No description provided for @settingsArrivalsTitle.
  ///
  /// In en, this message translates to:
  /// **'Arrivals'**
  String get settingsArrivalsTitle;

  /// No description provided for @settingsArrivalsOn.
  ///
  /// In en, this message translates to:
  /// **'Been Here will tell you when you arrive somewhere you have not photographed in a while.'**
  String get settingsArrivalsOn;

  /// No description provided for @settingsArrivalsOff.
  ///
  /// In en, this message translates to:
  /// **'Been Here stays quiet. Turning this on asks for background location.'**
  String get settingsArrivalsOff;

  /// No description provided for @settingsMemoryAgeTitle.
  ///
  /// In en, this message translates to:
  /// **'Only mention places older than'**
  String get settingsMemoryAgeTitle;

  /// No description provided for @settingsMemoryAgeValue.
  ///
  /// In en, this message translates to:
  /// **'{days, plural, =1{1 day} other{{days} days}}'**
  String settingsMemoryAgeValue(int days);

  /// No description provided for @settingsPlaceCooldownTitle.
  ///
  /// In en, this message translates to:
  /// **'Then keep that place quiet for'**
  String get settingsPlaceCooldownTitle;

  /// No description provided for @settingsDailyLimitTitle.
  ///
  /// In en, this message translates to:
  /// **'And say nothing at all for'**
  String get settingsDailyLimitTitle;

  /// No description provided for @settingsDailyLimitValue.
  ///
  /// In en, this message translates to:
  /// **'{hours, plural, =0{no time} =1{1 hour} other{{hours} hours}}'**
  String settingsDailyLimitValue(int hours);

  /// No description provided for @settingsThresholdsBody.
  ///
  /// In en, this message translates to:
  /// **'Lower these to try arrivals out without waiting half a year.'**
  String get settingsThresholdsBody;

  /// No description provided for @placesTestArrival.
  ///
  /// In en, this message translates to:
  /// **'Test an arrival here'**
  String get placesTestArrival;

  /// No description provided for @arrivalTestNotified.
  ///
  /// In en, this message translates to:
  /// **'Notification sent'**
  String get arrivalTestNotified;

  /// No description provided for @arrivalTestMuted.
  ///
  /// In en, this message translates to:
  /// **'Nothing: the place is muted'**
  String get arrivalTestMuted;

  /// No description provided for @arrivalTestTooFewPhotos.
  ///
  /// In en, this message translates to:
  /// **'Nothing: too few photos here'**
  String get arrivalTestTooFewPhotos;

  /// No description provided for @arrivalTestTooRecent.
  ///
  /// In en, this message translates to:
  /// **'Nothing: you photographed here too recently'**
  String get arrivalTestTooRecent;

  /// No description provided for @arrivalTestPlaceCooldown.
  ///
  /// In en, this message translates to:
  /// **'Nothing: this place spoke recently'**
  String get arrivalTestPlaceCooldown;

  /// No description provided for @arrivalTestDailyLimit.
  ///
  /// In en, this message translates to:
  /// **'Nothing: something else spoke today'**
  String get arrivalTestDailyLimit;

  /// No description provided for @alwaysLocationNeedsSettingsBody.
  ///
  /// In en, this message translates to:
  /// **'Your phone kept location on \"While Using\". iOS will not offer the choice again from inside an app, so background location has to be switched to \"Always\" in the system settings — then arrivals start working.'**
  String get alwaysLocationNeedsSettingsBody;

  /// No description provided for @commonOpenSettings.
  ///
  /// In en, this message translates to:
  /// **'Open settings'**
  String get commonOpenSettings;

  /// No description provided for @settingsArrivalsPending.
  ///
  /// In en, this message translates to:
  /// **'Almost: location is still \"While Using\". Set it to \"Always\" in the system settings.'**
  String get settingsArrivalsPending;

  /// No description provided for @placesSortVisits.
  ///
  /// In en, this message translates to:
  /// **'Most visits'**
  String get placesSortVisits;

  /// No description provided for @placesSortAscending.
  ///
  /// In en, this message translates to:
  /// **'Reverse order'**
  String get placesSortAscending;

  /// No description provided for @placesVisitCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{never} =1{1 visit} other{{count} visits}}'**
  String placesVisitCount(int count);

  /// No description provided for @settingsMapTitle.
  ///
  /// In en, this message translates to:
  /// **'Show places on a map'**
  String get settingsMapTitle;

  /// No description provided for @settingsMapBody.
  ///
  /// In en, this message translates to:
  /// **'Map tiles are downloaded from OpenStreetMap as you pan and zoom, so that server sees a running account of where you are looking. Unlike a place name, which is asked once, this continues for as long as the map is open. Off by default.'**
  String get settingsMapBody;

  /// No description provided for @placesShowMap.
  ///
  /// In en, this message translates to:
  /// **'Map'**
  String get placesShowMap;

  /// No description provided for @placesShowList.
  ///
  /// In en, this message translates to:
  /// **'List'**
  String get placesShowList;

  /// No description provided for @placesMapAttribution.
  ///
  /// In en, this message translates to:
  /// **'© OpenStreetMap contributors'**
  String get placesMapAttribution;

  /// No description provided for @rephotoOverlay.
  ///
  /// In en, this message translates to:
  /// **'Fade'**
  String get rephotoOverlay;

  /// No description provided for @rephotoEdges.
  ///
  /// In en, this message translates to:
  /// **'Outline'**
  String get rephotoEdges;

  /// No description provided for @rephotoCapture.
  ///
  /// In en, this message translates to:
  /// **'Take it'**
  String get rephotoCapture;

  /// No description provided for @rephotoSaved.
  ///
  /// In en, this message translates to:
  /// **'Saved to your photos'**
  String get rephotoSaved;

  /// No description provided for @rephotoNotSaved.
  ///
  /// In en, this message translates to:
  /// **'Could not save it. Adding photos may be turned off.'**
  String get rephotoNotSaved;

  /// No description provided for @rephotoNoCamera.
  ///
  /// In en, this message translates to:
  /// **'No camera available. Been Here needs the camera to take a photo that answers an old one.'**
  String get rephotoNoCamera;

  /// No description provided for @rephotoThenAndNow.
  ///
  /// In en, this message translates to:
  /// **'Then & now'**
  String get rephotoThenAndNow;

  /// No description provided for @rephotoShare.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get rephotoShare;

  /// No description provided for @rephotoThen.
  ///
  /// In en, this message translates to:
  /// **'Then'**
  String get rephotoThen;

  /// No description provided for @rephotoNow.
  ///
  /// In en, this message translates to:
  /// **'Now'**
  String get rephotoNow;

  /// No description provided for @rephotoShareFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not build the image to share.'**
  String get rephotoShareFailed;

  /// No description provided for @onboardingSkip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get onboardingSkip;

  /// No description provided for @onboardingNext.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get onboardingNext;

  /// No description provided for @onboardingWhatTitle.
  ///
  /// In en, this message translates to:
  /// **'Photos from the spot you are standing on'**
  String get onboardingWhatTitle;

  /// No description provided for @onboardingWhatBody.
  ///
  /// In en, this message translates to:
  /// **'Arrive somewhere you have photographed before and Been Here shows you what you took there — visit by visit, longest ago first.'**
  String get onboardingWhatBody;

  /// No description provided for @onboardingPrivacyTitle.
  ///
  /// In en, this message translates to:
  /// **'Nothing leaves your phone'**
  String get onboardingPrivacyTitle;

  /// No description provided for @onboardingPrivacyBody.
  ///
  /// In en, this message translates to:
  /// **'No account, no server, no analytics. Been Here reads your photo library on the device and keeps a small index beside it. Your photos, and where they were taken, stay where they are.'**
  String get onboardingPrivacyBody;

  /// No description provided for @onboardingPrivacyFootnote.
  ///
  /// In en, this message translates to:
  /// **'Two things can reach the network, and both are off until you turn them on: place names and the map.'**
  String get onboardingPrivacyFootnote;

  /// No description provided for @onboardingPhotosTitle.
  ///
  /// In en, this message translates to:
  /// **'It needs your photos'**
  String get onboardingPhotosTitle;

  /// No description provided for @onboardingPhotosBody.
  ///
  /// In en, this message translates to:
  /// **'Been Here notes which photo was taken where. It never copies or moves anything — it remembers ids and coordinates, and reads the pictures themselves only when it shows them to you.'**
  String get onboardingPhotosBody;

  /// No description provided for @onboardingPhotosAction.
  ///
  /// In en, this message translates to:
  /// **'Allow photos'**
  String get onboardingPhotosAction;

  /// No description provided for @onboardingDone.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get onboardingDone;

  /// No description provided for @settingsAboutTitle.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get settingsAboutTitle;

  /// App version and build number in the about section
  ///
  /// In en, this message translates to:
  /// **'Version {version} ({build})'**
  String settingsVersion(String version, String build);

  /// No description provided for @settingsSourceTitle.
  ///
  /// In en, this message translates to:
  /// **'Source code'**
  String get settingsSourceTitle;

  /// No description provided for @settingsShowIntro.
  ///
  /// In en, this message translates to:
  /// **'Show the intro again'**
  String get settingsShowIntro;

  /// Screen reader label for a photo shown on its own
  ///
  /// In en, this message translates to:
  /// **'Photo from {date}'**
  String photoSemanticLabel(String date);

  /// Screen reader label for one photo in a visit's grid
  ///
  /// In en, this message translates to:
  /// **'Photo {index} of {total}, {date}'**
  String photoOpenSemanticLabel(int index, int total, String date);

  /// No description provided for @placesActionsLabel.
  ///
  /// In en, this message translates to:
  /// **'What to do with this place'**
  String get placesActionsLabel;

  /// No description provided for @radiusSemanticLabel.
  ///
  /// In en, this message translates to:
  /// **'Search radius'**
  String get radiusSemanticLabel;

  /// No description provided for @hereMapTitle.
  ///
  /// In en, this message translates to:
  /// **'Around here'**
  String get hereMapTitle;

  /// No description provided for @hereOpenInMaps.
  ///
  /// In en, this message translates to:
  /// **'Open in Maps'**
  String get hereOpenInMaps;

  /// No description provided for @hereBackToMe.
  ///
  /// In en, this message translates to:
  /// **'Back to where I am'**
  String get hereBackToMe;

  /// No description provided for @herePlaceFallbackTitle.
  ///
  /// In en, this message translates to:
  /// **'A place you know'**
  String get herePlaceFallbackTitle;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['cs', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'cs':
      return AppLocalizationsCs();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
