import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:horoscope_app/providers/providers.dart';
import 'package:horoscope_app/screens/vm/login_controller.dart';
import 'package:horoscope_app/widgets/widgets.dart';

class UserConfigScreen extends ConsumerWidget {
  const UserConfigScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkmode = ref.watch(darkModeProvider);
    final selectedLanguage = ref.watch(currentLanguageProvider);
    final logOut = ref.watch(loginControllerProvider);

    final TextEditingController nameController = TextEditingController();
    final TextEditingController birthdayController = TextEditingController();

    CollectionReference users = FirebaseFirestore.instance.collection('users');
    User? user = FirebaseAuth.instance.currentUser;

    return Column(children: [
      const HeadingWidget(
        // title: 'Mystic Mind',
        subtitle: 'Configuracion',
      ),
      const Spacer(flex: 1),
      IconButton(
        // icon: const Icon( Icons.light_mode_outlined, size: 100 ),
        icon: Icon(
            isDarkmode ? Icons.dark_mode_outlined : Icons.light_mode_outlined,
            size: 100),
        onPressed: () {
          ref.read(darkModeProvider.notifier).toggleDarkMode();
        },
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
              onPressed: () {
                ref.read(loginControllerProvider.notifier).signOut();
              },
              child: const Text(
                'logOut',
                style: TextStyle(
                  color: Color.fromRGBO(167, 12, 53, 1),
                  fontWeight: FontWeight.w600,
                ),
              )),
        ],
      ),
      ExpansionTile(
        title: const Text('Idioma'),
        subtitle: Text(getSubtitle(selectedLanguage)),
        initiallyExpanded: false,
        children: [
          RadioListTile(
            title: const Text('English'),
            value: Language.en,
            groupValue: selectedLanguage,
            onChanged: (value) {
              ref.read(currentLanguageProvider.notifier).changeLanguage(value!);
            },
          ),
          RadioListTile(
            title: const Text('Español'),
            value: Language.es,
            groupValue: selectedLanguage,
            onChanged: (value) {
              ref.read(currentLanguageProvider.notifier).changeLanguage(value!);
            },
          ),
        ],
      ),
      CustomTextForm(inputName: 'Nombre o alias', controller: nameController),
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
                'signo': birthdayController.text,
                'nombre': nameController.text,
              }).then((value) {
                print("Usuario actualizado correctamente");
              }).catchError((error) {
                print("Error al actualizar el usuario: $error");
              });
            } else {
              print('No se encontró ningún usuario autenticado');
            }

            print(user);
          }),
      const Spacer(flex: 2),
    ]);
  }
}

String getSubtitle(Language selectedLanguage) {
  switch (selectedLanguage) {
    case Language.en:
      return 'English';
    case Language.es:
      return 'Español';
    case Language.fr:
      return 'Français';
    default:
      return '';
  }
}
