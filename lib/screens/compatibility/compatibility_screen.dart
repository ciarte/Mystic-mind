import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:horoscope_app/generated/l10n.dart';

class CompatibilityScreen extends StatelessWidget {
  const CompatibilityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final texts = S.of(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(texts.tCompatibility),
        ),
        body: Column(children: [
          SizedBox(
              height: 250,
              width: double.infinity,
              child: Swiper(
                  loop: false,
                  scale: 0.9,
                  viewportFraction: 0.2,
                  layout: SwiperLayout.CUSTOM,
                  customLayoutOption:
                      CustomLayoutOption(startIndex: -1, stateCount: 3)
                        ..addRotate([-0.3, 0.0, 0.3])
                        ..addTranslate([
                          const Offset(-180.0, -15.0),
                          const Offset(0.0, 0.0),
                          const Offset(180.0, -15.0)
                        ]),
                  itemWidth: 100.0,
                  itemHeight: 250.0,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return _Slide(
                      movie: Image.asset('assets/tarot_cards/dark.png'),
                    );
                  }))
        ]));
  }
}

class _Slide extends StatelessWidget {
  final movie;
  const _Slide({required this.movie});

  @override
  Widget build(BuildContext context) {
    final decoration = BoxDecoration(
      borderRadius: BorderRadius.circular(20),
    );

    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: DecoratedBox(
          decoration: decoration,
          child:
              ClipRRect(borderRadius: BorderRadius.circular(20), child: movie)),
    );
  }
}
