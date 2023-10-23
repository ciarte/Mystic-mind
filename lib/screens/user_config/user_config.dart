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
