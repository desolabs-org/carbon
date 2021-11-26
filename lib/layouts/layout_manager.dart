import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum LayoutKind {
  Classic
}

enum LayoutSize {
  Small, Medium, Large
}

class LayoutManager extends ChangeNotifier {

  static double boundarySmall = 1080;
  static double boundaryLarge = 1920;

  static LayoutSize defaultSize = LayoutSize.Medium;
  static LayoutKind defaultKind = LayoutKind.Classic;
  static num defaultRefSize = 12;

  final SharedPreferences sharedPreferences;
  static final keyLayoutPreference = "deso-node-data.layout-preference";

  static double _paddingSmall(double value) =>
      (value > boundaryLarge)? value * 0.01 : (value > boundarySmall) ? 2 : 0;

  static double _paddingLarge(double value) =>
      (value > boundaryLarge)? value * 0.05 : (value > boundarySmall) ? 6 : 1;

  double paddingSmall = 0;
  double paddingLarge = 1;
  num refSize = defaultRefSize;

  LayoutKind kind = defaultKind;
  LayoutSize size = defaultSize;

  LayoutManager(this.sharedPreferences) {
    _load();
    _initialize();
  }

  void _initialize() {

  }

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

  void updateFor(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    this.refSize = (Theme.of(context).textTheme.headline6?.fontSize??defaultRefSize);
    this.paddingSmall = _paddingSmall(size.width);
    this.paddingLarge = _paddingLarge(size.width);
    this.size = ((size.width) > boundaryLarge)? LayoutSize.Large :
      ((size.width) > boundarySmall)? LayoutSize.Medium : LayoutSize.Small;
  }
}