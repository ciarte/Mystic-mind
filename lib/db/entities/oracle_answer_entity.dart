import 'package:horoscope_app/db/entities/message_entity.dart';

class OracleAnswerModel {
  OracleAnswerModel({
    required this.answer,
    required this.forced,
    required this.image,
  });

  final String answer;
  final bool forced;
  final String image;

  factory OracleAnswerModel.fromJsonMap(Map<String, dynamic> json) =>
      OracleAnswerModel(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "answer": answer,
        "forced": forced,
        "image": image,
      };

  Message toMessageEntity() => Message(
      text: answer == 'yes' ? 'Si' : 'No',
      fromWho: FromWho.oracle,
      imageUrl: image);
}
