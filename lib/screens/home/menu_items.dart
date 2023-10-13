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
    subTitle: 'Compatibilidad entre signos',
    location: '/compatibility',
    image: 'assets/consejos.jpg',
  ),
  MenuItem(
    title: 'Oraculo',
    subTitle: 'Realiza una pregunta al oraculo',
    location: '/oracle',
    image: 'assets/oraculo.jpg',
  ),
  MenuItem(
    title: 'Tarot',
    subTitle: 'Consulta tu Tarot',
    location: '/tarot',
    image: 'assets/tarot.jpg',
  ),
  MenuItem(
    title: 'Config',
    subTitle: 'Configuraciones de usuario',
    location: '/config',
    image: 'assets/oraculo.jpg',
  ),
];
