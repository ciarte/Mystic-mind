import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
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
          const HeadingWidget(
            title: 'Mystic Mind',
            subtitle: 'Registro',
          ),
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
                                onPressed: () => context.go('/login'),
                                child: const Text(
                                  'Inicia sesion',
                                  style: TextStyle(
                                    color: Color.fromRGBO(167, 12, 53, 1),
                                    fontWeight: FontWeight.w600,
                                  ),
                                )),
                          ],
                        ),
                        LoginButton(
                            nameButton: 'Continuar',
                            onPressed: () {
                              if (passwordController.text !=
                                  passwordController2.text) {
                                print(
                                    'la Contraseña no coincide ${passwordController.text} ${passwordController2.text}');
                              } else {
                                ref
                                    .read(loginControllerProvider.notifier)
                                    .create((emailController.text).trim(),
                                        passwordController.text);

                                context.go('/userRegister');
                              }
                            }),
                      ]))),
        ],
      ),
    );
  }
}
