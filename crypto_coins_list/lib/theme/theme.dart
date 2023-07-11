import 'package:flutter/material.dart';

final dartTheme = ThemeData(
  colorScheme: ColorScheme.fromSwatch().copyWith(
    onPrimary: Colors.yellow,
    primary: Colors.yellow,
    secondary: Colors.yellow,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    foregroundColor: Colors.black,
    backgroundColor: Colors.yellow,
  ),
  scaffoldBackgroundColor: const Color.fromARGB(255, 36, 35, 35),
  appBarTheme: const AppBarTheme(
    elevation: 0,
    backgroundColor: Color.fromARGB(255, 36, 35, 35),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w700,
      fontSize: 20,
    ),
  ),
  listTileTheme: const ListTileThemeData(
    iconColor: Colors.white,
  ),
  textTheme: TextTheme(
    bodyMedium: const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w500,
      fontSize: 20,
    ),
    labelSmall: TextStyle(
      color: Colors.white.withOpacity(0.5),
      fontWeight: FontWeight.w700,
      fontSize: 14,
    ),
    headlineMedium: const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w700,
      fontSize: 20,
    ),
  ),
  useMaterial3: true,
);
