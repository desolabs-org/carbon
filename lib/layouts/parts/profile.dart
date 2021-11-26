import 'package:carbon/app.dart';
import 'package:carbon/layouts/layout_manager.dart';
import 'package:flutter/material.dart';
import 'package:carbon/generated/l10n.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    App? app = App.of(context);
    LayoutSize size = app?.layout?.size??LayoutManager.defaultSize;
    num refSize = (Theme.of(context).textTheme.headline6?.fontSize??LayoutManager.defaultRefSize);
    return Container(
        child: TextButton(
          child: Container(
            padding: EdgeInsets.all(0.6 * refSize),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    child: Image.asset("images/kanshi.png", height: 1.5 * refSize)
                ),
                if(size != LayoutSize.Small) Container(
                    padding: EdgeInsets.only(
                      left: 0.6 * refSize,),
                    child: Text(S.of(context).account, style: Theme.of(context).textTheme.headline6)
                ),
              ],
            ),
          ),
          onPressed: () {},
        )
    );
  }
}