import 'dart:convert';
import 'package:fast_base58/fast_base58.dart';
import 'dart:math';
import 'package:carbon/app.dart';
import 'package:carbon/models/deso_node_manager.dart';
import 'package:carbon/models/feed_data.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class PostsFeed extends StatelessWidget {
  ScrollController _scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    App? app = App.of(context);
    DesoNodeManager? _desoNodeData = app?.data;

    double screenWidth = MediaQuery.of(context).size.width;
    double preferredColumnWidth = (Theme.of(context).textTheme.headline6?.fontSize??12) * 42;
    int maxColumns = max(1, (screenWidth / preferredColumnWidth).floor());
    return FutureBuilder<FeedData>(
        future: _desoNodeData?.getFeedData("128b4a0b-4431-4e14-a6b5-3b000e40e0e7"),
        // future: _desoNodeData?.getFeedData("83a526d6-654e-4aa2-b526-afd798162466"),
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
              constraints: BoxConstraints(maxWidth: 800),
              child: Center(child: Text("Loading feed..."),),
              height: 100,
            ));
          } else return SliverToBoxAdapter(child: Container(
            constraints: BoxConstraints(maxWidth: 800),
            child: Center(child: Text("Loading feed..."),),
            height: 100,
          ));
        },
      );
  }
}

class SocialPost extends StatelessWidget {

  final PostData postData;

  SocialPost(this.postData) : super();

  @override
  Widget build(BuildContext context) {
    double postIconSize = (Theme.of(context).textTheme.button?.fontSize??12) * 3.0;
    double desoLocked = (postData.accountData?.coin?.locked??0) / 1E9;
    double coinPrice = (postData.accountData?.price??0) / 1E9;

    String? imageSrc = postData.images?.first;
    return Container(
      child: Center(
        child: Container(
        constraints: BoxConstraints(maxWidth: 800),
        child: Card(
          // key: UniqueKey(),
          child: Container(
            padding: EdgeInsets.all(4),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Text(utf8.decode((postData.author??[]).map((e) => (e + 127)).toList(), allowMalformed: true)),
                      CachedNetworkImage(
                        imageUrl: "https://love4src.com/api/v0/get-single-profile-picture/" + (postData.author??"") + "?fallback=https://love4src.com/assets/img/default_profile_pic.png",
                        placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) => Center(child: Icon(Icons.error)),
                        fit: BoxFit.fitHeight,
                        height: postIconSize,

                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              padding: EdgeInsets.symmetric(horizontal: 12),
                              child: Text(postData.accountData?.nick??(postData.author??"").substring(0, 32),
                                  style: TextStyle(fontWeight: FontWeight.bold,
                                    fontFamily: 'SourceCodePro'))
                          ),
                          Container(
                              padding: EdgeInsets.symmetric(horizontal: 12),
                              child: Text(DateFormat.jms().format(DateTime.fromMillisecondsSinceEpoch(nanoStampToMillis(postData.timestamp), isUtc: true))),
                          ),
                        ],
                      ),
                      Spacer(),
                      TextButton(onPressed: () {},
                        child: Row(children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                child: Text("CC " + coinPrice.toStringAsFixed(2),
                                    style: Theme.of(context).textTheme.button),
                              ),
                              Container(
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  child: Text("staked " + desoLocked.toStringAsFixed(2),
                                      style: Theme.of(context).textTheme.button
                                  )
                              ),
                            ],
                          ),
                          Icon(Icons.auto_awesome_outlined,
                              color: (Theme.of(context).textTheme.caption?.color??Colors.black38),
                              size: postIconSize / 2
                          )
                        ],),
                      )
                    ],
                  ),
                ),
                if (imageSrc != null) CachedNetworkImage(
                  imageUrl: imageSrc,
                  placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => Center(child: Icon(Icons.error)),
                  fit: BoxFit.fitWidth,
                ),
                Container(
                  padding: EdgeInsets.all(12),
                  child: RichText(
                      text: TextSpan(text: postData.body, style: Theme.of(context).textTheme.bodyText1)
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(12),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Spacer(flex: 2,),
                      FeedPostFooterButton(FontAwesomeIcons.comment, postIconSize, (postData.comments??0).toString()),
                      Spacer(),
                      FeedPostFooterButton(FontAwesomeIcons.heart, postIconSize, (postData.likes??0).toString()),
                      Spacer(),
                      FeedPostFooterButton(FontAwesomeIcons.gem, postIconSize, (postData.diamonds??0).toString()),
                      Spacer(),
                      FeedPostFooterButton(FontAwesomeIcons.reply, postIconSize, ((postData.reclouts??0) + (postData.quotes??0)).toString()),
                      Spacer(flex: 4,),
                    ],
                  ),
                ),
              ],
            ),
          )
        )
        )
      )
    );
  }

  int nanoStampToMillis(String? stamp) {
    if (stamp != null) {
      String tempStamp = stamp.substring(0, stamp.length - 6);
      if (tempStamp.length > 0) {
        int? stampValue = int.tryParse(tempStamp);
        if (stampValue != null) {
          return stampValue;
        } else return 0;

      } else return 0;
    } else return 0;
  }
}

class FeedPostFooterButton extends StatelessWidget {

  final IconData iconData;
  final double iconSize;
  final String caption;

  FeedPostFooterButton(this.iconData, this.iconSize, this.caption): super();

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: () {},
      child: Row(children: [
        Icon(iconData, color: (Theme.of(context).textTheme.caption?.color??Colors.black38),
            size: iconSize / 2),
        Padding(
            padding: EdgeInsets.only(left: iconSize / 4),
            child: Text(caption, style: Theme.of(context).textTheme.button)
        ),
      ],),
    );
  }
}