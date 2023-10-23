import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:horoscope_app/providers/providers.dart';

class HoroscopeScreen extends ConsumerStatefulWidget {
  const HoroscopeScreen({super.key});

  @override
  HoroscopeScreenState createState() => HoroscopeScreenState();
}

class HoroscopeScreenState extends ConsumerState<HoroscopeScreen> {
  String mySign = 'aries';
  String date = 'today';
  @override
  Widget build(BuildContext context) {
    final horoscope = ref.watch(dayliHoroscopeProvider(mySign, date));

    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(254, 211, 170, 1),
          title: Text(
            'Horoscopo',
            style: GoogleFonts.krub(
              fontSize: 24,
              fontWeight: FontWeight.w400,
              color: const Color(0xff000000),
              height: 31 / 24,
            ),
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
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
              ])),
          child: Column(
            children: [
              horoscope.when(
                data: (data) => _HoroscopeText(data: data),
                loading: () => const CircularProgressIndicator(),
                error: (Object error, StackTrace stackTrace) => Text('$error'),
              ),
              // TextFormField(
              //   onTap:,

              // )
            ],
          ),
        ),
        floatingActionButton:
            FloatingActionButton(onPressed: () => context.push('/oracle')));
  }
}

class _HoroscopeText extends StatelessWidget {
  final data;
  const _HoroscopeText({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          textDirection: TextDirection.ltr,
          children: [
            TextButton(
              onPressed: () {},
              child: const Text(
                'Hoy',
                selectionColor: Colors.blue,
              ),
            ),
            TextButton(
              style: ButtonStyle(
                  backgroundColor: const MaterialStatePropertyAll(Colors.red),
                  shape: MaterialStatePropertyAll(StarBorder.polygon(
                      side: BorderSide.none,
                      sides: 5,
                      pointRounding: 1,
                      rotation: 5,
                      squash: 1))),
              onPressed: () {},
              child: const Text('Esta semana'),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Este mes'),
            ),
          ],
        )),
        AnimatedTextKit(
            isRepeatingAnimation: false,
            displayFullTextOnTap: true,
            animatedTexts: [
              TypewriterAnimatedText((data.horoscopeData),
                  speed: const Duration(milliseconds: 60))
            ]),
      ],
    );
  }
}
