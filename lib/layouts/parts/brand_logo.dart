import 'package:carbon/models/deso_node_data.dart';
import 'package:carbon/themes/layout.dart';
import 'package:flutter/material.dart';

class BrandLogo extends StatelessWidget {

  DesoNodeData _desoNodeData;

  BrandLogo(this._desoNodeData): super();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double refSize = (Theme.of(context).textTheme.headline6?.fontSize??12);
    return Container(
        child: TextButton(
          child: Container(
            padding: EdgeInsets.all(refSize * 0.75,),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  child: Image.asset("images/deso_ninja.png",
                      width: 1.5 * refSize,
                      height: 1.5 * refSize
                  ),
                ),
                if(size.width > Layout.boundary) Container(
                    padding: EdgeInsets.only(
                      left: 0.75 * refSize
                    ),
                    child: Text(_desoNodeData.apiEndpoint, style: Theme.of(context).textTheme.headline6)
                ),
              ],
            ),
          ),
          onPressed: () {},
        )
    );
  }
}