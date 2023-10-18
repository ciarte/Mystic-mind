import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:horoscope_app/screens/screens.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'go_router.g.dart';

@riverpod
GoRouter appRouter(AppRouterRef ref) {
  /// The route configuration.
  return GoRouter(
    initialLocation: '/login',
    routes: [
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const HomeScreen();
        },
      ),
      GoRoute(
        path: '/login',
        builder: (BuildContext context, GoRouterState state) {
          return const LoginScreen();
        },
      ),
      GoRoute(
        path: '/oracle',
        builder: (BuildContext context, GoRouterState state) {
          return const OracleScreen();
        },
      ),
      GoRoute(
        path: '/horoscope',
        builder: (BuildContext context, GoRouterState state) {
          return const HoroscopeScreen();
        },
      ),
      GoRoute(
        path: '/config',
        builder: (BuildContext context, GoRouterState state) {
          return const UserConfigScreen();
        },
      ),
      GoRoute(
        path: '/tarot',
        builder: (BuildContext context, GoRouterState state) {
          return const TarotScreen();
        },
      ),
      GoRoute(
        path: '/compatibility',
        builder: (BuildContext context, GoRouterState state) {
          return const CompatibilityScreen();
        },
      ),
    ],
  );
}
