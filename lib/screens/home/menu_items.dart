class MenuItem {
  final String title;
  final String subTitle;
  final String location;
  final String image;

  const MenuItem(
      {required this.title,
      required this.subTitle,
      required this.location,
      required this.image});
}

const appMenuItems = <MenuItem>[
  MenuItem(
    title: 'Horoscopo',
    subTitle: 'Horoscopo del dia',
    location: '/horoscope',
    image: 'assets/chat.jpg',
  ),
  MenuItem(
    title: 'Compatibilidad',
    subTitle: 'Match entre signos',
    location: '/compatibility',
    image: 'assets/consejos.jpg',
  ),
  MenuItem(
    title: 'Oraculo',
    subTitle: 'Pregunta al Oraculo',
    location: '/oracle',
    image: 'assets/oraculo.jpg',
  ),
  MenuItem(
    title: 'Tarot',
    subTitle: 'Consulta el Tarot',
    location: '/tarot',
    image: 'assets/tarot.jpg',
  ),
  // MenuItem(
  //   title: 'Config',
  //   subTitle: 'Configuracion',
  //   location: '/config',
  //   image: 'assets/oraculo.jpg',
  // ),
];
