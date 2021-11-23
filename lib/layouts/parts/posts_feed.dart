import 'dart:math';
import 'package:carbon/models/deso_node_data.dart';
import 'package:carbon/themes/layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class PostsFeed extends StatelessWidget {
  ScrollController _scrollController = new ScrollController();
  final DesoNodeData _desoNodeData;

  PostsFeed(this._desoNodeData) : super();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double preferredColumnWidth = (Theme.of(context).textTheme.headline6?.fontSize??12) * 42;
    int maxColumns = max(1, (size.width / preferredColumnWidth).floor());
    return Expanded(
      child: FutureBuilder<Map<dynamic, dynamic>>(
        initialData: {"posts": "adata"},
        future: _desoNodeData.getGlobalFeed(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            final data = snapshot.data as Map<dynamic, dynamic>;
            if (data["PostsFound"] != null) {
              return CustomScrollView(
                controller: _scrollController,
                slivers: <Widget>[
                  SliverStaggeredGrid.countBuilder(
                      key: UniqueKey(),
                      crossAxisCount: maxColumns * 2,
                      staggeredTileBuilder: (int index) => StaggeredTile.fit(2),
                      itemBuilder: (BuildContext context, int index) =>
                          SocialPost((data["PostsFound"] as List<dynamic>)[index] as Map<dynamic, dynamic>),
                      itemCount: data["PostsFound"].length,
                      mainAxisSpacing: Layout.marginSmall(size.width),
                      crossAxisSpacing: Layout.marginSmall(size.width)
                  )
                ],
              );
            } else return Container(child: Center(child: Text("Loading feed..."),),);
          } else return Container(child: Center(child: Text("Loading feed..."),),);
        },
      ),
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
    return Card(
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
                  //Image.asset("images/kanshi.png", height: 24,),
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