import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:horoscope_app/config/config.dart';
import 'package:horoscope_app/providers/providers.dart';

void main() {
  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);
    final isDarkmode = ref.watch(darkModeProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme(selectedColor: 1, isDarkmode: isDarkmode).theme(),
      routerConfig: router,
    );
  }
}
