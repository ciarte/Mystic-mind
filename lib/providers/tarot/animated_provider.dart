import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'animated_provider.g.dart';

@riverpod
class AnimatedStart extends _$AnimatedStart {
  @override
  String build() => 'Card Description Not Available';

  void changeTarot(String description) {
    state = description;
  }
}
