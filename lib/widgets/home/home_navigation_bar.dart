import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:horoscope_app/providers/providers.dart';
import 'package:horoscope_app/screens/screens.dart';
import 'package:horoscope_app/widgets/widgets.dart';

class HomeNavigationBar extends StatelessWidget {
  const HomeNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const BottomNavigationBarExample();
  }
}

class BottomNavigationBarExample extends ConsumerStatefulWidget {
  const BottomNavigationBarExample({super.key});

  @override
  BottomNavigationBarExampleState createState() =>
      BottomNavigationBarExampleState();
}

class BottomNavigationBarExampleState
    extends ConsumerState<BottomNavigationBarExample> {
  int _selectedIndex = 0;

  // List<Color> backgroundColorList = [Colors.red, Colors.pink];
  static const List<Widget> _widgetOptions = <Widget>[
    MenuView(),
    UserConfigScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Color getBackgroundColor() {
  //   return backgroundColorList[_selectedIndex];
  // }

  @override
  Widget build(BuildContext context) {
    final isDarkmode = ref.watch(darkModeProvider);
    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          Container(
            decoration: !isDarkmode
                ? const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/fondo.png'),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.linearToSrgbGamma(),
                        opacity: 0.5),
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        tileMode: TileMode.decal,
                        stops: [
                          0.1,
                          0.6
                        ],
                        colors: [
                          Color.fromRGBO(254, 211, 170, 1),
                          Color.fromRGBO(191, 141, 187, 1),
                        ]))
                : const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/fondo.png'),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.linearToSrgbGamma(),
                        opacity: 0.5),
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        tileMode: TileMode.decal,
                        stops: [
                          0.1,
                          0.6
                        ],
                        colors: [
                          Color.fromRGBO(155, 85, 148, 1),
                          Color.fromRGBO(23, 5, 66, 1),
                        ])),
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: CustomPaint(
                // size: Size(MediaQuery.of(context).size.width, 50),
                painter: _CustomNavigtor(),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        iconSize: 32,
                        isSelected: _selectedIndex == 0 ? true : false,
                        selectedIcon: const Icon(Icons.home),
                        icon: const Icon(Icons.home_outlined),
                        color: Colors.white,
                        onPressed: () {
                          _onItemTapped(0);
                        },
                      ),
                      IconButton(
                        iconSize: 32,
                        isSelected: _selectedIndex == 1 ? true : false,
                        selectedIcon: const Icon(Icons.person),
                        icon: const Icon(Icons.person_outline),
                        color: Colors.white,
                        onPressed: () {
                          _onItemTapped(1);
                        },
                      ),
                    ]),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

class _CustomNavigtor extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    paint.color = const Color.fromRGBO(167, 12, 53, 1);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 5;

    Path path = Path();

    path.moveTo(25, 0);
    path.lineTo(size.width - 25, 0);
    path.quadraticBezierTo(size.width, 0, size.width, 25);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 25);
    path.quadraticBezierTo(0, 0, 25, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
