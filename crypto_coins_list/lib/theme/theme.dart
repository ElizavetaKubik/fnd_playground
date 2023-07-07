import 'package:flutter/material.dart';

final dartTheme = ThemeData(
  scaffoldBackgroundColor: const Color.fromARGB(255, 36, 35, 35),
  appBarTheme: const AppBarTheme(
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
  ),
  useMaterial3: true,
);
