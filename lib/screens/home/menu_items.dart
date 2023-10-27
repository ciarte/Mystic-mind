class MenuItem {
  final String title;
  final String location;
  final String image;

  const MenuItem(
      {required this.title, required this.location, required this.image});
}

const appMenuItems = <MenuItem>[
  MenuItem(
    title: 'Horoscopo',
    location: '/horoscope',
    image: 'assets/horoscope.png',
  ),
  MenuItem(
    title: 'Oraculo',
    location: '/oracle',
    image: 'assets/oraculow.png',
  ),
  MenuItem(
    title: 'Reflexion del dia',
    location: '/compatibility',
    image: 'assets/reflexion.png',
  ),
  MenuItem(
    title: 'Consejo para tu signo',
    location: '/config',
    image: 'assets/consejo.png',
  ),
  MenuItem(
    title: 'Tarot',
    location: '/tarot',
    image: 'assets/tarot.png',
  ),
  MenuItem(
    title: 'Compatibilidad entre signos',
    location: '/compatibility',
    image: 'assets/compatibilidad.png',
  ),
];
