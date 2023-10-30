import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'image_tarot_card_provider.g.dart';

@riverpod
class ImageTarotStart extends _$ImageTarotStart {
  @override
  String build() => 'dark';

  void changeImageTarot(String image) {
    state = image;
  }
}
