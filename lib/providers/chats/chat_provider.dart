import 'package:flutter/material.dart';
import 'package:horoscope_app/db/entities/message_entity.dart';
import 'package:horoscope_app/generated/l10n.dart';
import 'package:horoscope_app/infrastructure/datasources/oracle_answer.dart';
import 'package:horoscope_app/infrastructure/datasources/translate_request.dart';
import 'package:horoscope_app/providers/config/language_config_provider.dart';

class ChatOracle extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final translateProvider = TranslationService();
  final getYesNoAnswer = GetYesNoAnswer();
  final selectedLanguage = CurrentLanguage();

  List<Message> messageList = [
    Message(
        fromWho: FromWho.oracle,
        text: S.current.mOracle,
        imageUrl: 'assets/oracle.png'),
  ];

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 200));
    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  Future<void> oracleReply() async {
    final oracleMessage = await getYesNoAnswer.getAnswer();

    messageList.add(oracleMessage);

    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;

    final newMessage = Message(text: text, fromWho: FromWho.mine);
    messageList.add(newMessage);
    if (text.endsWith('?')) {
      oracleReply();
      moveScrollToBottom();
    }

    notifyListeners();
  }
}
