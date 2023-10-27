import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:horoscope_app/db/entities/entities.dart';
import 'package:horoscope_app/providers/providers.dart';
import 'package:horoscope_app/providers/tarot/three_cards_tarot_provider.dart';
import 'package:animate_do/animate_do.dart';

class TarotScreen extends ConsumerStatefulWidget {
  const TarotScreen({super.key});

  @override
  TarotScreenState createState() => TarotScreenState();
}

class TarotScreenState extends ConsumerState<TarotScreen> {
  @override
  Widget build(BuildContext context) {
    final tarot = ref.watch(tarotCardsProvider);
    final tarots = ref.watch(tarotThreeCardsProvider);
    final isDarkmode = ref.watch(darkModeProvider);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Tarot'),
        ),
        body: Stack(
          children: [
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
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: 250,
                width: 170,
                decoration: BoxDecoration(
                    color: Colors.white24,
                    border: Border.all(
                      color: const Color.fromRGBO(
                        168,
                        168,
                        168,
                        1,
                      ),
                      width: 4,
                    ),
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: AnimatedTextKit(
                      stopPauseOnTap: true,
                      isRepeatingAnimation: true,
                      displayFullTextOnTap: true,
                      repeatForever: true,
                      animatedTexts: [
                        TypewriterAnimatedText(
                            ('Elije una carta\n para obtener una\n lectura'),
                            speed: const Duration(milliseconds: 60),
                            cursor: '.'
                            // textStyle: const TextStyle(
                            //     fontWeight: FontWeight.w500, fontSize: 18)
                            )
                      ]),
                ),
              ),
            ),
            Positioned(
              height: 250,
              bottom: 0,
              left: 0,
              right: 0,
              child: Stack(
                alignment: Alignment.topCenter, // Alineación de las cartas
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 50, bottom: 0),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(150),
                        topRight: Radius.circular(150),
                      ),
                    ),
                    height: 300,
                  ),
                  Container(
                    height: 300,
                    child: tarots.when(
                      data: (data) => _TarotText(data: data),
                      loading: () =>
                          const Center(child: CircularProgressIndicator()),
                      error: (Object error, StackTrace stackTrace) =>
                          Text('$error'),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}

class _TarotText extends StatelessWidget {
  final List<Tarot> data;
  const _TarotText({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 250,
        width: double.infinity,
        child: Swiper(
            loop: true,
            layout: SwiperLayout.CUSTOM,
            customLayoutOption:
                CustomLayoutOption(startIndex: -1, stateCount: 3)
                  ..addRotate([-0.3, 0.0, 0.3])
                  ..addTranslate([
                    const Offset(-180.0, -15.0),
                    const Offset(0.0, 0.0),
                    const Offset(180.0, -15.0)
                  ]),
            itemWidth: 200.0,
            itemHeight: 250.0,
            itemCount: 3,
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () {
                    print(data[index].name);
                  },
                  child: Image.asset(
                    'assets/tarot_cards/light.png',
                  ));
            }));
  }
}

class _Slide extends StatelessWidget {
  final Tarot tarotCard;
  const _Slide({required this.tarotCard});

  @override
  Widget build(BuildContext context) {
    final decoration = BoxDecoration(
      borderRadius: BorderRadius.circular(10),
    );

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: DecoratedBox(
          decoration: decoration,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/tarot_cards/light.png',
              ))),
    );
  }
}
