import 'package:carbon/themes/text/default_text_theme.dart';
import 'package:flutter/material.dart';

class DarkTheme {

  static ThemeData data = ThemeData(
    brightness: Brightness.dark,
    textTheme: DefaultTextTheme.data,
    appBarTheme: AppBarTheme()
  );

}