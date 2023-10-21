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
                            controller: birthdayController),
                        LoginButton(
                            nameButton: 'Continuar',
                            onPressed: () {
                              if (user != null) {
                                print('Usuario actual: ${user.uid}');
                                // Realiza las operaciones que necesites con el usuario actual
                                users.doc(user.uid).set({
                                  'Edad': birthdayController.text,
                                  'Nombre': nameController.text,
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
