import 'package:carbon/app.dart';
import 'package:carbon/layouts/layout_manager.dart';
import 'package:carbon/models/deso_node_manager.dart';
import 'package:flutter/material.dart';

class BrandLogo extends StatelessWidget {

  BrandLogo(): super();

  @override
  Widget build(BuildContext context) {
    App? app = App.of(context);
    DesoNodeManager? _desoNodeData = app?.data;
    LayoutSize size = app?.layout?.size??LayoutManager.defaultSize;
    num refSize = (Theme.of(context).textTheme.headline6?.fontSize??LayoutManager.defaultRefSize);

    return TextButton(
      child: Container(
        padding: EdgeInsets.all(6),
        child: Image.asset("assets/images/deso_ninja.png",
          fit: BoxFit.contain,
        ),
      ),
      onPressed: () {},
    );
  }
}