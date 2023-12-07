import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:horoscope_app/providers/providers.dart';

class AdsRewardScreen extends ConsumerWidget {
  const AdsRewardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final adRewardedAsync = ref.watch(adRewardProvider);
    final adPoints = ref.watch(adPointsProvider);

    ref.listen(adRewardProvider, (previous, next) {
      if (!next.hasValue) return;
      if (next.value == null) return;

      next.value!.show(
        onUserEarnedReward: (ad, reward) =>
            ref.read(adPointsProvider.notifier).update((state) => state + 10),
      );
    });

    if (adRewardedAsync.isLoading) {
      return const Scaffold(
          body: Center(
        child: Text('cargando anuncio'),
      ));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ad Reward'),
      ),
      body: Center(
        child: Text('Puntos actuales: $adPoints'),
      ),
    );
  }
}
