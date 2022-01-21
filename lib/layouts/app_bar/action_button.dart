import 'package:carbon/layouts/manager.dart';
import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {

  final String assetPath;
  final Function onPressed;

  ActionButton(this.assetPath, this.onPressed): super();

  @override
  Widget build(BuildContext context) =>
      TextButton(onPressed: () => this.onPressed(),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: LayoutManager.paddingLarge),
          child: Image.asset(this.assetPath, fit: BoxFit.fitHeight)
        )
      );
}