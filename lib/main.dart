import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:horoscope_app/config/config.dart';
import 'package:horoscope_app/generated/l10n.dart';
import 'package:horoscope_app/providers/providers.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedLanguage = ref.watch(currentLanguageProvider);
    final router = ref.watch(appRouterProvider);
    final isDarkmode = ref.watch(darkModeProvider);

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

Locale _getLocale(Language selectedLanguage) {
  switch (selectedLanguage) {
    case Language.en:
      return const Locale('en');
    case Language.es:
      return const Locale('es');
    default:
      return const Locale('en');
  }
}
