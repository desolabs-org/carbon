import 'package:carbon/themes/bright.dart';
import 'package:carbon/themes/dark.dart';
import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum ThemeKind {
  Bright, Dark, Fun, Professional, Lady, Coder
}

class ThemeManager extends StateNotifier<ThemeData> {

  static final keyThemePreference = "carbon.theme-preference";

  static ThemeData _defaultData = BrightTheme.data;

  final themes = {
    ThemeKind.Bright : BrightTheme.data,
    ThemeKind.Dark : DarkTheme.data
  };

  ThemeManager(): super(_defaultData);

  setTheme(ThemeKind theme) async {
    final _themeData = themes[theme] ?? _defaultData;
    SharedPreferences.getInstance()
      .then((prefs) =>
          prefs.setInt(keyThemePreference, ThemeKind.values.indexOf(theme))
      );

    state = _themeData;
  }

  static String enumName(ThemeKind anyEnum) {
    return anyEnum.toString().split('.')[1];
  }
}