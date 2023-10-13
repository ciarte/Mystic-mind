import 'package:horoscope_app/db/entities/entities.dart';
import 'package:horoscope_app/infrastructure/models/tarot/tarot_db.dart';

class TarotMapper {
  static Tarot tarotToEntity(TarotDB tarotDb) => Tarot(
      cbdDesc: tarotDb.cbdDesc,
      desc: tarotDb.desc,
      image: tarotDb.image != ''
          ? 'https://horoscope-astrology.p.rapidapi.com/${tarotDb.image}'
          : 'https://www.shutterstock.com/image-vector/astronaut-lying-on-moon-illustration-260nw-2019942284.jpg',
      name: tarotDb.name,
      rdesc: tarotDb.rdesc,
      sequence: tarotDb.sequence);
}
