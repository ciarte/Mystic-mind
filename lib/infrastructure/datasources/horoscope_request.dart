import 'package:dio/dio.dart';
import 'package:horoscope_app/db/entities/horoscope_entity.dart';
import 'package:horoscope_app/infrastructure/models/horoscope_model.dart';

class HoroscopeRequest {
  static Future<Horoscope> getHoroscope(sign) async {
    final dio = Dio();

    final response = await dio.get(
      'https://horoscope-astrology.p.rapidapi.com/horoscope?day=today&sunsign=$sign',
      options: Options(
        headers: {
          'X-RapidAPI-Key':
              '77f832489cmshf5a062538649267p18ba2djsnbdff362829e2',
          'X-RapidAPI-Host': 'horoscope-astrology.p.rapidapi.com',
        },
      ),
    );

    final dayliHoroscope = HoroscopeModel.fromJson(response.data);

    return dayliHoroscope.toHoroscopeEntity();
  }
}
