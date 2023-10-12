import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NoCountry Horoscopo'),
      ),
      body: const _HomeScreenView(),
    );
  }
}

class _HomeScreenView extends StatelessWidget {
  const _HomeScreenView();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        _CustomListTile(
            title: 'Horoscopo',
            subTitle: 'Horoscopo del dia',
            location: '/horoscope'),
        _CustomListTile(
            title: 'Oracle',
            subTitle: 'Realiza una pregunta al oraculo',
            location: '/oracle'),
        _CustomListTile(
            title: 'Tarot', subTitle: 'Consulta tu Tarot', location: '/tarot'),
        _CustomListTile(
            title: 'Config',
            subTitle: 'Configuraciones de usuario',
            location: '/config'),
      ],
    );
  }
}

class _CustomListTile extends StatelessWidget {
  final String title;
  final String subTitle;
  final String location;

  const _CustomListTile({
    required this.title,
    required this.subTitle,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subTitle),
      trailing: const Icon(Icons.arrow_forward_ios_rounded),
      onTap: () => context.push(location),
    );
  }
}
