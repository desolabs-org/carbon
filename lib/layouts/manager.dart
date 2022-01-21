import 'package:carbon/layouts/default.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum LayoutKind {
  Default
}

enum LayoutSize {
  Small, Medium, Large
}

class LayoutManager extends ChangeNotifier {
  final SharedPreferences sharedPreferences;
  static final keyLayoutPreference = "layout.preference";

  static LayoutKind defaultKind = LayoutKind.Default;

  static double get paddingSmall => 2;
  static double get paddingLarge => 6;
  static num get refHeight => 14;
  static LayoutKind kind = defaultKind;

  LayoutManager(this.sharedPreferences) {
    _load();
  }

  Widget get current => DefaultLayout();

  void _load() {
    kind = LayoutKind.values.elementAt(
        sharedPreferences.getInt(keyLayoutPreference)??defaultKind.index
    );
  }

  void _store() {
    SharedPreferences.getInstance()
        .then((prefs) => prefs.setInt(keyLayoutPreference, kind.index)
    );
  }
}