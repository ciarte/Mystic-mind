import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:horoscope_app/generated/l10n.dart';
import 'package:horoscope_app/providers/providers.dart';
import 'package:horoscope_app/screens/screens.dart';
import 'package:horoscope_app/widgets/widgets.dart';

class CompatibilityScreen extends ConsumerStatefulWidget {
  const CompatibilityScreen({super.key});

  @override
  CompatibilityScreenState createState() => CompatibilityScreenState();
}

class CompatibilityScreenState extends ConsumerState<CompatibilityScreen> {
  late int firstSelectedIndex;
  late int secondSelectedIndex;
  late String firstSelectedZodiac = 'aquarius';
  late String secondSelectedZodiac = 'aquarius';
  final SwiperController _firstSwiperController = SwiperController();
  final SwiperController _secondSwiperController = SwiperController();

  @override
  Widget build(BuildContext context) {
    final texts = S.of(context);
    final isDarkmode = ref.watch(darkModeProvider);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(texts.tCompatibility),
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
          child: Column(children: [
            const SizedBox(height: 50),
            SizedBox(
                height: 200,
                width: double.infinity,
                child: Swiper(
                    controller: _firstSwiperController,
                    onIndexChanged: (index) {
                      setState(() {
                        firstSelectedIndex = index;
                        firstSelectedZodiac =
                            getAppMenuItems(context)[index].location;
                      });
                    },
                    viewportFraction: 0.5,
                    scale: 0.5,
                    itemWidth: 150.0,
                    itemHeight: 250.0,
                    itemCount: getAppMenuItems(context).length,
                    itemBuilder: (context, index) {
                      final zodiac = getAppMenuItems(context)[index];
                      return _Slide(
                        movie: isDarkmode ? zodiac.imageDark : zodiac.image,
                      );
                    })),
            const Icon(
              Icons.add_rounded,
              size: 100,
              color: Color.fromRGBO(167, 12, 53, 1),
            ),
            SizedBox(
                height: 200,
                width: double.infinity,
                child: Swiper(
                    controller: _secondSwiperController,
                    onIndexChanged: (index) {
                      setState(() {
                        secondSelectedIndex = index;
                        secondSelectedZodiac =
                            getAppMenuItems(context)[index].location;
                      });
                    },
                    // loop: false,
                    viewportFraction: 0.5,
                    scale: 0.5,
                    itemWidth: 150.0,
                    itemHeight: 250.0,
                    itemCount: getAppMenuItems(context).length,
                    itemBuilder: (context, index) {
                      final zodiac = getAppMenuItems(context)[index];
                      return _Slide(
                        movie: isDarkmode ? zodiac.imageDark : zodiac.image,
                      );
                    })),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 14.0, vertical: 50),
              child: LoginButton(
                  nameButton: 'Comparar',
                  onPressed: () {
                    print('$firstSelectedZodiac, $secondSelectedZodiac');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CompatibilityResult(
                          sign1: firstSelectedZodiac,
                          sign2: secondSelectedZodiac,
                        ),
                      ),
                    );
                  }),
            ),
          ]),
        ),
      ]),
    ));
  }
}

class _Slide extends StatelessWidget {
  final String movie;

  const _Slide({required this.movie});

  @override
  Widget build(BuildContext context) {
    final decoration = BoxDecoration(
      borderRadius: BorderRadius.circular(20),
    );

    return DecoratedBox(
      decoration: decoration,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(20), child: Image.asset(movie)),
    );
  }
}

class ZodiacItem {
  final String location;
  final String image;
  final String imageDark;

  const ZodiacItem(
      {required this.location, required this.image, required this.imageDark});
}

List<ZodiacItem> getAppMenuItems(BuildContext context) {
  return <ZodiacItem>[
    const ZodiacItem(
      location: 'aquarius',
      image: 'assets/matchs_cards/aquarius.png',
      imageDark: 'assets/matchs_cards/aquarius_dark.png',
    ),
    const ZodiacItem(
      location: 'aries',
      image: 'assets/matchs_cards/aries.png',
      imageDark: 'assets/matchs_cards/aries_dark.png',
    ),
    const ZodiacItem(
      location: 'cancer',
      image: 'assets/matchs_cards/cancer.png',
      imageDark: 'assets/matchs_cards/cancer_dark.png',
    ),
    const ZodiacItem(
      location: 'capricorn',
      image: 'assets/matchs_cards/capricorn.png',
      imageDark: 'assets/matchs_cards/capricorn_dark.png',
    ),
    const ZodiacItem(
      location: 'geminis',
      image: 'assets/matchs_cards/gemini.png',
      imageDark: 'assets/matchs_cards/gemini_dark.png',
    ),
    const ZodiacItem(
      location: 'leo',
      image: 'assets/matchs_cards/leo.png',
      imageDark: 'assets/matchs_cards/leo_dark.png',
    ),
    const ZodiacItem(
      location: 'libra',
      image: 'assets/matchs_cards/libra.png',
      imageDark: 'assets/matchs_cards/libra_dark.png',
    ),
    const ZodiacItem(
      location: 'pisces',
      image: 'assets/matchs_cards/pisces.png',
      imageDark: 'assets/matchs_cards/pisces_dark.png',
    ),
    const ZodiacItem(
      location: 'sagittarius',
      image: 'assets/matchs_cards/sagittarius.png',
      imageDark: 'assets/matchs_cards/sagittarius_dark.png',
    ),
    const ZodiacItem(
      location: 'scorpio',
      image: 'assets/matchs_cards/scorpio.png',
      imageDark: 'assets/matchs_cards/scorpio_dark.png',
    ),
    const ZodiacItem(
      location: 'taurus',
      image: 'assets/matchs_cards/taurus.png',
      imageDark: 'assets/matchs_cards/taurus_dark.png',
    ),
    const ZodiacItem(
      location: 'virgo',
      image: 'assets/matchs_cards/virgo.png',
      imageDark: 'assets/matchs_cards/virgo_dark.png',
    ),
  ];
}
