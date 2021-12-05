import 'package:flutter/material.dart';

class BrightTheme {

  static ThemeData data = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.white,
    textTheme: TextTheme(
      bodyText1: TextStyle(fontSize: 16, height: 1.4)
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      titleTextStyle: TextStyle(
          color: Colors.black87,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.bold, fontSize: 24
      )
    )
  );

}