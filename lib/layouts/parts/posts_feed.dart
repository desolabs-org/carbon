import 'dart:math';
import 'package:carbon/app.dart';
import 'package:carbon/models/deso_node_manager.dart';
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
    return FutureBuilder<Map<dynamic, dynamic>>(
        initialData: {"posts": "adata"},
        future: _desoNodeData?.getGlobalFeed(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            final data = snapshot.data as Map<dynamic, dynamic>;
            if (data["PostsFound"] != null) {
              var postsFound = data["PostsFound"] as List<dynamic>;
              return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return SocialPost(postsFound[index] as Map<dynamic, dynamic>);
                      },
                      childCount: postsFound.length
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

  final Map<dynamic, dynamic> postData;

  SocialPost(this.postData) : super();

  @override
  Widget build(BuildContext context) {
    double postIconSize = (Theme.of(context).textTheme.button?.fontSize??12) * 3.0;
    double desoLocked =
    ((postData["ProfileEntryResponse"]["CoinEntry"] != null)?
        postData["ProfileEntryResponse"]["CoinEntry"]["DeSoLockedNanos"]??0 : 0) / 1E9;
    String? imageSrc = (postData["ImageURLs"] != null)? ((postData["ImageURLs"] as List<dynamic>).first as String) : null;
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
                      Image.network(
                          "https://love4src.com/api/v0/get-single-profile-picture/" + postData["ProfileEntryResponse"]["PublicKeyBase58Check"] + "?fallback=https://love4src.com/assets/img/default_profile_pic.png",
                      height: postIconSize, width: postIconSize,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              padding: EdgeInsets.symmetric(horizontal: 12),
                              child: Text(postData["ProfileEntryResponse"]["Username"]??postData["ProfileEntryResponse"]["PublicKeyBase58Check"],
                                  style: TextStyle(fontWeight: FontWeight.bold))
                          ),
                          Container(
                              padding: EdgeInsets.symmetric(horizontal: 12),
                              child: Text("" + desoLocked.toStringAsFixed(2) + " DESO staked",
                                  style: Theme.of(context).textTheme.button)
                          )
                        ],
                      ),
                      Spacer(),
                      IconButton(onPressed: () {}, icon: Icon(Icons.auto_awesome_outlined, 
                          color: (Theme.of(context).textTheme.caption?.color??Colors.black38),
                          size: postIconSize / 2
                      ))
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
                      text: TextSpan(text: postData["Body"], style: Theme.of(context).textTheme.bodyText1)
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
                      FeedPostFooterButton(FontAwesomeIcons.comment, postIconSize, postData["CommentCount"].toString()),
                      Spacer(),
                      FeedPostFooterButton(FontAwesomeIcons.heart, postIconSize, postData["LikeCount"].toString()),
                      Spacer(),
                      FeedPostFooterButton(FontAwesomeIcons.gem, postIconSize, postData["DiamondCount"].toString()),
                      Spacer(),
                      FeedPostFooterButton(FontAwesomeIcons.reply, postIconSize, (
                          (
                              ((postData["RepostCount"] as int?)??0) + ((postData["QuoteRepostCount"] as int?)??0)
                          )
                      ).toString()),
                      Spacer(flex: 2,),
                      Text(DateFormat.yMd().add_jms().format(DateTime.now())),
                      Spacer(flex: 2,),
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