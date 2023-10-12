import 'package:dio/dio.dart';
import 'package:horoscope_app/db/entities/entities.dart';

class GetYesNoAnswer {
  final _dio = Dio();

  Future<Message> getAnswer() async {
    final response = await _dio.get('https://yesno.wtf/api');

    final yesNoModel = OracleAnswerModel.fromJsonMap(response.data);

    return yesNoModel.toMessageEntity();
  }
}
