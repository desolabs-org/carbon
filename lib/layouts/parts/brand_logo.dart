import 'package:carbon/models/deso_node_data.dart';
import 'package:flutter/material.dart';

class BrandLogo extends StatelessWidget {

  DesoNodeData _desoNodeData;

  BrandLogo(this._desoNodeData): super();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(
            vertical: (Theme.of(context).textTheme.headline6?.fontSize??12) * 0.5,
            horizontal: (Theme.of(context).textTheme.headline6?.fontSize??12) * 0.5
        ),
        child: TextButton(
          child: Container(
            padding: EdgeInsets.all((Theme.of(context).textTheme.headline6?.fontSize??12) * 0.6,),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  child: Image.asset("images/deso_ninja.png",
                      width: 1.5 * (Theme.of(context).textTheme.headline6?.fontSize??12),
                      height: 1.5 * (Theme.of(context).textTheme.headline6?.fontSize??12)
                  ),
                ),
                Container(
                    padding: EdgeInsets.only(
                      left: 0.75 * (Theme.of(context).textTheme.headline6?.fontSize??12),
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