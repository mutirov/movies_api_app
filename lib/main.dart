import 'package:flutter/material.dart';
import 'package:tmdb_api/tools/colors.dart';
import 'package:tmdb_api/view/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TMDB API Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: CustomColors.appBarColor,
          titleTextStyle: TextStyle(
            color: CustomColors.textColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        scaffoldBackgroundColor: CustomColors.backgroundColor,
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}