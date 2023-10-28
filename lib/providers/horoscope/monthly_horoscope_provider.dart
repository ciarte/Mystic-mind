import 'package:horoscope_app/infrastructure/datasources/horoscope_request.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../db/entities/horoscope_entity.dart';

part 'monthly_horoscope_provider.g.dart';

@riverpod
Future<Horoscope> monthlyHoroscope(
    MonthlyHoroscopeRef ref, String sign, String date) async {
  final horoscope = await HoroscopeRequest.getMonthlyHoroscope(sign, date);
  return horoscope;
}
