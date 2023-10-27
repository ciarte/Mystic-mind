import 'package:flutter/material.dart';
import 'package:horoscope_app/db/entities/message_entity.dart';
import 'package:horoscope_app/infrastructure/datasources/oracle_answer.dart';

class ChatOracle extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final getYesNoAnswer = GetYesNoAnswer();
  List<Message> messageList = [
    Message(
      fromWho: FromWho.oracle,
      text:
          '"Escribe aquí tu consulta, recuerda terminar tu pregunta con “?” Este oráculo solo da respuestas de “sí” y “no”"',
      //TODO agregar imagen
    ),
  ];

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 200),
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
