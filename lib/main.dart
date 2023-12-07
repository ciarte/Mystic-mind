import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:horoscope_app/config/config.dart';
import 'package:horoscope_app/generated/l10n.dart';
import 'package:horoscope_app/providers/providers.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AdmobPlugin.initialize();
  // final adState = AdState(initFuture);
  // await SharedPreferencePluggin.prefs();
  // Obtener el valor guardado en localStorage

  runApp(const ProviderScope(
    // overrides: [adStateProvider.overrideWith((ref) => adState)],
    child: MyApp(),
  ));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedLanguage = ref.watch(currentLanguageProvider);
    // final selectedLanguage = LocalStorage.prefs.getString('selectedLanguage');
    final router = ref.watch(appRouterProvider);
    final isDarkmode = ref.watch(darkModeProvider);
    // bool savedMode = LocalStorage.prefs.getBool('selectedMode') ?? false;
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English
        Locale('es'), // Spanish
      ],
      locale: _getLocale(selectedLanguage),
      theme: AppTheme(selectedColor: 0, isDarkmode: isDarkmode).theme(),
      routerConfig: router,
    );
  }
}

Locale _getLocale(selectedLanguage) {
  switch (selectedLanguage) {
    case 'en':
      return const Locale('en');
    case 'es':
      return const Locale('es');
    default:
      return const Locale('es');
  }
}
