import 'package:carbon/themes/text/default_text_theme.dart';
import 'package:flutter/material.dart';

class BrightTheme {

  static ThemeData data = ThemeData(
    brightness: Brightness.light,
    textTheme: DefaultTextTheme.data,
    appBarTheme: AppBarTheme(
      color: Colors.blueGrey
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.white60,
      filled: true
    )
  );

}