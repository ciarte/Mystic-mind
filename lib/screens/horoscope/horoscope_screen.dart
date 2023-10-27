import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
  bool isSelected = true;

  @override
  Widget build(BuildContext context) {
    final horoscope = ref.watch(dayliHoroscopeProvider(mySign, date));
    final isDarkmode = ref.watch(darkModeProvider);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: !isDarkmode
              ? const Color.fromRGBO(254, 211, 170, 1)
              : const Color.fromRGBO(23, 5, 66, 1),
          title: Text(
            'Horoscopo',
            style: GoogleFonts.macondo(
              fontSize: 28,
              fontWeight: FontWeight.w400,
              color: !isDarkmode ? const Color(0xff000000) : Color(0xFFEEEBEB),
              height: 31 / 24,
            ),
          ),
        ),
        body: Container(
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
                        Color.fromRGBO(23, 5, 66, 1),
                        Color.fromRGBO(155, 85, 148, 1),
                      ])),
          child: Column(
            children: [
              Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                textDirection: TextDirection.ltr,
                children: [
                  FilledButton(
                    style: isSelected
                        ? ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              const Color.fromRGBO(167, 12, 56, 1),
                            ),
                            textStyle: MaterialStateProperty.all(
                              const TextStyle(color: Colors.white),
                            ))
                        : ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              const Color.fromRGBO(255, 160, 175, 1),
                            ),
                            textStyle: MaterialStateProperty.all(
                              const TextStyle(color: Colors.white),
                            )),
                    onPressed: () {
                      setState(() {
                        date = 'today';
                        isSelected = true;
                      });
                    },
                    child: const Text(
                      'Today',

                      // selectionColor: Colors.blue,
                    ),
                  ),
                  FilledButton(
                    style: !isSelected
                        ? ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              const Color.fromRGBO(167, 12, 56, 1),
                            ),
                            textStyle: MaterialStateProperty.all(
                              const TextStyle(color: Colors.white),
                            ))
                        : ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              const Color.fromRGBO(255, 160, 175, 1),
                            ),
                            textStyle: MaterialStateProperty.all(
                              const TextStyle(color: Colors.white),
                            )),
                    onPressed: () {
                      setState(() {
                        date = 'month';
                        isSelected = false;
                      });
                    },
                    child: const Text(
                      'month',

                      // selectionColor: Colors.blue,
                    ),
                  ),
                ],
              )),
              horoscope.when(
                data: (data) => _HoroscopeText(data: data),
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (Object error, StackTrace stackTrace) => Text('$error'),
              ),
            ],
          ),
        ));
  }
}

class _HoroscopeText extends StatelessWidget {
  final data;
  const _HoroscopeText({super.key, this.data});

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
                  TypewriterAnimatedText((data.horoscopeData),
                      speed: const Duration(milliseconds: 60))
                ]),
          ),
        ),
      ],
    );
  }
}

// class _CustomNavigtor extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint();

//     paint.color = const Color.fromRGBO(167, 12, 53, 1);
//     paint.style = PaintingStyle.fill;
//     paint.strokeWidth = 5;

//     Path path = Path();

//     path.moveTo(25, 0);
//     path.lineTo(size.width - 25, 0);
//     path.quadraticBezierTo(size.width, 0, size.width, 25);
//     path.lineTo(size.width, size.height);
//     path.lineTo(0, size.height);
//     path.lineTo(0, 25);
//     path.quadraticBezierTo(0, 0, 25, 0);

//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }
