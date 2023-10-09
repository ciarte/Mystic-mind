import 'package:flutter/material.dart';
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
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/chat.jpg'),
                fit: BoxFit.cover,
                opacity: 0.15),
          ),
          child: const _ChatView(),
        ));
  }
}

class _ChatView extends StatelessWidget {
  const _ChatView();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(children: [
          Expanded(
              child: ListView.builder(
            itemCount: 1,
            itemBuilder: (BuildContext context, int index) {
              return
                  // (index % 2 == 0)
                  //     ? const MyMessageBubble()
                  // :
                  const OracleMessageBubble();
            },
          )),
          const MessageFieldBox(),
        ]),
      ),
    );
  }
}
