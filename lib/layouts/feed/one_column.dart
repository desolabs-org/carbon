import 'package:carbon/layouts/post/default.dart';
import 'package:carbon/dao/deso_ninja.dart';
import 'package:carbon/dao/models/deso_ninja/feed_data.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class OneColumnFeed extends StatefulWidget {

  final String? feedId;

  OneColumnFeed({Key? key, this.feedId}): super(key: key);

  @override
  State<OneColumnFeed> createState() => _OneColumnFeedState(this.feedId);
}

class _OneColumnFeedState extends State<OneColumnFeed> {
  final String? feedId;

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
    if (feedId == null || (feedId?.isEmpty??false)) return Container(child: Center(child: CircularProgressIndicator()),);
    else return Consumer<DesoNinjaDao>(
        builder:
            (context, ninjaDao, _) => FutureBuilder<FeedData>(
              future: ninjaDao.getFeedData(this.feedId!),
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
            )
    );
  }
}