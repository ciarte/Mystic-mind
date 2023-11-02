import 'package:horoscope_app/infrastructure/datasources/horoscope_request.dart';
import 'package:horoscope_app/infrastructure/datasources/translate_request.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'phrase_provider.g.dart';

@riverpod
Future<String> dayliPhrase(DayliPhraseRef ref, String language) async {
  final phrase = await HoroscopeRequest.getPhrase();
  if (language == 'Español') {
    final desc = await TranslationService().translateText(phrase);

    return desc;
  } else {
    return phrase;
  }
}
