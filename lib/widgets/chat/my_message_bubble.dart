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
          child: Text(message.text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              )),
        ),
      ),
      const SizedBox(
        height: 8,
      )
    ]);
  }
}

// class _CustomChat extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint();

//     paint.color = const Color.fromRGBO(167, 12, 56, 1);

//     paint.style = PaintingStyle.fill;
//     paint.strokeWidth = 2;

//     Path path = Path();

//     path.moveTo(size.width * 0.10, 0);
//     path.lineTo(size.width * 0.8, 0);
//     path.quadraticBezierTo(
//         size.width * 0.85, 0, size.height, size.height * 0.1);
//     path.lineTo(size.width * 0.9, size.height * 0.9);
//     path.quadraticBezierTo(
//         size.width * 0.8, size.height * 0.95, size.width, size.height);
//     path.lineTo(size.width * 0.10, size.height);
//     path.close();

//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }
