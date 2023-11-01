import 'package:horoscope_app/infrastructure/datasources/translate_request.dart';
import 'package:horoscope_app/providers/config/language_config_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'animated_provider.g.dart';

@riverpod
class AnimatedStart extends _$AnimatedStart {
  @override
  String build() => 'Card Description Not Available';

  Future<String> changeTarot({required String data, required language}) async {
    if (language == 'Español') {
      final desc = await TranslationService().translateText(data);
      state = desc;
      return desc;
    } else {
      state = data;
      return data;
    }
  }
}
