import 'package:carbon/app.dart';
import 'package:carbon/layouts/layout_manager.dart';
import 'package:carbon/layouts/parts/brand_logo.dart';
import 'package:carbon/layouts/parts/posts_feed.dart';
import 'package:carbon/layouts/parts/search_bar.dart';
import 'package:flutter/material.dart';

class DesoGramLayout extends StatefulWidget {

  final String l4sFeed = "128b4a0b-4431-4e14-a6b5-3b000e40e0e7";

  @override
  State<DesoGramLayout> createState() => _DesoGramLayoutState(l4sFeed);
}

class _DesoGramLayoutState extends State<DesoGramLayout> {
  String currentFeedId;

  _DesoGramLayoutState(this.currentFeedId): super();

  @override
  Widget build(BuildContext context) {
    App? app = App.of(context);
    num refSize = (app?.layout?.refSize??LayoutManager.defaultRefSize);
    return Scaffold(
        primary: true,
        body: CustomScrollView(
          primary: true,
          slivers: [
            SliverAppBar(
              primary: true,
              floating: true,
              pinned: true,
              leading: SizedBox(child: Center(child: BrandLogo()), height: 2.5 * refSize, width: 2.5 * refSize),
              title: Text("Carbon", style: TextStyle(fontFamily: 'SourceCodePro'),),
              actions: [
                TextButton(onPressed: () {
                  setState(() {
                    this.currentFeedId = this.widget.l4sFeed;
                  });
                },
                  child: Row(children: [
                    Image.asset("assets/images/l4s_short_nobg.png", fit: BoxFit.fitHeight),
                    // Padding(
                    //     padding: EdgeInsets.only(left: 4),
                    //     child: Text("Love4src", style: Theme.of(context).textTheme.button)
                    // ),
                  ],),
                ),
                TextButton(onPressed: () {
                  setState(() {
                    this.currentFeedId = "92503bf4-b1f1-452d-bb0f-5f5f5369ba79";
                  });
                },
                  child: Row(children: [
                    Image.asset("assets/images/tunel_short_nobg.png", fit: BoxFit.fitHeight),
                    // Padding(
                    //     padding: EdgeInsets.only(left: 4),
                    //     child: Text("Love4src", style: Theme.of(context).textTheme.button)
                    // ),
                  ],),
                ),
              ],
            ),
            PostsFeed(
              key: Key(this.currentFeedId),
              feedId: this.currentFeedId
            )
          ],
        )
    );
  }
}