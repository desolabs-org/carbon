import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BrightTheme {

  static ThemeData data = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.white,
    textTheme: TextTheme(
          bodyText1: TextStyle(fontSize: 15, height: 1.4, fontWeight: FontWeight.w400)
        ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      titleTextStyle: TextStyle(
          color: Colors.black87,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.bold, fontSize: 24,
      )
    )
  );

}