import 'package:carbon/layouts/manager.dart';
import 'package:flag/flag.dart';
import 'package:flutter/material.dart';

class FlagButton extends StatelessWidget {

  final FlagsCode flagCode;
  final Function onPressed;

  FlagButton(this.flagCode, this.onPressed): super();

  @override
  Widget build(BuildContext context) =>
      TextButton(onPressed: () => this.onPressed(),
        child: Container(
            padding: EdgeInsets.symmetric(vertical: LayoutManager.refHeight.toDouble()),
            child: FittedBox(
                child: Flag.fromCode(this.flagCode, fit: BoxFit.fitHeight)
            )
        )
      );
}