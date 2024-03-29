import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:horoscope_app/generated/l10n.dart';
import 'package:horoscope_app/providers/providers.dart';

class Tips extends ConsumerWidget {
  const Tips({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final texts = S.of(context);
    final language = S.current.bSpanish;
    final isDarkmode = ref.watch(darkModeProvider);
    final phrase = ref.watch(dayliPhraseProvider(language));

    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text(texts.tAdvice),
            ),
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
              ),
              Center(
                  child: Column(
                children: [
                  Container(
                    width: 200,
                    height: 250,
                    child: Image.asset(isDarkmode
                        ? 'assets/phrase1.png'
                        : 'assets/phrase2.png'),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      // child: Container(child: Text('aqui el texto')
                      child: phrase.when(
                        data: (data) => _PhraseText(data: data),
                        loading: () =>
                            const Center(child: CircularProgressIndicator()),
                        error: (Object error, StackTrace stackTrace) =>
                            Text('$error'),
                      ),
                    ),
                  ),
                ],
              )),
            ])));
  }
}

class _PhraseText extends StatelessWidget {
  final data;
  const _PhraseText({this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: AnimatedTextKit(
                isRepeatingAnimation: false,
                displayFullTextOnTap: true,
                animatedTexts: [
                  TypewriterAnimatedText((data),
                      speed: const Duration(milliseconds: 60),
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 18))
                ]),
          ),
        ),
      ],
    );
  }
}
