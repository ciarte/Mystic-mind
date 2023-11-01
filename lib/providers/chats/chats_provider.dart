import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:horoscope_app/infrastructure/datasources/oracle_answer.dart';
import 'package:horoscope_app/infrastructure/datasources/translate_request.dart';
import 'package:horoscope_app/providers/providers.dart';

final chatsProvider = ChangeNotifierProvider((ref) => ChatOracle());

final getYesNoAnswerProvider = Provider((ref) => GetYesNoAnswer());
final translateProvider = Provider((ref) => TranslationService());
final currentLanguageProvider = Provider<CurrentLanguage>((ref) {
  return CurrentLanguage();
});