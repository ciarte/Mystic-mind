import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key, this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
        height: height * 0.06,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: const Color.fromRGBO(167, 12, 53, 1),
        ),
        child: MaterialButton(
          onPressed: onPressed,
          child: const Text('Iniciar sesion',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              )),
        ));
  }
}
