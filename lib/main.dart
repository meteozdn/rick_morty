import 'package:flutter/material.dart';
import 'package:rick_morty/themes/light_theme.dart';
import 'package:rick_morty/views/main_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: RickandMortyLightTheme.lightTheme,
      home: const MainPage(),
    );
  }
}
