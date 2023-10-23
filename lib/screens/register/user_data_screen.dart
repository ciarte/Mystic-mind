import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:horoscope_app/screens/vm/login_controller.dart';
import 'package:horoscope_app/screens/vm/login_state.dart';
import 'package:horoscope_app/widgets/widgets.dart';

class UserDataScreen extends StatelessWidget {
  const UserDataScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Align(alignment: Alignment.center, child: UserDataPage()));
  }
}

class UserDataPage extends ConsumerStatefulWidget {
  const UserDataPage({
    super.key,
  });

  @override
  UserDataPageState createState() => UserDataPageState();
}

class UserDataPageState extends ConsumerState<UserDataPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    // final height = MediaQuery.of(context).size.height;

    ref.listen<LoginState>(loginControllerProvider, ((previous, state) {
      if (state is LoginStateError) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(state.error),
        ));
      }
    }));
    final TextEditingController nameController = TextEditingController();
    final TextEditingController birthdayController = TextEditingController();
    final width = MediaQuery.of(context).size.width;

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
            subtitle: 'Completa tus datos',
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
                            inputName: 'Nombre o alias',
                            controller: nameController),
                        const SizedBox(height: 25),
                        CustomTextForm(
                            inputName: 'Fecha de Nacimiento',
                            hint: "DD/MM/YYYY",
                            // isNumber: true,
                            controller: birthdayController),
                        const SizedBox(height: 25),
                        LoginButton(
                            nameButton: 'Continuar',
                            onPressed: () {
                              if (user != null) {
                                print('Usuario actual: ${user.uid}');
                                // Realiza las operaciones que necesites con el usuario actual
                                users.doc(user.uid).set({
                                  'signo': _signo(birthdayController.text),
                                  'nombre': nameController.text,
                                }).then((value) {
                                  print("Usuario actualizado correctamente");
                                  context.go('/home');
                                }).catchError((error) {
                                  print(
                                      "Error al actualizar el usuario: $error");
                                });
                              } else {
                                print(
                                    'No se encontró ningún usuario autenticado');
                              }

                              print(user);
                            }),
                      ]))),
        ],
      ),
    );
  }
}

_signo(String textEditingController) {
  final dia = int.parse(textEditingController.substring(0, 2));
  final mes = int.parse(textEditingController.substring(3, 5));
  if ((dia >= 21 && mes == 3) || (dia <= 20 && mes == 4)) {
    return 'aries';
  }
  if ((dia >= 24 && mes == 9) || (dia <= 23 && mes == 10)) {
    return 'libra';
  }
  if ((dia >= 21 && mes == 4) || (dia <= 21 && mes == 5)) {
    return 'taurus';
  }
  if ((dia >= 24 && mes == 10) || (dia <= 22 && mes == 11)) {
    return 'scorpio';
  }
  if ((dia >= 22 && mes == 5) || (dia <= 21 && mes == 6)) {
    return 'gemini';
  }
  if ((dia >= 23 && mes == 11) || (dia <= 21 && mes == 12)) {
    return 'sagittarius';
  }
  if ((dia >= 21 && mes == 6) || (dia <= 23 && mes == 7)) {
    return 'cancer';
  }
  if ((dia >= 22 && mes == 12) || (dia <= 20 && mes == 1)) {
    return 'capricorn';
  }
  if ((dia >= 24 && mes == 7) || (dia <= 23 && mes == 8)) {
    return 'leo';
  }
  if ((dia >= 21 && mes == 1) || (dia <= 19 && mes == 2)) {
    return 'aquarius';
  }
  if ((dia >= 24 && mes == 8) || (dia <= 23 && mes == 9)) {
    return 'virgo';
  }
  if ((dia >= 20 && mes == 2) || (dia <= 20 && mes == 3)) {
    return 'pisces';
  }
}
