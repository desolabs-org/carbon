import 'package:carbon/models/deso_node_data.dart';
import 'package:carbon/themes/layout.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class UserStatus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double balance = 123.12348234;
    Size size = MediaQuery.of(context).size;
    double refSize = (Theme.of(context).textTheme.headline6?.fontSize??12);
    return Consumer<DesoNodeData>(builder: (context, desoNodeData, _) {
      return Container(
          child: TextButton(
            onPressed: () {},
            child: Container(
              padding: EdgeInsets.all(0.75 * refSize),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  if (size.width > Layout.boundary) Container(
                    child: Icon(Icons.account_balance_wallet_outlined, size: 1.5 * refSize),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: refSize),
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
                      child: Text(NumberFormat.compact().format(desoNodeData.exchangeUSD * balance) + " \$USD",
                          style: Theme.of(context).textTheme.headline6
                      )
                  ),
                ],
              ),
            ),
          )
      );
    });
  }
}