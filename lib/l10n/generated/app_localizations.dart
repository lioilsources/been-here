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
