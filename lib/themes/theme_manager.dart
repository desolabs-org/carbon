import 'dart:async';

import 'package:carbon/themes/bright.dart';
import 'package:carbon/themes/dark.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum ThemeKind {
  Bright, Dark
}

class ThemeManager extends ChangeNotifier {
  final appThemeData = {
    ThemeKind.Bright : BrightTheme.data,
    ThemeKind.Dark : DarkTheme.data
  };

  ThemeData _defaultData = DarkTheme.data;
  ThemeKind _defaultThemeKind = ThemeKind.Dark;

  ThemeData _themeData = DarkTheme.data;
  ThemeKind _themeKind = ThemeKind.Dark;

  ThemeData get themeData => _themeData;
  ThemeKind get themeKind => _themeKind;

  static final keyThemePreference = "theme-manager.theme-preference";

  final SharedPreferences sharedPreferences;

  ThemeManager(this.sharedPreferences) {
    _themeKind = ThemeKind.values[sharedPreferences.getInt(keyThemePreference)??0];
    _themeData = appThemeData[_themeKind] ?? DarkTheme.data;
  }

  setTheme(ThemeKind theme) async {
    _themeData = appThemeData[theme] ?? _defaultData;
    _themeKind = appThemeData.containsKey(theme)? theme : _defaultThemeKind;

    notifyListeners();

    SharedPreferences.getInstance()
      .then((prefs) =>
          prefs.setInt(keyThemePreference, ThemeKind.values.indexOf(theme))
      );
  }

  static String enumName(ThemeKind anyEnum) {
    return anyEnum.toString().split('.')[1];
  }
}