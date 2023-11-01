import 'package:horoscope_app/infrastructure/datasources/horoscope_request.dart';
import 'package:horoscope_app/infrastructure/datasources/translate_request.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../db/entities/horoscope_entity.dart';

part 'dayli_horoscope_provider.g.dart';

@riverpod
Future<Horoscope> dayliHoroscope(
    DayliHoroscopeRef ref, String sign, String date, String language) async {
  final horoscope = await HoroscopeRequest.getHoroscope(sign, date);
  if (language == 'Español') {
    final desc =
        await TranslationService().translateText(horoscope.horoscopeData);

    return Horoscope(horoscopeData: desc);
  } else {
    return horoscope;
  }
}
