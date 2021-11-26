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

    return Container(
        child: TextButton(
          child: Container(
            padding: EdgeInsets.all(refSize * 0.6,),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  child: Image.asset("images/deso_ninja.png",
                      width: 1.5 * refSize,
                      height: 1.5 * refSize
                  ),
                ),
                if(size != LayoutSize.Small) Container(
                    padding: EdgeInsets.only(
                      left: 0.6 * refSize
                    ),
                    child: Text(_desoNodeData?.apiEndpoint??" ?? ", style: Theme.of(context).textTheme.headline6)
                ),
              ],
            ),
          ),
          onPressed: () {},
        )
    );
  }
}