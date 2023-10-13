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

    return Scaffold(
        appBar: AppBar(
          title: const Text('tu tarot'),
        ),
        body: Column(
          children: [
            tarots.when(
              data: (data) => _TarotText(data: data),
              loading: () => const CircularProgressIndicator(),
              error: (Object error, StackTrace stackTrace) => Text('$error'),
            ),
            // TextFormField(
            //   onTap:,

            // )
          ],
        ),
        floatingActionButton:
            FloatingActionButton(onPressed: () => context.push('/oracle')));
  }
}

class _TarotText extends StatelessWidget {
  final List<Tarot> data;
  const _TarotText({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      width: double.infinity,
      child: Swiper(
          scale: 0.85,
          loop: false,
          viewportFraction: 0.8,
          // pagination: const SwiperPagination(
          //     margin: EdgeInsets.only(top: 0),
          //     builder: DotSwiperPaginationBuilder(
          //         // activeColor: colors.primary,
          //         // color: colors.secondary,
          //         space: 2.0)),
          itemCount: data.length,
          itemBuilder: (context, index) => _Slide(
                tarotCard: data[index],
              )),
    );
  }
}

class _Slide extends StatelessWidget {
  final Tarot tarotCard;
  const _Slide({required this.tarotCard});

  @override
  Widget build(BuildContext context) {
    final decoration = BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black87,
            blurRadius: 7,
            offset: Offset(0, 10),
          )
        ]);

    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: DecoratedBox(
          decoration: decoration,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Text(tarotCard.name),
            // Image.network(tarotCard.image, fit: BoxFit.cover,
            //     loadingBuilder: (context, child, loadingProgress) {
            //   if (loadingProgress != null) {
            //     return const DecoratedBox(
            //       decoration: BoxDecoration(color: Colors.black12),
            //     );
            //   }
            //   return FadeIn(child: child);
            // })
          )),
    );
  }
}
