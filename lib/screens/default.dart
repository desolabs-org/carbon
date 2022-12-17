import 'package:carbon/components/feed/one_column.dart';
import 'package:carbon/components/search/input_box.dart';
import 'package:carbon/dao/models/carbon/feed_id.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DefaultScreen extends StatelessWidget {
  final FeedId feedId;

  DefaultScreen(this.feedId): super();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bg_tile.png"),
          repeat: ImageRepeat.repeat
        )
      ),
      child: Scaffold(
        primary: true,
        backgroundColor: Colors.transparent,
        body: CustomScrollView(
          primary: true,
          cacheExtent: MediaQuery.of(context).size.longestSide * 2,
          slivers: [
            SliverAppBar(
              primary: true,
              floating: true,
              pinned: false,
              centerTitle: true,
              title: Container(
                constraints: BoxConstraints(
                  maxWidth: 600
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton(
                        child: Image.asset("assets/images/carbon.png", width: 32),
                        onPressed: () => GoRouter.of(context).go('/')
                    ),
                    SearchInputBox(),
                    Spacer(),
                    IconButton(
                        onPressed: () => GoRouter.of(context).go('/notifications'),
                        icon: Icon(FontAwesomeIcons.bell)
                    ),
                  ],
                )
              )
            ),
            OneColumnFeed(
              key: Key(this.feedId.toString()),
              feedId: this.feedId
            )
          ],
        )
      )
    );
  }
}