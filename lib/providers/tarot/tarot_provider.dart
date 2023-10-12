import 'package:horoscope_app/db/entities/entities.dart';
import 'package:horoscope_app/infrastructure/datasources/tarot_request.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tarot_provider.g.dart';

@riverpod
Future<Tarot> tarotCards(TarotCardsRef ref) async {
  final tarot = await TarotRequest.getTarot();
  return tarot[0];
}
