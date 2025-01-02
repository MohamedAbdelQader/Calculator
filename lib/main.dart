import 'package:flutter/material.dart';
import 'package:small_calculator/constants/appStyle.dart';
import 'calculator_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // ValueNotifier to hold the theme mode, allowing dynamic updates
  ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.light);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier, // Listen to theme changes
      builder: (context, themeMode, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Calculator',
          theme: AppStyle.lightTheme,
          darkTheme: AppStyle.darkTheme,
          themeMode: themeMode, // Use the current theme mode
          home: CalculatorScreen(themeNotifier: themeNotifier), // Pass notifier to child widget
        );
      },
    );
  }
}
