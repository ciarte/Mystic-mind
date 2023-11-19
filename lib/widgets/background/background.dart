import 'package:flutter/material.dart';
import 'package:horoscope_app/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BackGroundWidget extends ConsumerWidget {
  const BackGroundWidget({
    super.key,
    this.widgetOptions,
    // int? selectedIndex,
  });
  //  : _widgetOptions = widgetOptions,
  //       _selectedIndex = selectedIndex;

  final Widget? widgetOptions;
  // final int? _selectedIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkmode = ref.watch(darkModeProvider);
    return Container(
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
        child: widgetOptions
        // .elementAt(_selectedIndex!),
        );
  }
}
