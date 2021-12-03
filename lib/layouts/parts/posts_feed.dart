import 'dart:math';
import 'package:carbon/app.dart';
import 'package:carbon/models/deso_node_manager.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
              return
                // CustomScrollView(
                // controller: _scrollController,
                // slivers: <Widget>[
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return SocialPost(postsFound[index] as Map<dynamic, dynamic>);
                    },
                    childCount: postsFound.length
                  ),
                );
            } else return SliverToBoxAdapter(child: Container(
              child: Center(child: Text("Loading feed..."),),
              height: 100,
            ));
          } else return SliverToBoxAdapter(child: Container(
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
    double desoLocked =
    ((postData["ProfileEntryResponse"]["CoinEntry"] != null)?
        postData["ProfileEntryResponse"]["CoinEntry"]["DeSoLockedNanos"]??0 : 0) / 1E9;
    String? imageSrc = (postData["ImageURLs"] != null)? ((postData["ImageURLs"] as List<dynamic>).first as String) : null;
    return Card(
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
                  height: 32,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Text(postData["ProfileEntryResponse"]["Username"]??postData["ProfileEntryResponse"]["PublicKeyBase58Check"], style: Theme.of(context).textTheme.caption,)
                  ),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text("" + desoLocked.toStringAsFixed(2), style: Theme.of(context).textTheme.caption,)
                  )
                ],
              ),
            ),
            if (imageSrc != null) CachedNetworkImage(
              imageUrl: imageSrc,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
              fit: BoxFit.fitWidth,
            ),
            Container(
              padding: EdgeInsets.all(12),
              child: RichText(
                  text: TextSpan(text: postData["Body"], style: Theme.of(context).textTheme.bodyText1)
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 12),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.repeat, size: 24,),
                  Icon(Icons.bookmark_outline_rounded, size: 24,),
                  Icon(Icons.star_outline, size: 24,),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}