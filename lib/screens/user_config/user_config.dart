import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:horoscope_app/providers/providers.dart';

class UserConfigScreen extends ConsumerWidget {
  const UserConfigScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkmode = ref.watch(darkModeProvider);
    final selectedLanguage = ref.watch(currentLanguageProvider);
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: const Color(0xC5751342),
        centerTitle: true,
        title: const Text('Configuracion',
            style: TextStyle(
              overflow: TextOverflow.ellipsis,
              // color: Colors.white
            )),
      ),
      body: Center(
          child: Column(
        children: [
          const Spacer(flex: 1),
          IconButton(
            // icon: const Icon( Icons.light_mode_outlined, size: 100 ),
            icon: Icon(
                isDarkmode
                    ? Icons.dark_mode_outlined
                    : Icons.light_mode_outlined,
                size: 100),
            onPressed: () {
              ref.read(darkModeProvider.notifier).toggleDarkMode();
            },
          ),
          ExpansionTile(
            title: Text('Idioma'),
            subtitle: Text(getSubtitle(selectedLanguage)),
            initiallyExpanded: false,
            children: [
              RadioListTile(
                title: const Text('English'),
                value: Language.en,
                groupValue: selectedLanguage,
                onChanged: (value) {
                  ref
                      .read(currentLanguageProvider.notifier)
                      .changeLanguage(value!);
                },
              ),
              RadioListTile(
                title: const Text('Español'),
                value: Language.es,
                groupValue: selectedLanguage,
                onChanged: (value) {
                  ref
                      .read(currentLanguageProvider.notifier)
                      .changeLanguage(value!);
                },
              ),
              RadioListTile(
                title: const Text('Français'),
                value: Language.fr,
                groupValue: selectedLanguage,
                onChanged: (value) {
                  ref
                      .read(currentLanguageProvider.notifier)
                      .changeLanguage(value!);
                },
              )
            ],
          ),
          const Spacer(flex: 2),
        ],
      )),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('cambia tus datos'),
        icon: const Icon(Icons.refresh_rounded),
        onPressed: () {},
      ),
    );
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
