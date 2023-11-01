import 'package:dio/dio.dart';

class TranslationService {
  static final _dio = Dio();

  Future<String> translateText(String text) async {
    const url = 'https://text-translator2.p.rapidapi.com/translate';
    final headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'X-RapidAPI-Key': '7936effcfdmshb2538a47f878063p11d72ajsn1f40009199f3',
      'X-RapidAPI-Host': 'text-translator2.p.rapidapi.com'
    };
    final body = {
      'text': text,
      'source_language': 'en',
      'target_language': 'es',
    };
    // const url =
    //     'https://google-translate1.p.rapidapi.com/language/translate/v2';
    // final headers = {
    //   'content-type': 'application/x-www-form-urlencoded',
    //   'Accept-Encoding': 'application/gzip',
    //   'X-RapidAPI-Key': '7936effcfdmshb2538a47f878063p11d72ajsn1f40009199f3',
    //   'X-RapidAPI-Host': 'google-translate1.p.rapidapi.com'
    // };

    // final body = {
    //   'q': text,
    //   'target': 'es',
    //   'source': 'en',
    // };

    try {
      final response =
          await _dio.post(url, options: Options(headers: headers), data: body);

      print(response.data);
      if (response.statusCode == 200) {
        print(response.data['data']['translatedText']);
        return response.data['data']['translatedText'];
      } else {
        return text;
      }
    } catch (e) {
      return 'Error en la traduccion, intenta en otro idioma por ahora';
    }
  }
}
