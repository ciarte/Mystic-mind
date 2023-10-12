import 'package:horoscope_app/db/entities/entities.dart';
import 'package:horoscope_app/infrastructure/models/tarot/tarot_db.dart';

class TarotMapper {
  static Tarot tarotToEntity(TarotDB tarotDb) => Tarot(
      cbdDesc: tarotDb.cbdDesc,
      desc: tarotDb.desc,
      image: tarotDb.image,
      name: tarotDb.name,
      rdesc: tarotDb.rdesc,
      sequence: tarotDb.sequence);
}
