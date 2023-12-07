import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:horoscope_app/providers/ads/admob_provider.dart';

class AdsFullScreen extends ConsumerWidget {
  const AdsFullScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final interstitialAdAsync = ref.watch(adInterstitialProvider);

    ref.listen(adInterstitialProvider, (previous, next) {
      if (!next.hasValue) return;
      if (next.value == null) return;

      next.value!.show();
    });

    if (interstitialAdAsync.isLoading) {
      return const Scaffold(
        body: Center(child: Text('Cargando...')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ad full Screen'),
      ),
      body: const Center(
        child: Text('Ya puedes volver'),
      ),
    );
  }
}
