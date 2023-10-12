import 'package:horoscope_app/infrastructure/datasources/horoscope_request.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../db/entities/horoscope_entity.dart';

part 'dayli_horoscope_provider.g.dart';

@riverpod
Future<Horoscope> dayliHoroscope(DayliHoroscopeRef ref, String sign) async {
  final horoscope = await HoroscopeRequest.getHoroscope(sign);
  return horoscope;
}
