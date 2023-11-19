import 'package:flutter/material.dart';
import 'package:horoscope_app/generated/l10n.dart';

class MenuItem {
  final String title;
  final String location;
  final String image;
  late bool? isSelected;
  MenuItem(
      {this.isSelected,
      required this.title,
      required this.location,
      required this.image});
}

List<MenuItem> getAppMenuItems(BuildContext context) {
  return <MenuItem>[
    MenuItem(
      title: S.of(context).tHoroscope,
      location: '/horoscope',
      image: 'assets/horoscope.png',
    ),
    MenuItem(
      title: S.of(context).tCompatibility,
      location: '/compatibility',
      image: 'assets/compatibilidad.png',
    ),
    MenuItem(
      title: S.of(context).tTarot,
      location: '/tarot',
      image: 'assets/tarot.png',
    ),
    MenuItem(
      title: S.of(context).tOracle,
      location: '/oracle',
      image: 'assets/oraculow.png',
    ),
    MenuItem(
      title: S.of(context).tAdvice,
      location: '/tips',
      image: 'assets/consejo.png',
    ),
  ];
}
