// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `welcome back`
  String get tTitle {
    return Intl.message(
      'welcome back',
      name: 'tTitle',
      desc: '',
      args: [],
    );
  }

  /// `What do you want to consult today`
  String get tSubTitle {
    return Intl.message(
      'What do you want to consult today',
      name: 'tSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get tConfig {
    return Intl.message(
      'Settings',
      name: 'tConfig',
      desc: '',
      args: [],
    );
  }

  /// `Theme :`
  String get tMode {
    return Intl.message(
      'Theme :',
      name: 'tMode',
      desc: '',
      args: [],
    );
  }

  /// `Select Your Alias`
  String get tAlias {
    return Intl.message(
      'Select Your Alias',
      name: 'tAlias',
      desc: '',
      args: [],
    );
  }

  /// `Write your Name/Alias`
  String get tHint {
    return Intl.message(
      'Write your Name/Alias',
      name: 'tHint',
      desc: '',
      args: [],
    );
  }

  /// `Select Your Sign`
  String get tSign {
    return Intl.message(
      'Select Your Sign',
      name: 'tSign',
      desc: '',
      args: [],
    );
  }

  /// `Select Your Language`
  String get tLanguage {
    return Intl.message(
      'Select Your Language',
      name: 'tLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Log out`
  String get bLogout {
    return Intl.message(
      'Log out',
      name: 'bLogout',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get mLanguage {
    return Intl.message(
      'Language',
      name: 'mLanguage',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get bEnglish {
    return Intl.message(
      'English',
      name: 'bEnglish',
      desc: '',
      args: [],
    );
  }

  /// `Spanish`
  String get bSpanish {
    return Intl.message(
      'Spanish',
      name: 'bSpanish',
      desc: '',
      args: [],
    );
  }

  /// `Name or Alias`
  String get bName {
    return Intl.message(
      'Name or Alias',
      name: 'bName',
      desc: '',
      args: [],
    );
  }

  /// `Zodiac sign`
  String get bBirthday {
    return Intl.message(
      'Zodiac sign',
      name: 'bBirthday',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get bContinue {
    return Intl.message(
      'Continue',
      name: 'bContinue',
      desc: '',
      args: [],
    );
  }

  /// `Oracle`
  String get tOracle {
    return Intl.message(
      'Oracle',
      name: 'tOracle',
      desc: '',
      args: [],
    );
  }

  /// `Write your question here, remember to end your question with '?' This oracle only gives “yes” and “no” answers.`
  String get mOracle {
    return Intl.message(
      'Write your question here, remember to end your question with \'?\' This oracle only gives “yes” and “no” answers.',
      name: 'mOracle',
      desc: '',
      args: [],
    );
  }

  /// `Leading the stars...`
  String get tLoadMessage {
    return Intl.message(
      'Leading the stars...',
      name: 'tLoadMessage',
      desc: '',
      args: [],
    );
  }

  /// `Horoscope`
  String get tHoroscope {
    return Intl.message(
      'Horoscope',
      name: 'tHoroscope',
      desc: '',
      args: [],
    );
  }

  /// `Capriconr`
  String get sCapricorn {
    return Intl.message(
      'Capriconr',
      name: 'sCapricorn',
      desc: '',
      args: [],
    );
  }

  /// `Geminis`
  String get sGemini {
    return Intl.message(
      'Geminis',
      name: 'sGemini',
      desc: '',
      args: [],
    );
  }

  /// `Leo`
  String get sLeo {
    return Intl.message(
      'Leo',
      name: 'sLeo',
      desc: '',
      args: [],
    );
  }

  /// `Libra`
  String get sLibra {
    return Intl.message(
      'Libra',
      name: 'sLibra',
      desc: '',
      args: [],
    );
  }

  /// `Pices`
  String get sPisces {
    return Intl.message(
      'Pices',
      name: 'sPisces',
      desc: '',
      args: [],
    );
  }

  /// `Sagittarius`
  String get sSagittarius {
    return Intl.message(
      'Sagittarius',
      name: 'sSagittarius',
      desc: '',
      args: [],
    );
  }

  /// `Scorpio`
  String get sScorpio {
    return Intl.message(
      'Scorpio',
      name: 'sScorpio',
      desc: '',
      args: [],
    );
  }

  /// `Taurus`
  String get sTaurus {
    return Intl.message(
      'Taurus',
      name: 'sTaurus',
      desc: '',
      args: [],
    );
  }

  /// `Virgo`
  String get sVirgo {
    return Intl.message(
      'Virgo',
      name: 'sVirgo',
      desc: '',
      args: [],
    );
  }

  /// `Aquarius`
  String get sAquarius {
    return Intl.message(
      'Aquarius',
      name: 'sAquarius',
      desc: '',
      args: [],
    );
  }

  /// `Aries`
  String get sAries {
    return Intl.message(
      'Aries',
      name: 'sAries',
      desc: '',
      args: [],
    );
  }

  /// `Cancer`
  String get sCancer {
    return Intl.message(
      'Cancer',
      name: 'sCancer',
      desc: '',
      args: [],
    );
  }

  /// `Today`
  String get mToday {
    return Intl.message(
      'Today',
      name: 'mToday',
      desc: '',
      args: [],
    );
  }

  /// `Monthly`
  String get mMonth {
    return Intl.message(
      'Monthly',
      name: 'mMonth',
      desc: '',
      args: [],
    );
  }

  /// `reflection of the day`
  String get tReflection {
    return Intl.message(
      'reflection of the day',
      name: 'tReflection',
      desc: '',
      args: [],
    );
  }

  /// `Tips for your sign`
  String get tAdvice {
    return Intl.message(
      'Tips for your sign',
      name: 'tAdvice',
      desc: '',
      args: [],
    );
  }

  /// `Tarot`
  String get tTarot {
    return Intl.message(
      'Tarot',
      name: 'tTarot',
      desc: '',
      args: [],
    );
  }

  /// `Pick a card to get a reading`
  String get mSubtitle {
    return Intl.message(
      'Pick a card to get a reading',
      name: 'mSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `compatibility between signs`
  String get tCompatibility {
    return Intl.message(
      'compatibility between signs',
      name: 'tCompatibility',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'es'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
