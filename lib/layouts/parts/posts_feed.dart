import 'dart:math';
import 'package:carbon/themes/layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class PostsFeed extends StatelessWidget {
  ScrollController _scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double preferredColumnWidth = (Theme.of(context).textTheme.headline6?.fontSize??12) * 42;
    int maxColumns = max(1, (size.width / preferredColumnWidth).floor());
    return Expanded(
        child: CustomScrollView(
          controller: _scrollController,
          slivers: <Widget>[
            SliverStaggeredGrid.countBuilder(
              key: UniqueKey(),
              crossAxisCount: maxColumns * 2,
              staggeredTileBuilder: (int index) => StaggeredTile.fit(2),
              itemBuilder: (BuildContext context, int index) => SocialPost(),
              itemCount: 100,
              mainAxisSpacing: Layout.marginSmall(size.width),
              crossAxisSpacing: Layout.marginSmall(size.width)
            )
          ],
      )
    );
  }
}

class SocialPost extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Image.asset("images/kanshi.png", height: 24,),
                Text("some post title", style: Theme.of(context).textTheme.subtitle1,)
              ],
            ),
            Row(
              children: [
                Text("Content")
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.repeat, size: 24,),
                Icon(Icons.bookmark_outline_rounded, size: 24,),
                Icon(Icons.star_outline, size: 24,),
              ],
            ),
          ],
        ),
      )
    );
  }
}