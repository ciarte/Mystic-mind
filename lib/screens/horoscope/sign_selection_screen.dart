import 'package:flutter/material.dart';
import 'package:horoscope_app/config/plugins/shared_preferences_pluggin.dart';
import 'package:horoscope_app/generated/l10n.dart';

import 'package:horoscope_app/screens/home/menu_items.dart';

class SignSelectionScreen extends StatelessWidget {
  // final Function(String) onSignSelected;
  const SignSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Your Sign'),
      ),
      body: Center(
        child: GridView.builder(
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
    );
  }
}

class _CustomListTile extends StatelessWidget {
  final MenuItem menuItem;

  const _CustomListTile({required this.menuItem});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
            child: InkWell(
          onTap: () {
            SharedPreferencePluggin.setString(
                'selectedSign', menuItem.location);
            Navigator.of(context).pop(menuItem.location);
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
        )
      ],
    );
  }
}

List<MenuItem> getZodiacItems(BuildContext context) {
  var texts = S.of(context);
  return <MenuItem>[
    MenuItem(
      title: texts.sAquarius,
      location: 'aquarius',
      image: 'assets/matchs_cards/aquarius.png',
      isSelected: false,
    ),
    MenuItem(
      title: texts.sAries,
      location: 'aries',
      image: 'assets/matchs_cards/aries.png',
      isSelected: false,
    ),
    MenuItem(
      title: texts.sCancer,
      location: 'cancer',
      image: 'assets/matchs_cards/cancer.png',
      isSelected: false,
    ),
    MenuItem(
      title: texts.sCapricorn,
      location: 'capricorn',
      image: 'assets/matchs_cards/capricorn.png',
      isSelected: false,
    ),
    MenuItem(
      title: texts.sGemini,
      location: 'gemini',
      image: 'assets/matchs_cards/gemini.png',
      isSelected: false,
    ),
    MenuItem(
      title: texts.sLeo,
      location: 'leo',
      image: 'assets/matchs_cards/leo.png',
      isSelected: false,
    ),
    MenuItem(
      title: texts.sLibra,
      location: 'libra',
      image: 'assets/matchs_cards/libra.png',
      isSelected: false,
    ),
    MenuItem(
      title: texts.sPisces,
      location: 'pisces',
      image: 'assets/matchs_cards/pisces.png',
      isSelected: false,
    ),
    MenuItem(
      title: texts.sSagittarius,
      location: 'sagittarius',
      image: 'assets/matchs_cards/sagittarius.png',
      isSelected: false,
    ),
    MenuItem(
      title: texts.sScorpio,
      location: 'scorpio',
      image: 'assets/matchs_cards/scorpio.png',
      isSelected: false,
    ),
    MenuItem(
      title: texts.sTaurus,
      location: 'taurus',
      image: 'assets/matchs_cards/taurus.png',
      isSelected: false,
    ),
    MenuItem(
      title: texts.sVirgo,
      location: 'virgo',
      image: 'assets/matchs_cards/virgo.png',
      isSelected: false,
    ),
  ];
}
