import 'package:horoscope_app/db/entities/message.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'chat_provider.g.dart';

@riverpod
class ChatOracle extends _$ChatOracle {
  @override
  Message build() {
    return Message(fromWho: FromWho.oracle, text: 'Bienvenido de nuevo');
  }
}
