import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:horoscope_app/db/entities/entities.dart';
import 'package:horoscope_app/providers/chats/chats_provider.dart';
import 'package:horoscope_app/widgets/widgets.dart';

class OracleScreen extends StatelessWidget {
  const OracleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Oracle'),
        ),
        body: Container(
          // decoration: const BoxDecoration(
          //   image: DecorationImage(
          //       image: AssetImage('assets/chat.jpg'),
          //       fit: BoxFit.cover,
          //       opacity: 0.15),
          // ),
          child: const _ChatView(),
        ));
  }
}

class _ChatView extends ConsumerWidget {
  const _ChatView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatProvider = ref.watch(chatsProvider);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(children: [
          Expanded(
            child: ListView.builder(
              controller: chatProvider.chatScrollController,
              itemCount: chatProvider.messageList.length,
              itemBuilder: (BuildContext context, int index) {
                final message = chatProvider.messageList[index];

                final scale =
                    index == chatProvider.messageList.length - 1 ? 1.0 : 0.85;

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
    );
  }
}
