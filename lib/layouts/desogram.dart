import 'package:carbon/app.dart';
import 'package:carbon/layouts/layout_manager.dart';
import 'package:carbon/layouts/parts/brand_logo.dart';
import 'package:carbon/layouts/parts/posts_feed.dart';
import 'package:flag/flag.dart';
import 'package:flutter/material.dart';

class DesoGramLayout extends StatefulWidget {

  String feedId = "128b4a0b-4431-4e14-a6b5-3b000e40e0e7";

  @override
  State<DesoGramLayout> createState() => _DesoGramLayoutState(feedId);
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
                    this.widget.feedId = "128b4a0b-4431-4e14-a6b5-3b000e40e0e7";
                    this.currentFeedId = this.widget.feedId;
                  });
                },
                  child: Image.asset("assets/images/l4s_short_nobg.png", fit: BoxFit.fitHeight),
                ),
                TextButton(onPressed: () {
                  setState(() {
                    this.widget.feedId = "5049a02d-c77c-4630-8333-20a029f857b9";
                    this.currentFeedId = this.widget.feedId;
                  });
                },
                  child: Image.asset("assets/images/astro_small_nobg_whitebg.png", fit: BoxFit.fitHeight),
                ),
                TextButton(onPressed: () {
                  setState(() {
                    this.widget.feedId = "42a71478-147a-4895-8911-b943b3209562";
                    this.currentFeedId = this.widget.feedId;
                  });
                },
                  child: FittedBox(child: Flag.fromCode(FlagsCode.ES, fit: BoxFit.fitHeight,)),
                ),
                TextButton(onPressed: () {
                  setState(() {
                    this.widget.feedId = "83a526d6-654e-4aa2-b526-afd798162466";
                    this.currentFeedId = this.widget.feedId;
                  });
                },
                  child: FittedBox(child: Flag.fromCode(FlagsCode.FR, fit: BoxFit.fitHeight,)),
                ),
                TextButton(onPressed: () {
                  setState(() {
                    this.widget.feedId = "602db2fb-4d4a-4d22-be84-e7ca98bfc69c";
                    this.currentFeedId = this.widget.feedId;
                  });
                },
                  child: FittedBox(child: Flag.fromCode(FlagsCode.NL, fit: BoxFit.fitHeight,)),
                ),
                TextButton(onPressed: () {
                  setState(() {
                    this.widget.feedId = "cd3199bd-cb3c-42c7-9be3-aa42062c5ad2";
                    this.currentFeedId = this.widget.feedId;
                  });
                },
                  child: FittedBox(child: Flag.fromCode(FlagsCode.DE, fit: BoxFit.fitHeight,)),
                ),
                TextButton(onPressed: () {
                  setState(() {
                    this.widget.feedId = "d18a365c-6f93-46ef-82e7-6d9738266278";
                    this.currentFeedId = this.widget.feedId;
                  });
                },
                  child: FittedBox(child: Flag.fromCode(FlagsCode.RU, fit: BoxFit.fitHeight,)),
                ),
                TextButton(onPressed: () {
                  setState(() {
                    this.widget.feedId = "b88c1ac4-38d7-409e-bc8f-a1a10900dbd4";
                    this.currentFeedId = this.widget.feedId;
                  });
                },
                  child: FittedBox(child: Flag.fromCode(FlagsCode.CN, fit: BoxFit.fitHeight,)),
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