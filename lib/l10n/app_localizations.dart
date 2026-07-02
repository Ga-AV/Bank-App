import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
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
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es')
  ];

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Bank App'**
  String get welcome;

  /// No description provided for @slogan.
  ///
  /// In en, this message translates to:
  /// **'Secure. Simple. Seamless.'**
  String get slogan;

  /// No description provided for @enter.
  ///
  /// In en, this message translates to:
  /// **'Enter'**
  String get enter;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @username.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get username;

  /// No description provided for @sign_in.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get sign_in;

  /// No description provided for @sign_up.
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get sign_up;

  /// No description provided for @welcome_back.
  ///
  /// In en, this message translates to:
  /// **'Welcome Back'**
  String get welcome_back;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @forgot_password.
  ///
  /// In en, this message translates to:
  /// **'Forgot your password?'**
  String get forgot_password;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register now'**
  String get register;

  /// No description provided for @not_member.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have account? '**
  String get not_member;

  /// No description provided for @hi_there.
  ///
  /// In en, this message translates to:
  /// **'Hi there, sign in to continue '**
  String get hi_there;

  /// No description provided for @create_new_account.
  ///
  /// In en, this message translates to:
  /// **'Create a new account'**
  String get create_new_account;

  /// No description provided for @or_continue.
  ///
  /// In en, this message translates to:
  /// **'O continue with'**
  String get or_continue;

  /// No description provided for @invalid_credentials.
  ///
  /// In en, this message translates to:
  /// **'Invalid credentials, please try again'**
  String get invalid_credentials;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Log out'**
  String get logout;

  /// No description provided for @confirmation_logout.
  ///
  /// In en, this message translates to:
  /// **'Do you want to log out?'**
  String get confirmation_logout;

  /// No description provided for @confirmation.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirmation;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @notification_settings.
  ///
  /// In en, this message translates to:
  /// **'Notification Settings'**
  String get notification_settings;

  /// No description provided for @password_settings.
  ///
  /// In en, this message translates to:
  /// **'Password Settings'**
  String get password_settings;

  /// No description provided for @block_account.
  ///
  /// In en, this message translates to:
  /// **'Block Account'**
  String get block_account;

  /// No description provided for @preferences.
  ///
  /// In en, this message translates to:
  /// **'Preferences'**
  String get preferences;

  /// No description provided for @general_notifications.
  ///
  /// In en, this message translates to:
  /// **'General Notifications'**
  String get general_notifications;

  /// No description provided for @sound.
  ///
  /// In en, this message translates to:
  /// **'Sound'**
  String get sound;

  /// No description provided for @sound_call.
  ///
  /// In en, this message translates to:
  /// **'Sound Call'**
  String get sound_call;

  /// No description provided for @vibrate.
  ///
  /// In en, this message translates to:
  /// **'Vibrate'**
  String get vibrate;

  /// No description provided for @transaction_update.
  ///
  /// In en, this message translates to:
  /// **'Transaction Update'**
  String get transaction_update;

  /// No description provided for @expense_reminder.
  ///
  /// In en, this message translates to:
  /// **'Expense Reminder'**
  String get expense_reminder;

  /// No description provided for @budget_notifications.
  ///
  /// In en, this message translates to:
  /// **'Budget Notifications'**
  String get budget_notifications;

  /// No description provided for @low_balance_alerts.
  ///
  /// In en, this message translates to:
  /// **'Low Balance Alerts'**
  String get low_balance_alerts;

  /// No description provided for @select_language.
  ///
  /// In en, this message translates to:
  /// **'Select a language'**
  String get select_language;

  /// No description provided for @current_password.
  ///
  /// In en, this message translates to:
  /// **'Current Password'**
  String get current_password;

  /// No description provided for @new_password.
  ///
  /// In en, this message translates to:
  /// **'New Password'**
  String get new_password;

  /// No description provided for @confirm_new_password.
  ///
  /// In en, this message translates to:
  /// **'Confirm New Password'**
  String get confirm_new_password;

  /// No description provided for @change_password.
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get change_password;

  /// No description provided for @confirm_password.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirm_password;

  /// No description provided for @important_message.
  ///
  /// In en, this message translates to:
  /// **'Important Message'**
  String get important_message;

  /// No description provided for @block_account_warning.
  ///
  /// In en, this message translates to:
  /// **'By blocking your account, all outgoing transactions, transfers, and card payments will be paused until you contact support or reactivate your access.'**
  String get block_account_warning;

  /// No description provided for @block.
  ///
  /// In en, this message translates to:
  /// **'Block'**
  String get block;

  /// No description provided for @transfers.
  ///
  /// In en, this message translates to:
  /// **'Transfers'**
  String get transfers;

  /// No description provided for @transfer.
  ///
  /// In en, this message translates to:
  /// **'Transfer'**
  String get transfer;

  /// No description provided for @source_account.
  ///
  /// In en, this message translates to:
  /// **'Source account'**
  String get source_account;

  /// No description provided for @source_account_balance.
  ///
  /// In en, this message translates to:
  /// **'Source account balance'**
  String get source_account_balance;

  /// No description provided for @destination_account.
  ///
  /// In en, this message translates to:
  /// **'Destination account'**
  String get destination_account;

  /// No description provided for @manage_third_party_accounts.
  ///
  /// In en, this message translates to:
  /// **'Manage third-party accounts'**
  String get manage_third_party_accounts;

  /// No description provided for @transfer_amount.
  ///
  /// In en, this message translates to:
  /// **'Transfer amount'**
  String get transfer_amount;

  /// No description provided for @confirm_transfer.
  ///
  /// In en, this message translates to:
  /// **'Confirm transfer'**
  String get confirm_transfer;

  /// No description provided for @transfer_from_to.
  ///
  /// In en, this message translates to:
  /// **'Transfer from account XXX to account YYY'**
  String get transfer_from_to;

  /// No description provided for @good_morning.
  ///
  /// In en, this message translates to:
  /// **'Good morning 👋'**
  String get good_morning;

  /// No description provided for @user_name.
  ///
  /// In en, this message translates to:
  /// **'User Name'**
  String get user_name;

  /// No description provided for @account_number.
  ///
  /// In en, this message translates to:
  /// **'Account Number'**
  String get account_number;

  /// No description provided for @balance.
  ///
  /// In en, this message translates to:
  /// **'Balance'**
  String get balance;

  /// No description provided for @transactions.
  ///
  /// In en, this message translates to:
  /// **'Transactions'**
  String get transactions;

  /// No description provided for @all_transactions.
  ///
  /// In en, this message translates to:
  /// **'All transactions'**
  String get all_transactions;

  /// No description provided for @movements.
  ///
  /// In en, this message translates to:
  /// **'Movements'**
  String get movements;

  /// No description provided for @total_spendings.
  ///
  /// In en, this message translates to:
  /// **'Total Spendings'**
  String get total_spendings;

  /// No description provided for @from_selection.
  ///
  /// In en, this message translates to:
  /// **'From selection'**
  String get from_selection;

  /// No description provided for @recent_transactions.
  ///
  /// In en, this message translates to:
  /// **'Recent Transactions'**
  String get recent_transactions;

  /// No description provided for @your_email.
  ///
  /// In en, this message translates to:
  /// **'Your email'**
  String get your_email;

  /// No description provided for @already_have_account.
  ///
  /// In en, this message translates to:
  /// **'Already have an account? '**
  String get already_have_account;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'es': return AppLocalizationsEs();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
