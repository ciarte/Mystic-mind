import 'package:horoscope_app/infrastructure/models/tarot/tarot_db.dart';

class TarotModel {
  final List<TarotDB> res;

  TarotModel({
    required this.res,
  });

  factory TarotModel.fromJson(Map<String, dynamic> json) => TarotModel(
        res: List<TarotDB>.from(json["res"].map((x) => TarotDB.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "res": List<dynamic>.from(res.map((x) => x.toJson())),
      };
}
