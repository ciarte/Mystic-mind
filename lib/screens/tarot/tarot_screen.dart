import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:horoscope_app/db/entities/entities.dart';
import 'package:horoscope_app/providers/providers.dart';

class TarotScreen extends ConsumerStatefulWidget {
  const TarotScreen({super.key});

  @override
  TarotScreenState createState() => TarotScreenState();
}

class TarotScreenState extends ConsumerState<TarotScreen> {
  @override
  Widget build(BuildContext context) {
    final tarot = ref.watch(tarotCardsProvider);

    return Scaffold(
        appBar: AppBar(
          title: const Text('tu tarot'),
        ),
        body: Column(
          children: [
            tarot.when(
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
  final data;
  const _TarotText({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(data.name),
        AnimatedTextKit(isRepeatingAnimation: false, animatedTexts: [
          TypewriterAnimatedText((data.desc),
              speed: const Duration(milliseconds: 60))
        ]),
      ],
    );
  }
}
