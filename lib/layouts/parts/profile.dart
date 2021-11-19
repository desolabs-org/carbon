import 'package:flutter/material.dart';
import 'package:carbon/generated/l10n.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all((Theme.of(context).textTheme.headline6?.fontSize??12) * 0.05,),
        child: TextButton(
          child: Container(
            padding: EdgeInsets.all(0.75 * (Theme.of(context).textTheme.headline6?.fontSize??12)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    child: Image.asset("images/kanshi.png", height: 1.5 * (Theme.of(context).textTheme.headline6?.fontSize??12))
                ),
                Container(
                    padding: EdgeInsets.only(
                      left: Theme.of(context).textTheme.headline6?.fontSize??12,),
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