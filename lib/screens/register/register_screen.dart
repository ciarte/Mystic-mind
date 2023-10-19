import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:horoscope_app/screens/vm/login_controller.dart';
import 'package:horoscope_app/screens/vm/login_state.dart';
import 'package:horoscope_app/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Align(alignment: Alignment.center, child: RegisterPage()));
  }
}

class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({
    super.key,
  });

  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends ConsumerState<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.of(context).size.height;

    ref.listen<LoginState>(loginControllerProvider, ((previous, state) {
      if (state is LoginStateError) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(state.error),
        ));
      }
    }));
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController passwordController2 = TextEditingController();
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
          const RegisterHeadingWidget(),
          SizedBox(
              child: Form(
                  key: _formKey,
                  onChanged: () {},
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextForm(
                            inputName: 'Correo electrónico',
                            controller: emailController),
                        const SizedBox(height: 25),
                        PasswordTextForm(
                            inputName: 'Contraseña',
                            controller: passwordController),
                        PasswordTextForm(
                            inputName: 'Confirma Contraseña',
                            controller: passwordController2),
                        const Divider(
                          thickness: 2,
                          color: Colors.black26,
                        ),
                        const SizedBox(height: 15),
                        SessionButton(
                            session: 'Registrate con Google',
                            icon: Image.asset('assets/google.jpg')),
                        const SizedBox(height: 20),
                        SessionButton(
                            session: 'Registrate con Facebook',
                            icon:
                                Image.asset('assets/facebook.png', height: 30)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('¿Ya tienes una cuenta? '),
                            TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'Continuar',
                                  style: TextStyle(
                                    color: Color.fromRGBO(167, 12, 53, 1),
                                    fontWeight: FontWeight.w600,
                                  ),
                                )),
                          ],
                        ),
                        LoginButton(onPressed: () {
                          if (passwordController.text !=
                              passwordController2.text) {
                            print(
                                'la Contraseña no coincide ${passwordController.text} ${passwordController2.text}');
                          } else {
                            ref.read(loginControllerProvider.notifier).create(
                                emailController.text, passwordController.text);
                          }
                        }),
                      ]))),
        ],
      ),
    );
  }
}

class RegisterHeadingWidget extends StatelessWidget {
  const RegisterHeadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height * 0.12,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Mystic Mind',
            style: GoogleFonts.macondo(
              fontSize: 32,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Text(
            'Registro',
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
