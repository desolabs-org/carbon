import 'package:flutter/material.dart';

class DarkTheme {

  static ThemeData data = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.black,
    fontFamily: 'SourceCodePro',
    textTheme: TextTheme(
      bodyText1: TextStyle(fontSize: 16, height: 1.4, fontWeight: FontWeight.normal)
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.black,
      titleTextStyle: TextStyle(
          color: Colors.black, fontStyle: FontStyle.italic,
          fontWeight: FontWeight.bold, fontSize: 24
      )
    )
  );

}