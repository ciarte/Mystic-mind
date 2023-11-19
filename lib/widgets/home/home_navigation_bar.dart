import 'package:flutter/material.dart';
import 'package:horoscope_app/screens/screens.dart';
import 'package:horoscope_app/widgets/widgets.dart';

class HomeNavigationBar extends StatelessWidget {
  const HomeNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const HeadingWidget(
        title: 'Mistic-Mind',
      )),
      drawer: NavigationDrawer(
          onDestinationSelected: (value) => {},
          children: const [
            UserConfigScreen(),
          ]),
      body: const BackGroundWidget(widgetOptions: MenuView()),
    );
  }
}
