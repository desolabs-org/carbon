import 'package:carbon/layouts/app_bar/action_button.dart';
import 'package:carbon/layouts/app_bar/flag_button.dart';
import 'package:carbon/layouts/feed/one_column.dart';
import 'package:flag/flag.dart';
import 'package:flutter/material.dart';

class DefaultLayout extends StatefulWidget {

  final String feedId = "128b4a0b-4431-4e14-a6b5-3b000e40e0e7";

  @override
  State<DefaultLayout> createState() => _DefaultLayoutState(feedId);
}

class _DefaultLayoutState extends State<DefaultLayout> {
  String currentFeedId;

  _DefaultLayoutState(this.currentFeedId): super();

  void changeFeed(String feedId) {
    setState(() {
      this.currentFeedId = feedId;
    });
  }

  @override
  Widget build(BuildContext context) {
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
              actions: [
                ActionButton("assets/images/l4s_short_nobg.png",
                        () => changeFeed("128b4a0b-4431-4e14-a6b5-3b000e40e0e7")),
                ActionButton("assets/images/astro_small_nobg_whitebg.png",
                        () => changeFeed("5049a02d-c77c-4630-8333-20a029f857b9")),
                ActionButton("assets/images/desologo.png",
                        () => changeFeed("d85bf9a1-945e-46e9-8d2f-df455c7ab0a9")),
                ActionButton("assets/images/nft.png",
                        () => changeFeed("7a544c01-96dd-4e03-a07e-8e1eca09e2ee")),
                FlagButton(FlagsCode.ES, () => changeFeed("42a71478-147a-4895-8911-b943b3209562")),
                FlagButton(FlagsCode.FR, () => changeFeed("83a526d6-654e-4aa2-b526-afd798162466")),
                FlagButton(FlagsCode.NL, () => changeFeed("602db2fb-4d4a-4d22-be84-e7ca98bfc69c")),
                FlagButton(FlagsCode.RU, () => changeFeed("d18a365c-6f93-46ef-82e7-6d9738266278")),
                FlagButton(FlagsCode.CN, () => changeFeed("b88c1ac4-38d7-409e-bc8f-a1a10900dbd4")),
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