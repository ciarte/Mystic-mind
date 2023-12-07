import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:horoscope_app/providers/providers.dart';
import 'package:horoscope_app/screens/screens.dart';
import 'package:horoscope_app/widgets/widgets.dart';

class HomeNavigationBar extends ConsumerWidget {
  const HomeNavigationBar({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final adBannerAsync = ref.watch(adBannerProvider);
    return Scaffold(
      appBar: AppBar(
          title: const HeadingWidget(
        title: 'Mystic-Mind',
      )),
      drawer: NavigationDrawer(
          onDestinationSelected: (value) => {},
          children: const [
            UserConfigScreen(),
          ]),
      body: Column(
        children: [
          const Expanded(child: BackGroundWidget(widgetOptions: MenuView())),
          //adBanner
          adBannerAsync.when(
              data: (bannerAd) => SizedBox(
                  width: bannerAd.size.width.toDouble(),
                  height: bannerAd.size.height.toDouble(),
                  child: AdWidget(
                    ad: bannerAd,
                  )),
              error: (_, __) => const SizedBox(),
              loading: () => const SizedBox()),
        ],
      ),
    );
  }
}
