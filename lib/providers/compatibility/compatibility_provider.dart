import 'package:horoscope_app/infrastructure/datasources/horoscope_request.dart';
import 'package:horoscope_app/infrastructure/datasources/translate_request.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'compatibility_provider.g.dart';

@riverpod
Future<String> compatibility(
    CompatibilityRef ref, String sign1, String sign2, String language) async {
  final match = await HoroscopeRequest.getCompatibility(sign1, sign2);
  if (language == 'Español') {
    final desc = await TranslationService().translateText(match);

    return desc;
  } else {
    return match;
  }
}
