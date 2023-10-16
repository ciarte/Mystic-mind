import 'package:flutter/material.dart';
import 'package:horoscope_app/screens/screens.dart';
import 'package:horoscope_app/widgets/widgets.dart';

class HomeNavigationBar extends StatelessWidget {
  const HomeNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const BottomNavigationBarExample();
  }
}

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key});

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  int _selectedIndex = 0;
  List<Color> backgroundColorList = [Colors.red, Colors.pink];
  static const List<Widget> _widgetOptions = <Widget>[
    MenuView(),
    UserConfigScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Color getBackgroundColor() {
    return backgroundColorList[_selectedIndex];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: const Color(0xFF3c096c),
        // appBar: AppBar(
        //   backgroundColor: Color(0xC5751342),
        //   centerTitle: true,
        //   title: const Text('NoCountry Horoscopo',
        //       style: TextStyle(
        //           overflow: TextOverflow.ellipsis, color: Colors.white)),
        // ),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
          currentIndex: _selectedIndex,
          // selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
          backgroundColor: getBackgroundColor(),
        ),
      ),
    );
  }
}
