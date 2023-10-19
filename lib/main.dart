import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:horoscope_app/config/config.dart';
import 'package:horoscope_app/providers/providers.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

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
      theme: AppTheme(selectedColor: 0, isDarkmode: isDarkmode).theme(),
      routerConfig: router,
    );
  }
}
