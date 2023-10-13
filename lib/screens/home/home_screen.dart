import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:horoscope_app/screens/home/menu_items.dart';

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
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 tarjetas por columna
          crossAxisSpacing: 8, // Espacio entre columnas
          mainAxisSpacing: 8, // Espacio entre filas
        ),
        itemCount: appMenuItems.length,
        itemBuilder: (BuildContext context, int index) {
          final menuItem = appMenuItems[index];
          return _CustomListTile(
            menuItem: menuItem,
          );
        });
  }
}

class _CustomListTile extends StatelessWidget {
  final MenuItem menuItem;

  const _CustomListTile({required this.menuItem});

  @override
  Widget build(BuildContext context) {
    return Card(
        // color: Colors.deepPurpleAccent,
        shadowColor: Colors.purple,
        elevation: 0.5,
        child: InkWell(
          onTap: () => context.push(menuItem.location),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                menuItem.image,
                height: 120,
                width: 120,
                fit: BoxFit.cover,
              ),
              ListTile(
                title: Text(menuItem.title),
                subtitle: Text(menuItem.subTitle),
                contentPadding: EdgeInsets.all(8),
              ),
            ],
          ),
        ));
  }
}
