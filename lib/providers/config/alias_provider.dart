import 'package:horoscope_app/services/local_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'alias_provider.g.dart';

@riverpod
class Alias extends _$Alias {
  @override
  String build() => '';

  void newAlias(userAlias) {
    state = userAlias;
    LocalStorage.prefs.setString('alias', userAlias);
  }
}
