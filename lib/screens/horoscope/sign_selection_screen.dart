import 'package:flutter/material.dart';

import 'package:horoscope_app/screens/home/menu_items.dart';

import '../../services/local_storage.dart';

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
            LocalStorage.prefs.setString('selectedSign', menuItem.location);
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
  return <MenuItem>[
    const MenuItem(
      title: 'Aquarius',
      location: 'aquarius',
      image: 'assets/matchs_cards/aquarius.png',
    ),
    const MenuItem(
      title: 'Aries',
      location: 'aries',
      image: 'assets/matchs_cards/aries.png',
    ),
    const MenuItem(
      title: 'Cancer',
      location: 'cancer',
      image: 'assets/matchs_cards/cancer.png',
    ),
    const MenuItem(
      title: 'Capricorn',
      location: 'capricorn',
      image: 'assets/matchs_cards/capricorn.png',
    ),
    const MenuItem(
      title: 'Gemini',
      location: 'gemini',
      image: 'assets/matchs_cards/gemini.png',
    ),
    const MenuItem(
      title: 'Leo',
      location: 'leo',
      image: 'assets/matchs_cards/leo.png',
    ),
    const MenuItem(
      title: 'Libra',
      location: 'libra',
      image: 'assets/matchs_cards/libra.png',
    ),
    const MenuItem(
      title: 'Pisces',
      location: 'pisces',
      image: 'assets/matchs_cards/pisces.png',
    ),
    const MenuItem(
      title: 'Sagittarius',
      location: 'sagittarius',
      image: 'assets/matchs_cards/sagittarius.png',
    ),
    const MenuItem(
      title: 'Scorpio',
      location: 'scorpio',
      image: 'assets/matchs_cards/scorpio.png',
    ),
    const MenuItem(
      title: 'Taurus',
      location: 'taurus',
      image: 'assets/matchs_cards/taurus.png',
    ),
    const MenuItem(
      title: 'Virgo',
      location: 'virgo',
      image: 'assets/matchs_cards/virgo.png',
    ),
  ];
}
