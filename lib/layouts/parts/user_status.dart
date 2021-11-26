import 'package:carbon/app.dart';
import 'package:carbon/layouts/layout_manager.dart';
import 'package:carbon/models/deso_node_manager.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class UserStatus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double balance = 123.12348234;
    App? app = App.of(context);
    num refSize = app?.layout?.refSize??LayoutManager.defaultRefSize;
    LayoutSize size = app?.layout?.size??LayoutManager.defaultSize;
    return Consumer<DesoNodeManager>(builder: (context, desoNodeData, _) {
      return Container(
          child: TextButton(
            onPressed: () {},
            child: Container(
              padding: EdgeInsets.all(0.75 * refSize),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  if (size != LayoutSize.Small) Container(
                    child: Icon(Icons.account_balance_wallet_outlined, size: 1.5 * refSize),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: refSize.toDouble()),
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