import 'package:flutter/material.dart';

class StylesApp {
  //static Color appPrimaryColor = Color.fromARGB(255, 8, 103, 38);

  static ThemeData darkTheme(BuildContext context) {
    final ThemeData theme = ThemeData.dark();
    return theme.copyWith(
        colorScheme: Theme.of(context)
            .colorScheme
            .copyWith(primary: Color.fromARGB(255, 81, 82, 81)));
  }

  static ThemeData lightTheme(BuildContext context) {
    final ThemeData theme = ThemeData.light();
    return theme.copyWith(
        colorScheme: Theme.of(context)
            .colorScheme
            .copyWith(primary: Color.fromARGB(255, 135, 174, 191)));
  }

  static ThemeData warmTheme(BuildContext context) {
    final ThemeData theme = ThemeData.light();
    return theme.copyWith(
        colorScheme: Theme.of(context)
            .colorScheme
            .copyWith(primary: Color.fromARGB(255, 209, 160, 97)));
  }
}
