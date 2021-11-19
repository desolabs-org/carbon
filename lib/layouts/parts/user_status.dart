import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UserStatus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double balance = 123.12348234;
    double equiv = 1233.12;
    return Container(
        child: TextButton(
            onPressed: () {},
            child: Container(
              padding: EdgeInsets.all(0.75 * (Theme.of(context).textTheme.headline6?.fontSize??12)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    child: Icon(Icons.account_balance_wallet_outlined, size: 1.5 * (Theme.of(context).textTheme.headline6?.fontSize??12)),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: (Theme.of(context).textTheme.headline6?.fontSize??12)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("DESO", style: Theme.of(context).textTheme.caption),
                        Text(NumberFormat.compact().format(balance), style: Theme.of(context).textTheme.caption),
                      ],
                    ),
                  ),
                  Container(
                      child: Text(NumberFormat.compact().format(equiv) + " \$USD",
                          style: Theme.of(context).textTheme.headline6
                      )
                  ),
                ],
              ),
            ),
        )
    );
  }
}