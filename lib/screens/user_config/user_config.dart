import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:horoscope_app/providers/providers.dart';

class UserConfigScreen extends ConsumerWidget {
  const UserConfigScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkmode = ref.watch(darkModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Configuracion de usuario',
        ),
      ),
      body: Center(
          child: Column(
        children: [
          const Spacer(flex: 1),
          IconButton(
            // icon: const Icon( Icons.light_mode_outlined, size: 100 ),
            icon: Icon(
                isDarkmode
                    ? Icons.dark_mode_outlined
                    : Icons.light_mode_outlined,
                size: 100),
            onPressed: () {
              ref.read(darkModeProvider.notifier).toggleDarkMode();
            },
          ),
          // const Text('Fernando Herrera', style: TextStyle(fontSize: 25)),
          // TextButton.icon(
          //   icon: const Icon(
          //     Icons.add,
          //     size: 50,
          //   ),
          //   label: const Text('0', style: TextStyle(fontSize: 100)),
          //   onPressed: () {},
          // ),
          const Spacer(flex: 2),
        ],
      )),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('cambia tus datos'),
        icon: const Icon(Icons.refresh_rounded),
        onPressed: () {},
      ),
    );
  }
}
