import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:horoscope_app/generated/l10n.dart';
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
  final language = S.current.bSpanish;

  @override
  Widget build(BuildContext context) {
    final texts = S.of(context);
    final horoscope = (date == 'today')
        ? ref.watch(dayliHoroscopeProvider(mySign, date, language))
        : ref.watch(monthlyHoroscopeProvider(mySign, date, language));
    // final horoscope1 = ref.watch(monthlyHoroscopeProvider(mySign, date));
    final isDarkmode = ref.watch(darkModeProvider);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            texts.tHoroscope,
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
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                    height: 150,
                    width: MediaQuery.of(context).size.width,
                    child: CustomPaint(
                        painter: _CustomSign(isDark: isDarkmode),
                        child: isDarkmode
                            ? Image.asset('assets/banner/${mySign}_dark.png')
                            : Image.asset('assets/banner/$mySign.png'))),
              ),
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
                    child: Text(
                      texts.mToday,

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
                        date = 'monthly';
                        isSelected = false;
                      });
                    },
                    child: Text(
                      texts.mMonth,

                      // selectionColor: Colors.blue,
                    ),
                  ),
                ],
              )),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    child: horoscope.when(
                      data: (data) => _HoroscopeText(data: data),
                      loading: () =>
                          const Center(child: CircularProgressIndicator()),
                      error: (Object error, StackTrace stackTrace) =>
                          Text('$error'),
                    ),
                  ),
                ),
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

class _CustomSign extends CustomPainter {
  bool isDark;
  _CustomSign({required this.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    paint.color = isDark ? const Color.fromRGBO(14, 11, 42, 1) : Colors.white60;

    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 5;

    Path path = Path();

    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.quadraticBezierTo(
        size.width, size.height * 0.5, size.width * 0.85, size.height * 0.5);

    path.quadraticBezierTo(
        size.width * 0.8, size.height * 0.95, size.width * 0.5, size.height);
    path.quadraticBezierTo(size.width * 0.2, size.height * 0.95,
        size.width * 0.15, size.height * 0.5);

    path.quadraticBezierTo(0, size.height * 0.5, 0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
