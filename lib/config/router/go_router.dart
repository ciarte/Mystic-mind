import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:horoscope_app/screens/screens.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'go_router.g.dart';

@riverpod
GoRouter appRouter(AppRouterRef ref) {
  /// The route configuration.
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const AuthChecker();
        },
      ),
      GoRoute(
        path: '/login',
        builder: (BuildContext context, GoRouterState state) {
          return const LoginScreen();
        },
      ),
      GoRoute(
        path: '/register',
        builder: (BuildContext context, GoRouterState state) {
          return const RegisterScreen();
        },
      ),
      GoRoute(
        path: '/userRegister',
        builder: (BuildContext context, GoRouterState state) {
          return const UserDataScreen();
        },
      ),
      GoRoute(
        path: '/home',
        builder: (BuildContext context, GoRouterState state) {
          return const HomeScreen();
        },
      ),
      GoRoute(
        path: '/compatibility',
        builder: (BuildContext context, GoRouterState state) {
          return const CompatibilityScreen();
        },
      ),
      GoRoute(
        path: '/horoscope',
        builder: (BuildContext context, GoRouterState state) {
          return const HoroscopeScreen();
        },
      ),
      GoRoute(
        path: '/oracle',
        builder: (BuildContext context, GoRouterState state) {
          return const OracleScreen();
        },
      ),
      GoRoute(
        path: '/tarot',
        builder: (BuildContext context, GoRouterState state) {
          return const TarotScreen();
        },
      ),
      GoRoute(
        path: '/config',
        builder: (BuildContext context, GoRouterState state) {
          return const UserConfigScreen();
        },
      ),
    ],
  );
}
