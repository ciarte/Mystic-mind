import 'package:horoscope_app/config/plugins/shared_preferences_pluggin.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'alias_provider.g.dart';

@riverpod
class Alias extends _$Alias {
  @override
  String build() => '';

  void newAlias(userAlias) {
    state = userAlias;
    SharedPreferencePluggin.setString('alias', userAlias);
  }
}
