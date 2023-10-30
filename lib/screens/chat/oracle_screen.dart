import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:horoscope_app/db/entities/entities.dart';
import 'package:horoscope_app/providers/chats/chats_provider.dart';
import 'package:horoscope_app/providers/providers.dart';
import 'package:horoscope_app/widgets/widgets.dart';

class OracleScreen extends StatelessWidget {
  const OracleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const _ChatView();
  }
}

class _ChatView extends ConsumerWidget {
  const _ChatView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatProvider = ref.watch(chatsProvider);
    final isDarkmode = ref.watch(darkModeProvider);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: !isDarkmode
              ? const Color.fromRGBO(254, 211, 170, 1)
              : const Color.fromRGBO(23, 5, 66, 1),
          title: const Text(
            'Oraculo',
          ),
        ),
        body: Container(
          decoration: !isDarkmode
              ? const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/chat_pattern.png'),
                      alignment: Alignment.topRight,
                      repeat: ImageRepeat.repeat,
                      centerSlice: Rect.zero,
                      colorFilter: ColorFilter.linearToSrgbGamma(),
                      opacity: 0.5),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      tileMode: TileMode.decal,
                      stops: [
                        0.1,
                        0.6
                      ],
                      colors: [
                        Color.fromRGBO(254, 211, 170, 1),
                        Color.fromRGBO(191, 141, 187, 1),
                      ]))
              : const BoxDecoration(
                  image: DecorationImage(
                      alignment: Alignment.topRight,
                      repeat: ImageRepeat.repeat,
                      image: AssetImage('assets/chat_pattern.png'),
                      // fit: BoxFit.cover,
                      colorFilter: ColorFilter.linearToSrgbGamma(),
                      opacity: 0.5),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      tileMode: TileMode.decal,
                      stops: [
                        0.1,
                        0.6
                      ],
                      colors: [
                        Color.fromRGBO(23, 5, 66, 1),
                        Color.fromRGBO(155, 85, 148, 1),
                      ])),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(children: [
                Expanded(
                  child: ListView.builder(
                    controller: chatProvider.chatScrollController,
                    itemCount: chatProvider.messageList.length,
                    itemBuilder: (BuildContext context, int index) {
                      final message = chatProvider.messageList[index];

                      final scale = index == chatProvider.messageList.length - 1
                          ? 1.0
                          : 0.85;

                      return Transform.scale(
                        scale: scale,
                        child: (message.fromWho == FromWho.oracle)
                            ? OracleMessageBubble(
                                message: message,
                              )
                            : MyMessageBubble(
                                message: message,
                              ),
                      );
                    },
                  ),
                ),
                MessageFieldBox(onValue: chatProvider.sendMessage),
              ]),
            ),
          ),
        ));
  }
}
