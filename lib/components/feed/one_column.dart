import 'package:carbon/components/post/default.dart';
import 'package:carbon/dao/deso_ninja.dart';
import 'package:carbon/dao/feed_id.dart';
import 'package:carbon/dao/models/deso_ninja/feed_data.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OneColumnFeed extends StatefulWidget {

  final FeedId feedId;

  OneColumnFeed({Key? key, required this.feedId}): super(key: key);

  @override
  State<OneColumnFeed> createState() => _OneColumnFeedState(this.feedId);
}

class _OneColumnFeedState extends State<OneColumnFeed> {
  final FeedId feedId;

  _OneColumnFeedState(this.feedId): super();

  Widget get loading => SliverToBoxAdapter(child: Container(
    constraints: BoxConstraints(maxWidth: 600),
    child: Center(child: CircularProgressIndicator(),),
    height: 100,
  ));

  Widget get empty => SliverToBoxAdapter(child: Container(
    constraints: BoxConstraints(maxWidth: 600),
    child: Center(child: Icon(FontAwesomeIcons.batteryEmpty),),
    height: 100,
  ));

  @override
  Widget build(BuildContext context) {
    if (feedId.key.isEmpty) return Container(child: Center(child: CircularProgressIndicator()),);
    else return FutureBuilder<FeedData>(
      future: DesoNinjaDao.getFeedData(feedId.key),
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          final data = snapshot.data as FeedData;

          if ((data.posts?.length ?? 0) > 0) {
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return SocialPost((data.posts ?? [])[index]);
                  },
                  childCount: data.posts?.length ?? 0
              )
            );
          } else return empty;
        } else return loading;
      },
    );
  }
}