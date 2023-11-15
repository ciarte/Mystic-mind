import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import 'package:horoscope_app/generated/l10n.dart';
import 'package:horoscope_app/providers/providers.dart';
import 'package:horoscope_app/screens/screens.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HoroscopeScreen extends ConsumerStatefulWidget {
  const HoroscopeScreen({super.key});

  @override
  HoroscopeScreenState createState() => HoroscopeScreenState();
}

class HoroscopeScreenState extends ConsumerState<HoroscopeScreen> {
  String mySign = '';
  String date = 'today';
  bool isSelected = true;
  final language = S.current.bSpanish;

  void _saveSignToSharedPreferences(String sign) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedSign', sign);
    setState(() {
      mySign = sign;
    });
  }

  void _loadSignFromSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final savedSign = prefs.getString('selectedSign');
    if (savedSign != null) {
      setState(() {
        mySign = savedSign;
      });
    }
  }

  void printLocalStorage() async {
    final prefs = await SharedPreferences.getInstance();
    final keys = prefs.getKeys();
    for (String key in keys) {
      print('$key: ${prefs.get(key)}');
    }
  }

  @override
  void initState() {
    super.initState();
    _loadSignFromSharedPreferences();
  }

  @override
  Widget build(BuildContext context) {
    final texts = S.of(context);
    final horoscope = mySign.isNotEmpty
        ? (date == 'today')
            ? ref.watch(dayliHoroscopeProvider(mySign, date, language))
            : ref.watch(monthlyHoroscopeProvider(mySign, date, language))
        : AsyncValue.error('No sign selected', StackTrace.current);

    final isDarkmode = ref.watch(darkModeProvider);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            texts.tHoroscope,
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              tooltip: 'Cambio de signo',
              onPressed: () async {
                final newSign = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SignSelectionScreen()));
                if (newSign != null) {
                  setState(() {
                    mySign = newSign;
                    _saveSignToSharedPreferences(newSign);
                  });
                }
              },
            ),
          ],
        ),
        body: mySign.isEmpty
            ? SignSelectionScreen()
            // setState(() {
            //   mySign = sign;
            //   _saveSignToSharedPreferences(sign);
            // });

            : Container(
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
                                  ? Image.asset(
                                      'assets/banner/${mySign}_dark.png')
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
                            printLocalStorage();
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
                              printLocalStorage();
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
                            loading: () => const Center(
                                child: CircularProgressIndicator()),
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
