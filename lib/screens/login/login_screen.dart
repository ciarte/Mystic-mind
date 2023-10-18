import 'package:flutter/material.dart';
import 'package:horoscope_app/widgets/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Align(alignment: Alignment.center, child: LoginPage()));
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    bool rememberUser = false;

    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            Color.fromRGBO(191, 141, 187, 1),
            Color.fromRGBO(254, 211, 170, 1),
          ])),
      padding: EdgeInsets.symmetric(horizontal: width * 0.1),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const HeadingWidget(),
          SizedBox(
              child: Form(
                  key: _formKey,
                  onChanged: () {},
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomTextForm(inputName: 'Correo electrónico'),
                        const SizedBox(height: 25),
                        const PasswordTextForm(inputName: 'Contraseña'),
                        const SizedBox(height: 25),
                        CheckboxListTile(
                            title: const Text('Recordarme',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                )),
                            value: false,
                            controlAffinity: ListTileControlAffinity.leading,
                            onChanged: (value) {
                              rememberUser = !rememberUser;
                            }),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            '¿Olvidaste tu contraseña?',
                            style: TextStyle(
                              color: Color.fromRGBO(167, 12, 53, 1),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const Divider(
                          thickness: 2,
                          color: Colors.black26,
                        ),
                        const SizedBox(height: 15),
                        SessionButton(
                            session: 'Iniciar sesion con Google',
                            icon: Image.asset('assets/google.jpg')),
                        const SizedBox(height: 20),
                        SessionButton(
                            session: 'Iniciar sesion con Facebook',
                            icon:
                                Image.asset('assets/facebook.png', height: 30)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('¿Aún no tienes cuenta? '),
                            TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'Registrate',
                                  style: TextStyle(
                                    color: Color.fromRGBO(167, 12, 53, 1),
                                    fontWeight: FontWeight.w600,
                                  ),
                                )),
                          ],
                        ),
                        const LoginButton(),
                      ]))),
        ],
      ),
    );
  }
}

class HeadingWidget extends StatelessWidget {
  const HeadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height * 0.12,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Zodiac Zen',
              style: TextStyle(
                // fontFamily: GoogleFonts.,
                fontSize: 32,
                fontWeight: FontWeight.w500,
              )),
          Text(
            'Iniciar Sesion',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
