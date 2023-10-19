import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:horoscope_app/providers/auth/auth_provider.dart';
import 'package:horoscope_app/screens/screens.dart';
import 'package:horoscope_app/screens/splash/splash_screen.dart';

class AuthChecker extends ConsumerWidget {
  const AuthChecker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _authState = ref.watch(authStatusProvider);

    return _authState.when(
        data: (user) {
          if (user != null) return const HomeScreen();
          return const LoginScreen();
        },
        loading: () => const SplashScreen(),
        error: (e, trace) => const LoginScreen());
  }
}
