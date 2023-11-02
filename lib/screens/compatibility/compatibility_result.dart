import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:horoscope_app/generated/l10n.dart';
import 'package:horoscope_app/providers/providers.dart';

class CompatibilityResult extends ConsumerWidget {
  final String sign1;
  final String sign2;

  const CompatibilityResult(
      {super.key, required this.sign1, required this.sign2});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final texts = S.of(context);
    final isDarkmode = ref.watch(darkModeProvider);
    return SafeArea(
        child: Scaffold(
            body: Stack(children: [
      Container(
        decoration: !isDarkmode
            ? const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/fondo.png'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.linearToSrgbGamma(),
                    opacity: 0.5),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    tileMode: TileMode.decal,
                    stops: [
                      0.1,
                      0.6
                    ],
                    colors: [
                      Color.fromRGBO(254, 211, 170, 1),
                      Color.fromRGBO(191, 141, 187, 1),
                    ]))
            : const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/fondo.png'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.linearToSrgbGamma(),
                    opacity: 0.5),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    tileMode: TileMode.decal,
                    stops: [
                      0.1,
                      0.6
                    ],
                    colors: [
                      Color.fromRGBO(155, 85, 148, 1),
                      Color.fromRGBO(23, 5, 66, 1),
                    ])),
      )
    ])));
  }
}
