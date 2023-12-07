import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:horoscope_app/config/config.dart';

final adBannerProvider = FutureProvider<BannerAd>((ref) async {
//Validar si se muestra o no los Ads

  final ad = await AdmobPlugin.loadBannerAd();
  return ad;
});

final adInterstitialProvider =
    FutureProvider.autoDispose<InterstitialAd>((ref) async {
// Validar si se muestra o no los Ads

  final ad = await AdmobPlugin.loadInterstitialAd();
  return ad;
});

final adRewardProvider = FutureProvider.autoDispose<RewardedAd>((ref) async {
//Validar si se muestra o no los Ads

  final ad = await AdmobPlugin.loadRewardedAd();
  return ad;
});
