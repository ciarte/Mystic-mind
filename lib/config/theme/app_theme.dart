import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color _customColor = Color.fromARGB(167, 255, 255, 255);

const List<Color> _colorTheme = [
  _customColor,
  Color(0xC5751342),
  Color.fromARGB(197, 55, 211, 167),
  Color.fromARGB(197, 211, 55, 55),
  Color.fromARGB(197, 138, 211, 55),
  Color.fromARGB(197, 211, 169, 55),
];

class AppTheme {
  final int selectedColor;
  final bool isDarkmode;

  AppTheme({required this.isDarkmode, required this.selectedColor})
      : assert(selectedColor >= 0 && selectedColor <= _colorTheme.length - 1,
            'Colors must be between 0 and ${_colorTheme.length}');

  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: const Color.fromRGBO(167, 12, 53, 1),
      brightness: isDarkmode ? Brightness.dark : Brightness.light,

      //Scaffold
      scaffoldBackgroundColor: isDarkmode ? null : _colorTheme[selectedColor],

      //AppBar
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: !isDarkmode
            ? const Color.fromRGBO(254, 211, 170, 1)
            : const Color.fromRGBO(23, 5, 66, 1),
        titleTextStyle: GoogleFonts.macondo(
          textStyle: TextStyle(
            color:
                !isDarkmode ? const Color(0xff000000) : const Color(0xFF352742),
            fontSize: 30,
            fontWeight: FontWeight.w400,
            letterSpacing: 1,
            wordSpacing: 5,
          ),
        ),
      ),

      //bottomNavigationBar
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: Colors.red,
          // backgroundColor: Color.fromRGBO(167, 12, 53,
          //     1), // Personaliza el color de fondo del BottomNavigationBar
          selectedIconTheme: IconThemeData(
            size: 28,
          )),
    );
  }
}
