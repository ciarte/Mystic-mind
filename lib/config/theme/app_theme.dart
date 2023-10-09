import 'package:flutter/material.dart';

const Color _customColor = Color.fromARGB(197, 55, 60, 211);

const List<Color> _colorTheme = [
  _customColor,
  Color.fromARGB(197, 55, 60, 211),
  Color.fromARGB(197, 211, 55, 130),
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
      colorSchemeSeed: _colorTheme[selectedColor],
      brightness: isDarkmode ? Brightness.dark : Brightness.light,
    );
  }
}
