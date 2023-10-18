import 'package:flutter/material.dart';

class SessionButton extends StatelessWidget {
  const SessionButton({super.key, required this.session, required this.icon});
  final String session;
  final dynamic icon;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      height: height * 0.06,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Colors.white,
      ),
      child: FilledButton.icon(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white),
          ),
          onPressed: () {},
          icon: icon,
          label: Text(session, style: const TextStyle(color: Colors.black))),
    );
  }
}
