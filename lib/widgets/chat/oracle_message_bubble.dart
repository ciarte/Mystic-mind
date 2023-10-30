import 'package:flutter/material.dart';
import 'package:horoscope_app/db/entities/entities.dart';

class OracleMessageBubble extends StatelessWidget {
  final Message message;

  const OracleMessageBubble({super.key, required this.message});
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(message.text,
                  style: const TextStyle(
                    // color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          _ImageBubble(message.imageUrl != null
              ? (message.imageUrl!)
              : 'https://pm1.narvii.com/7083/d8bad77dd802352b0587362104062c65a25e9392r1-798-420v2_128.jpg'),
          const SizedBox(
            height: 20,
          ),
        ]);
  }
}

class _ImageBubble extends StatelessWidget {
  final String imageUrl;

  const _ImageBubble(this.imageUrl);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
          width: 6, // Ancho del borde blanco
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            imageUrl,
            width: size.width * 0.7,
            height: 250,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;

              return Container(
                alignment: AlignmentDirectional.center,
                width: size.width * 0.7,
                height: 250,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: const Text('Leyendo los astros...'),
              );
            },
          )),
    );
  }
}
