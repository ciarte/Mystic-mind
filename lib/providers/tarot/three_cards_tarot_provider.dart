import 'package:horoscope_app/db/entities/entities.dart';
import 'package:horoscope_app/infrastructure/datasources/tarot_request.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'three_cards_tarot_provider.g.dart';

@riverpod
Future<List<Tarot>> tarotThreeCards(TarotThreeCardsRef ref) async {
  final tarot = await TarotRequest.getTarot();
  return tarot;
}
