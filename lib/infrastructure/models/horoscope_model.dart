import 'package:horoscope_app/db/entities/horoscope_entity.dart';

class HoroscopeModel {
  // final String date;
  final String horoscope;

  HoroscopeModel({
    // required this.date,
    required this.horoscope,
  });

  factory HoroscopeModel.fromJson(Map<String, dynamic> json) => HoroscopeModel(
        // date: json["date"],
        // json["month"],
        horoscope: json["horoscope"],
      );

  Map<String, dynamic> toJson() => {
        "horoscope": horoscope,
      };

  Horoscope toHoroscopeEntity() => Horoscope(horoscopeData: horoscope);
}
