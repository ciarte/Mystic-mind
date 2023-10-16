import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:horoscope_app/screens/home/menu_items.dart';

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'NoCountry Horoscopo',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8, 0, 10, 0),
        child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // 2 tarjetas por columna
              crossAxisSpacing: 15, // Espacio entre columnas
              mainAxisSpacing: 15, // Espacio entre filas
            ),
            itemCount: appMenuItems.length,
            itemBuilder: (BuildContext context, int index) {
              final menuItem = appMenuItems[index];
              return _CustomListTile(
                menuItem: menuItem,
              );
            }),
      ),
    );
  }
}

class _CustomListTile extends StatelessWidget {
  final MenuItem menuItem;

  const _CustomListTile({required this.menuItem});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Color(0xFF11001c),
              blurRadius: 5,
              offset: Offset(8, 8),
            )
          ]),
      child: SizedBox(
        width: 150,
        child: Card(
            color: const Color(0xFF220135),
            child: InkWell(
              onTap: () => context.push(menuItem.location),
              child: Column(
                // alignment: AlignmentDirectional.topCenter,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      menuItem.image,
                      height: 150,
                      width: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(menuItem.subTitle,
                      textScaleFactor: 0.8,
                      style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          color: Colors.white)),
                ],
              ),
            )),
      ),
    );
  }
}
