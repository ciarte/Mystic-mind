import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:horoscope_app/providers/chats/chat_provider.dart';

class OracleMessageBubble extends ConsumerWidget {
  const OracleMessageBubble({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = Theme.of(context).colorScheme;
    final oracleMessage = ref.watch(chatOracleProvider);

    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 80,
          ),
          Container(
            decoration: BoxDecoration(
                color: color.secondary,
                borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(oracleMessage.text,
                  style: const TextStyle(color: Colors.white)),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          _ImageBubble(),
          const SizedBox(
            height: 8,
          ),
        ]);
  }
}
//   @override
//   Widget build(BuildContext context) {
//     final color = Theme.of(context).colorScheme;

//     return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//       Container(
//         decoration: BoxDecoration(
//             color: color.secondary, borderRadius: BorderRadius.circular(15)),
//         child: const Padding(
//           padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//           child:
//               Text('respuesta si / no ', style: TextStyle(color: Colors.white)),
//         ),
//       ),
//       const SizedBox(
//         height: 8,
//       ),
//       _ImageBubble(),
//       const SizedBox(
//         height: 8,
//       ),
//     ]);
//   }
// }
class _ImageBubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.network(
          "https://imagenes.20minutos.es/files/image_654_369/files/fp/uploads/imagenes/2020/06/23/chi.r_d.358-326-9188.jpeg",
          width: size.width * 0.7,
          height: 250,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Container(
              alignment: AlignmentDirectional.bottomCenter,
              width: size.width * 0.7,
              height: 250,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: const Text('Leyendo los astros...'),
            );
          },
        ));
  }
}
