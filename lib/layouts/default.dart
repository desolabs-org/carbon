import 'package:carbon/app.dart';
import 'package:carbon/layouts/manager.dart';
import 'package:carbon/layouts/feed/one_column.dart';
import 'package:flag/flag.dart';
import 'package:flutter/material.dart';

class DefaultLayout extends StatefulWidget {

  String feedId = "128b4a0b-4431-4e14-a6b5-3b000e40e0e7";

  @override
  State<DefaultLayout> createState() => _DefaultLayoutState(feedId);
}

class _DefaultLayoutState extends State<DefaultLayout> {
  String currentFeedId;

  _DefaultLayoutState(this.currentFeedId): super();

  @override
  Widget build(BuildContext context) {
    App? app = App.of(context);
    num refSize = (app?.layout?.refSize??LayoutManager.defaultRefSize);

    final title = "Carbon";

    return Scaffold(
        primary: true,
        body: CustomScrollView(
          primary: true,
          slivers: [
            SliverAppBar(
              primary: true,
              floating: true,
              pinned: true,
              leading: TextButton(
                  child: Image.asset("assets/images/carbon.png", fit: BoxFit.contain),
                  onPressed: () {}
              ),
              title: Text(title),
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
                    this.widget.feedId = "d85bf9a1-945e-46e9-8d2f-df455c7ab0a9";
                    this.currentFeedId = this.widget.feedId;
                  });
                },
                  child: Image.asset("assets/images/desologo.png", fit: BoxFit.fitHeight),
                ),
                TextButton(onPressed: () {
                  setState(() {
                    this.widget.feedId = "d85bf9a1-945e-46e9-8d2f-df455c7ab0a9";
                    this.currentFeedId = this.widget.feedId;
                  });
                },
                  child: Image.asset("assets/images/deso_voices.png", fit: BoxFit.fitHeight),
                ),
                TextButton(onPressed: () {
                  setState(() {
                    this.widget.feedId = "7a544c01-96dd-4e03-a07e-8e1eca09e2ee";
                    this.currentFeedId = this.widget.feedId;
                  });
                },
                  child: Text("NFTs"),
                ),
                TextButton(onPressed: () {
                  setState(() {
                    this.widget.feedId = "42a71478-147a-4895-8911-b943b3209562";
                    this.currentFeedId = this.widget.feedId;
                  });
                },
                  child: Container(padding: EdgeInsets.symmetric(vertical: refSize/2), child: FittedBox(child: Flag.fromCode(FlagsCode.ES, fit: BoxFit.fitHeight,))),
                ),
                TextButton(onPressed: () {
                  setState(() {
                    this.widget.feedId = "83a526d6-654e-4aa2-b526-afd798162466";
                    this.currentFeedId = this.widget.feedId;
                  });
                },
                  child: Container(padding: EdgeInsets.symmetric(vertical: refSize/2), child: FittedBox(child: Flag.fromCode(FlagsCode.FR, fit: BoxFit.fitHeight,))),
                ),
                TextButton(onPressed: () {
                  setState(() {
                    this.widget.feedId = "602db2fb-4d4a-4d22-be84-e7ca98bfc69c";
                    this.currentFeedId = this.widget.feedId;
                  });
                },
                  child: Container(padding: EdgeInsets.symmetric(vertical: refSize/2), child: FittedBox(child: Flag.fromCode(FlagsCode.NL, fit: BoxFit.fitHeight,))),
                ),
                TextButton(onPressed: () {
                  setState(() {
                    this.widget.feedId = "d18a365c-6f93-46ef-82e7-6d9738266278";
                    this.currentFeedId = this.widget.feedId;
                  });
                },
                  child: Container(padding: EdgeInsets.symmetric(vertical: refSize/2), child: FittedBox(child: Flag.fromCode(FlagsCode.RU, fit: BoxFit.fitHeight,))),
                ),
                TextButton(onPressed: () {
                  setState(() {
                    this.widget.feedId = "b88c1ac4-38d7-409e-bc8f-a1a10900dbd4";
                    this.currentFeedId = this.widget.feedId;
                  });
                },
                  child: Container(padding: EdgeInsets.symmetric(vertical: refSize/2), child: FittedBox(child: Flag.fromCode(FlagsCode.CN, fit: BoxFit.fitHeight,))),
                ),
              ],
            ),
            OneColumnFeed(
              key: Key(this.currentFeedId),
              feedId: this.currentFeedId
            )
          ],
        )
    );
  }
}