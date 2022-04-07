import 'package:carbon/layouts/default.dart';
import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

enum LayoutKind {
  Default
}

enum LayoutSize {
  Small, Medium, Large
}

class LayoutManager extends StateNotifier<StatefulWidget> {
  static final keyLayoutPreference = "layout.preference";

  static LayoutKind defaultKind = LayoutKind.Default;

  static double get paddingSmall => 2;
  static double get paddingLarge => 6;
  static num get refHeight => 14;
  static LayoutKind kind = defaultKind;

  LayoutManager(): super(DefaultLayout());
}