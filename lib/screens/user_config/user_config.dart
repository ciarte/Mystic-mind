import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:horoscope_app/generated/l10n.dart';

import 'package:horoscope_app/providers/providers.dart';
import 'package:horoscope_app/screens/home/menu_items.dart';
import 'package:horoscope_app/screens/horoscope/sign_selection_screen.dart';

import 'package:horoscope_app/widgets/widgets.dart';
import '../../services/local_storage.dart';

class UserConfigScreen extends ConsumerWidget {
  const UserConfigScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkmode = ref.watch(darkModeProvider);
    final selectedLanguage = ref.watch(currentLanguageProvider);

    final texts = S.of(context);
    final TextEditingController nameController = TextEditingController();

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(children: [
          HeadingWidget(title: texts.tConfig),
          //  const Spacer(flex:1),
          IconButton(
            icon: Icon(
                isDarkmode
                    ? Icons.dark_mode_outlined
                    : Icons.light_mode_outlined,
                size: 35),
            onPressed: () {
              // LocalStorage.prefs.setBool('selectedMode', isDarkmode);
              ref.read(darkModeProvider.notifier).toggleDarkMode();
            },
          ),

          Text(
            texts.tAlias,
            style: GoogleFonts.macondo(
              fontSize: 32,
              fontWeight: FontWeight.w500,
            ),
          ),
          TextFormField(
            controller: nameController,
            onFieldSubmitted: (String value) {
              LocalStorage.prefs.setString('alias', value);
              final keys = LocalStorage.prefs.getKeys();
              for (String key in keys) {
                print(LocalStorage.prefs.getString('selectedLanguage'));
                print('$key: ${LocalStorage.prefs.get(key)}');
              }
            },
          ),

          Text(
            texts.tSign,
            style: GoogleFonts.macondo(
              fontSize: 32,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 380,
            child: GridView.builder(
              controller: ScrollController(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // 2 tarjetas por columna
                crossAxisSpacing: 15, // Espacio entre columnas
                mainAxisSpacing: 8, // Espacio entre filas
              ),
              itemCount: getZodiacItems(context).length,
              itemBuilder: (BuildContext context, int index) {
                final zodiacItem = getZodiacItems(context)[index];
                return _CustomListTile(menuItem: zodiacItem);
              },
            ),
          ),
          Column(
            children: [
              Text(
                texts.tLanguage,
                style: GoogleFonts.macondo(
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                ),
              ),
              ExpansionTile(
                title: Text(texts.mLanguage),
                subtitle: Text(getSubtitle(selectedLanguage)),
                initiallyExpanded: false,
                children: [
                  RadioListTile(
                    title: Text(texts.bEnglish),
                    value: 'en',
                    groupValue: selectedLanguage,
                    onChanged: (value) {
                      LocalStorage.prefs
                          .setString('selectedLanguage', value!.toString());
                      ref
                          .read(currentLanguageProvider.notifier)
                          .changeLanguage(value);
                    },
                  ),
                  RadioListTile(
                    title: Text(texts.bSpanish),
                    value: 'es',
                    groupValue: selectedLanguage,
                    onChanged: (value) {
                      ref
                          .read(currentLanguageProvider.notifier)
                          .changeLanguage(value!);
                    },
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          )
        ]),
      ),
    );
  }
}

class _CustomListTile extends StatelessWidget {
  final MenuItem menuItem;

  const _CustomListTile({required this.menuItem});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Card(
          child: InkWell(
        onTap: () {
          LocalStorage.prefs.setString('selectedSign', menuItem.location);
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            menuItem.image,
            alignment: Alignment.topCenter,
            fit: BoxFit.cover,
            height: 90,
            width: 90,
          ),
        ),
      )),
      Text(
        menuItem.title,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        textAlign: TextAlign.center,
      ),
    ]);
  }
}

String getSubtitle(selectedLanguage) {
  switch (selectedLanguage) {
    case 'en':
      return 'English';
    case 'es':
      return 'Español';

    default:
      return 'English';
  }
}
