import 'dart:math';
import 'package:carbon/app.dart';
import 'package:carbon/layouts/post/social.dart';
import 'package:carbon/dao/deso_ninja.dart';
import 'package:carbon/dao/models/deso_ninja/feed_data.dart';
import 'package:flutter/material.dart';

class OneColumnFeed extends StatefulWidget {

  final String? feedId;

  OneColumnFeed({Key? key, this.feedId}): super(key: key);

  @override
  State<OneColumnFeed> createState() => _OneColumnFeedState(this.feedId);
}

class _OneColumnFeedState extends State<OneColumnFeed> {
  final String? feedId;

  ScrollController _scrollController = new ScrollController();

  _OneColumnFeedState(this.feedId): super();

  @override
  Widget build(BuildContext context) {
    App? app = App.of(context);
    DesoNinjaDao? _desoNodeData = app?.data;

    double screenWidth = MediaQuery.of(context).size.width;
    double preferredColumnWidth = (Theme.of(context).textTheme.headline6?.fontSize??12) * 42;
    int maxColumns = max(1, (screenWidth / preferredColumnWidth).floor());
    if (feedId == null || (feedId?.isEmpty??false)) return Container(child: Center(child: CircularProgressIndicator()),);
    else return FutureBuilder<FeedData>(
        future: _desoNodeData?.getFeedData(this.feedId??""), // tunel feed
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            final data = snapshot.data as FeedData;

            if ((data.posts?.length??0) > 0) {
              return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return SocialPost((data.posts??[])[index]);
                      },
                      childCount: data.posts?.length??0
                    )
                );
            } else return SliverToBoxAdapter(child: Container(
              constraints: BoxConstraints(maxWidth: 600),
              child: Center(child: Text("Loading feed..."),),
              height: 100,
            ));
          } else return SliverToBoxAdapter(child: Container(
            constraints: BoxConstraints(maxWidth: 600),
            child: Center(child: Text("Loading feed..."),),
            height: 100,
          ));
        },
      );
  }
}