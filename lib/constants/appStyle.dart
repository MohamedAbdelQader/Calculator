import 'package:flutter/material.dart';

class AppStyle {
  static final lightTheme = ThemeData(
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
        color: Colors.blue,
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20)),
    );

  static final darkTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.black,
      titleTextStyle: TextStyle(color: Colors.amber),
    ),
    primaryColor: Colors.amber,
  );
}
