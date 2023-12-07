import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:horoscope_app/config/config.dart';

final adBannerProvider = FutureProvider<BannerAd>((ref) async {
//Validar si se muestra o no los Ads

  final ad = await AdmobPlugin.loadBannerAd();
  return ad;
});
