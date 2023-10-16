import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'language_config_provider.g.dart';

enum Language { en, es, fr }

@riverpod
class CurrentLanguage extends _$CurrentLanguage {
  @override
  Language build() => Language.en;

  void changeLanguage(Language newLanguage) {
    state = newLanguage;
  }
}
