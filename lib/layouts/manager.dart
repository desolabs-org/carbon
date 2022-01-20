import 'package:carbon/layouts/default.dart';
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

  Widget current() => DefaultLayout();

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

  bool updateFor(BuildContext context) {
    bool result = false;
    Size size = MediaQuery.of(context).size;

    num newRefSize = (Theme.of(context).textTheme.headline6?.fontSize??defaultRefSize);
    result = result || (this.refSize != newRefSize);
    this.refSize = newRefSize;

    double newPaddingSmall = _paddingSmall(size.width);
    result = result || (this.paddingSmall != newPaddingSmall);
    this.paddingSmall = newPaddingSmall;

    double newPaddingLarge = _paddingLarge(size.width);
    result = result || (this.paddingLarge != newPaddingLarge);
    this.paddingLarge = newPaddingLarge;

    LayoutSize newSize = ((size.width) > boundaryLarge)? LayoutSize.Large :
    ((size.width) > boundarySmall)? LayoutSize.Medium : LayoutSize.Small;
    result = result || (this.size != newSize);
    this.size = newSize;

    return result;
  }
}