
import 'package:carbon/themes/sizes.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UserStatus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double balance = 123.12348234;
    double equiv = 1233.12;
    Size size = MediaQuery.of(context).size;
    TextStyle textStyle = Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.bold);
    String text = balance.toStringAsFixed(6);
    return Container(
        child: SizedBox(
            width: size.width * 0.22,
            child: TextButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (size.width > ThemeSizes.small) Container(
                    padding: EdgeInsets.only(left: size.width * 0.02),
                    child: Icon(Icons.account_balance_wallet_outlined, size: textStyle.fontSize * 1.7, color: textStyle.color),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: size.height * 0.005, horizontal: size.width * 0.02),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("\$DESO", style: textStyle.copyWith(fontSize: textStyle.fontSize * 0.7),),
                        Text(NumberFormat.compact().format(balance), style: textStyle,),
                      ],
                    ),
                  ),
                  if (size.width > ThemeSizes.small) Container(
                      padding: EdgeInsets.only(top: size.height * 0.015, bottom: size.height * 0.015, left: textStyle.fontSize * 0.7),
                      child: Text(
                          NumberFormat.compact().format(equiv) + " \$USD",
                          style: textStyle.copyWith(fontWeight: FontWeight.normal)
                      )
                  ),
                  Spacer(),
                ],
              ),
              onPressed: () {},
            )
        )
    );
  }
}