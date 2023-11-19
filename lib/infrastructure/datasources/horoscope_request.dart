import 'package:dio/dio.dart';
import 'package:horoscope_app/db/entities/horoscope_entity.dart';
import 'package:horoscope_app/infrastructure/models/horoscope_model.dart';

class HoroscopeRequest {
  static Future<Horoscope> getHoroscope(sign, date) async {
    final dio = Dio();

    final response = await dio.get(
        'https://horoscope-app-api.vercel.app/api/v1/get-horoscope/daily?sign=$sign&day=$date');

    final dayliHoroscope = HoroscopeModel.fromJson(response.data['data']);

    return dayliHoroscope.toHoroscopeEntity();
  }

  static Future<Horoscope> getMonthlyHoroscope(sign, date) async {
    final dio = Dio();

    final response = await dio.get(
        'https://horoscope-app-api.vercel.app/api/v1/get-horoscope/monthly?sign=$sign');
    final dayliHoroscope = HoroscopeModel.fromJson(response.data['data']);

    return dayliHoroscope.toHoroscopeEntity();
  }

  static Future<String> getPhrase() async {
    final dio = Dio();
    final response = await dio.get(
      'https://horoscope-astrology.p.rapidapi.com/dailyphrase',
      options: Options(
        headers: {
          'X-RapidAPI-Key':
              '77f832489cmshf5a062538649267p18ba2djsnbdff362829e2',
          'X-RapidAPI-Host': 'horoscope-astrology.p.rapidapi.com',
        },
      ),
    );

    final dayliHoroscope = (response.data['daily']);

    return dayliHoroscope;
  }

  static Future<String> getCompatibility(String sign1, String sign2) async {
    final dio = Dio();
    final response = await dio.get(
      'https://horoscope-astrology.p.rapidapi.com/affinity?sign1=$sign1&sign2=$sign2',
      options: Options(
        headers: {
          'X-RapidAPI-Key':
              '77f832489cmshf5a062538649267p18ba2djsnbdff362829e2',
          'X-RapidAPI-Host': 'horoscope-astrology.p.rapidapi.com',
        },
      ),
    );

    final dayliHoroscope = (response.data[0]['text']);

    return dayliHoroscope;
  }
}
