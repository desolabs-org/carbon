import 'package:carbon/layouts/layout_manager.dart';
import 'package:carbon/models/deso_node_manager.dart';
import 'package:carbon/themes/theme_manager.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {

  static App? of(BuildContext context) =>
      context.findAncestorWidgetOfExactType<App>();

  final DesoNodeManager? data;
  final ThemeManager? theme;
  final LayoutManager? layout;

  final Widget? child;

  App({this.data, this.theme, this.child, this.layout}): super();

  @override
  Widget build(BuildContext context) {
    if (layout != null) layout!.updateFor(context);
    return child??Container();
  }
}