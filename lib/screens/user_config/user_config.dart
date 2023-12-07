import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:horoscope_app/config/config.dart';
import 'package:horoscope_app/generated/l10n.dart';

import 'package:horoscope_app/providers/providers.dart';
import 'package:horoscope_app/screens/horoscope/sign_selection_screen.dart';

import 'package:horoscope_app/widgets/widgets.dart';

class UserConfigScreen extends ConsumerStatefulWidget {
  const UserConfigScreen({super.key});

  @override
  UserConfigScreenState createState() => UserConfigScreenState();
}

class UserConfigScreenState extends ConsumerState<UserConfigScreen> {
  int selectedZodiacIndex = -1;
  @override
  Widget build(BuildContext context) {
    final isDarkmode = ref.watch(darkModeProvider);
    final selectedLanguage = ref.watch(currentLanguageProvider);

    final texts = S.of(context);
    final TextEditingController nameController = TextEditingController();

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(children: [
          HeadingWidget(title: texts.tConfig),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                texts.tMode,
                style: GoogleFonts.macondo(
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                ),
              ),
              IconButton(
                icon: Icon(
                    isDarkmode
                        ? Icons.dark_mode_outlined
                        : Icons.light_mode_outlined,
                    size: 35),
                onPressed: () {
                  ref.read(darkModeProvider.notifier).toggleDarkMode();
                },
              ),
            ],
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
                      SharedPreferencePluggin.setString(
                          'selectedLanguage', value!.toString());
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
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
            child: Divider(),
          ),
          Text(
            texts.tAlias,
            style: GoogleFonts.macondo(
              fontSize: 32,
              fontWeight: FontWeight.w500,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,

                  borderRadius: BorderRadius.circular(
                      8.0), // Ajusta el valor según tus preferencias
                ),
                filled: true,
                // prefixIcon: const Icon(Icons.person),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    String value = nameController.text;
                    ref.read(aliasProvider.notifier).newAlias(value);
                  },
                ),
                hintText: texts.tHint,
                hintStyle: const TextStyle(color: Colors.grey),
              ),
              controller: nameController,
              onFieldSubmitted: (String value) {
                ref.read(aliasProvider.notifier).newAlias(value);
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
            child: Divider(),
          ),
          Text(
            texts.tSign,
            style: GoogleFonts.macondo(
              fontSize: 32,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 300,
            child: GridView.builder(
              controller: ScrollController(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, //  tarjetas por columna
                // crossAxisSpacing:  // Espacio entre columnas
                // mainAxisSpacing:  // Espacio entre filas
              ),
              itemCount: getZodiacItems(context).length,
              itemBuilder: (BuildContext context, int index) {
                final zodiacItem = getZodiacItems(context)[index];
                final isSelected = index == selectedZodiacIndex;
                return ListTile(
                    selected: isSelected,
                    title: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Opacity(
                        opacity: isSelected ? 1.0 : 0.50,
                        child: Image.asset(
                          zodiacItem.image,
                          alignment: Alignment.topCenter,
                          fit: BoxFit.cover,
                          height: 60,
                          width: 70,
                        ),
                      ),
                    ),
                    subtitle: Text(
                      zodiacItem.title,
                      style: TextStyle(
                        fontSize: 12,
                        color: !isSelected ? Colors.black54 : Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    onTap: () {
                      SharedPreferencePluggin.setString(
                          'selectedSign', zodiacItem.location);
                      setState(() {
                        selectedZodiacIndex = isSelected
                            ? -1
                            : index; // Si ya está seleccionado, deselecciónalo; de lo contrario, selecciónalo
                      });
                    });
              },
            ),
          ),
        ]),
      ),
    );
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
