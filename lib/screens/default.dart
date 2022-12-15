import 'package:carbon/components/feed/one_column.dart';
import 'package:carbon/dao/feed_id.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DefaultScreen extends StatelessWidget {
  FeedId feedId;

  DefaultScreen(this.feedId): super();

  @override
  Widget build(BuildContext context) {

    Widget feedButton(String assetPath, String feedId) =>
        TextButton(onPressed: () => GoRouter.of(context).go('/feeds/' + feedId),
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 4),
                child: Image.asset(assetPath, fit: BoxFit.fitHeight)
            )
        );

    return Scaffold(
        primary: true,
        body: CustomScrollView(
          primary: true,
          slivers: [
            SliverAppBar(
              primary: true,
              floating: true,
              pinned: true,
              backgroundColor: Theme.of(context).backgroundColor,
              leading: TextButton(
                  child: Image.asset("assets/images/carbon.png", fit: BoxFit.fitHeight),
                  onPressed: () => GoRouter.of(context).go('/')
              ),
              actions: [
                // feedButton("assets/images/l4s_short_nobg.png",
                //            "128b4a0b-4431-4e14-a6b5-3b000e40e0e7"),
                // feedButton("assets/images/astro_small_nobg_whitebg.png",
                //            "5049a02d-c77c-4630-8333-20a029f857b9"),
                // feedButton("assets/images/desologo.png",
                //            "d85bf9a1-945e-46e9-8d2f-df455c7ab0a9"),
                // feedButton("assets/images/nft.png",
                //            "7a544c01-96dd-4e03-a07e-8e1eca09e2ee"),
              ],
            ),
            OneColumnFeed(
              key: Key(this.feedId.toString()),
              feedId: this.feedId
            )
          ],
        )
    );
  }
}