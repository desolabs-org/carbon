import 'package:carbon/themes/sizes.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextStyle? textStyle = Theme.of(context).textTheme.headline6?.copyWith(
        fontWeight: FontWeight.bold);
    return
      SizedBox(
        height: 64,
        child: Container(
        child: Center(
            child: TextButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 64,
                      padding: EdgeInsets.only(top: 4, bottom: 4),
                      child: Image.asset("images/kanshi.png", height: textStyle?.fontSize??12 * 2,)
                  ),
                  if (size.width > ThemeSizes.small) Container(
                      width: 256,
                      child: Text("Account", style: textStyle)
                  ),
                ],
              ),
              onPressed: () {},
            )
        )
    ));
  }
}