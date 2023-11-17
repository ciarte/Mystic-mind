import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'language_config_provider.g.dart';

@riverpod
class CurrentLanguage extends _$CurrentLanguage {
  var lenguage = 'es';

  @override
  String build() => 'es';

  void changeLanguage(newLanguage) {
    state = newLanguage;
    lenguage = newLanguage;
  }
}
