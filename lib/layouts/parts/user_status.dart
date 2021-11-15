
import 'package:carbon/themes/sizes.dart';
import 'package:flutter/material.dart';

class UserStatus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double balance = 123.12348234;
    Size size = MediaQuery.of(context).size;
    TextStyle textStyle = Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.bold);
    return Container(
      child: TextButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                padding: EdgeInsets.only(top: size.height * 0.015, bottom: size.height * 0.015),
                child: Icon(Icons.account_balance_wallet_outlined, size: textStyle.fontSize * 1.5, color: textStyle.color,)
            ),
            if (size.width > ThemeSizes.small) Container(
                padding: EdgeInsets.only(top: size.height * 0.015, bottom: size.height * 0.015, left: textStyle.fontSize * 0.7),
                child: Text("\$DESO " + balance.toStringAsFixed(6), style: textStyle)
            ),
          ],
        ),
        onPressed: () {},
      ),
    );
  }
}