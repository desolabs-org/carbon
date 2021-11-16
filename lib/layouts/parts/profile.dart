import 'package:carbon/themes/sizes.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextStyle textStyle = Theme.of(context).textTheme.headline6.copyWith(
        fontWeight: FontWeight.bold);
    return Container(
        child: Center(
            child: TextButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      padding: EdgeInsets.only(top: 4, bottom: 4),
                      child: Image.asset("images/kanshi.png", height: textStyle.fontSize * 2,)
                  ),
                  if (size.width > ThemeSizes.small) Container(
                      padding: EdgeInsets.only(top: size.height * 0.015, bottom: size.height * 0.015, left: textStyle.fontSize * 0.7),
                      child: Text("Account", style: textStyle)
                  ),
                ],
              ),
              onPressed: () {},
            )
        )
    );
  }
}