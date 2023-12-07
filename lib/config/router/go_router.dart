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
        path: '/tips',
        builder: (BuildContext context, GoRouterState state) {
          return const Tips();
        },
      ),
      GoRoute(
        path: '/config',
        builder: (BuildContext context, GoRouterState state) {
          return const UserConfigScreen();
        },
      ),
      //Ads
      GoRoute(
        path: '/ad-fullscreen',
        builder: (BuildContext context, GoRouterState state) {
          return const AdsFullScreen();
        },
      ),
      GoRoute(
        path: '/ad-reward',
        builder: (BuildContext context, GoRouterState state) {
          return const AdsRewardScreen();
        },
      ),
    ],
  );
}
