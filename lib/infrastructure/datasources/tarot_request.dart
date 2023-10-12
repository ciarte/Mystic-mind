import 'package:dio/dio.dart';
import 'package:horoscope_app/db/entities/entities.dart';
import 'package:horoscope_app/infrastructure/mappers/tarot_mapper.dart';
import 'package:horoscope_app/infrastructure/models/tarot/tarot_response.dart';

class TarotRequest {
  static Future<List<Tarot>> getTarot() async {
    final dio = Dio();

    final response = await dio.get(
      'https://horoscope-astrology.p.rapidapi.com/tarotcard',
      options: Options(
        headers: {
          'X-RapidAPI-Key':
              '77f832489cmshf5a062538649267p18ba2djsnbdff362829e2',
          'X-RapidAPI-Host': 'horoscope-astrology.p.rapidapi.com',
        },
      ),
    );

    print(response.data);
    
    final tarotDbResponse = TarotModel.fromJson(response.data);
    final List<Tarot> tarot = tarotDbResponse.res
        .map((tarotDb) => TarotMapper.tarotToEntity(tarotDb))
        .toList();
    print(tarot);

    return tarot;
  }
}
