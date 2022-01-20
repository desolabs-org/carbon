import 'package:carbon/layouts/manager.dart';
import 'package:carbon/dao/deso_ninja.dart';
import 'package:carbon/themes/theme_manager.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {

  static App? of(BuildContext context) =>
      context.findAncestorWidgetOfExactType<App>();

  final DesoNinjaDao? data;
  final ThemeManager? theme;
  final LayoutManager? layout;

  final Widget? child;

  App({this.data, this.theme, this.child, this.layout}): super();

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

  bool wasUpdated = false;
  Key lastKey = UniqueKey();

  @override
  Widget build(BuildContext context) {
    wasUpdated = (widget.layout != null)? widget.layout!.updateFor(context) : false;
    Key usedKey = (wasUpdated)?UniqueKey() : lastKey;
    return Container(
      key: usedKey,
      child: widget.child,
    );
  }
}