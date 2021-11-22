import 'package:carbon/themes/layout.dart';
import 'package:flutter/material.dart';
import 'package:carbon/generated/l10n.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double refSize = (Theme.of(context).textTheme.headline6?.fontSize??12);
    return Container(
        child: TextButton(
          child: Container(
            padding: EdgeInsets.all(0.75 * refSize),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    child: Image.asset("images/kanshi.png", height: 1.5 * refSize)
                ),
                if(size.width > Layout.boundary) Container(
                    padding: EdgeInsets.only(
                      left: refSize,),
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