import 'package:flutter/material.dart';
import 'package:rick_morty/themes/colors.dart';

class RickandMortyLightTheme {
  static final lightTheme = ThemeData(
      tabBarTheme: TabBarTheme(indicatorColor: Colors.red),
      bottomAppBarTheme: const BottomAppBarTheme(
        color: RickAndMortyAppColors.paleCornflowerBlue,
      ),
      // primaryColor: RickAndMortyAppColors.paleCornflowerBlue,
      appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          backgroundColor: RickAndMortyAppColors.paleCornflowerBlue),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: RickAndMortyAppColors.paleCornflowerBlue));
}
