import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:horoscope_app/screens/vm/login_controller.dart';
import 'package:horoscope_app/screens/vm/login_state.dart';
import 'package:horoscope_app/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Align(alignment: Alignment.center, child: LoginPage()));
  }
}

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({
    super.key,
  });

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends ConsumerState<LoginPage> {
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
            subtitle: 'Iniciar sesion',
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
                            session: 'Continuar con Google',
                            icon: Image.asset('assets/google.jpg')),
                        const SizedBox(height: 20),
                        SessionButton(
                            session: 'Continuar con Facebook',
                            icon:
                                Image.asset('assets/facebook.png', height: 30)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('¿Aún no tienes cuenta? '),
                            TextButton(
                                onPressed: () => context.go('/register'),
                                child: const Text(
                                  'Registrate',
                                  style: TextStyle(
                                    color: Color.fromRGBO(167, 12, 53, 1),
                                    fontWeight: FontWeight.w600,
                                  ),
                                )),
                          ],
                        ),
                        LoginButton(
                            nameButton: 'Iniciar sesion',
                            onPressed: () {
                              ref.read(loginControllerProvider.notifier).login(
                                  emailController.text,
                                  passwordController.text);
                            }),
                      ]))),
        ],
      ),
    );
  }
}
