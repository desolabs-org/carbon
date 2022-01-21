import 'package:carbon/layouts/manager.dart';
import 'package:carbon/themes/theme_manager.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {

  static App? of(BuildContext context) =>
      context.findAncestorWidgetOfExactType<App>();

  final ThemeManager? theme;
  final LayoutManager? layout;

  final Widget? child;

  App({this.theme, this.layout, this.child}): super();

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: this.widget.layout?.current,
    );
  }
}