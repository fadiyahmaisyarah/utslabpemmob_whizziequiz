import 'package:flutter/material.dart';
import 'screen/home_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = false;

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Whizzie Quiz',
      debugShowCheckedModeBanner: false,
      theme: isDarkMode ? AppTheme.darkTheme : AppTheme.lightTheme,
      home: const HomeScreen(),
    );
  }
}