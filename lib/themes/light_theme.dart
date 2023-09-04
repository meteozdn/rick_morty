import 'package:flutter/material.dart';
import 'package:rick_morty/themes/colors.dart';

class RickandMortyLightTheme {
  static final lightTheme = ThemeData(
      //   tabBarTheme: const TabBarTheme(indicatorColor: Colors.red),
      bottomAppBarTheme: const BottomAppBarTheme(
        color: RnMColors.paleCornflowerBlue,
      ),
      // primaryColor: RickAndMortyAppColors.paleCornflowerBlue,
      appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          backgroundColor: RnMColors.paleCornflowerBlue),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: RnMColors.paleCornflowerBlue));
}
