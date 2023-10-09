import 'package:flutter/material.dart';
import 'package:horoscope_app/db/entities/entities.dart';

class MyMessageBubble extends StatelessWidget {
  final Message message;
  const MyMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
      Container(
        decoration: BoxDecoration(
            color: color.primary, borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child:
              Text(message.text, style: const TextStyle(color: Colors.white)),
        ),
      ),
      const SizedBox(
        height: 8,
      )
    ]);
  }
}
