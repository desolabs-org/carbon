import 'dart:html';
import 'dart:math';
import 'package:carbon/themes/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class PostsFeed extends StatelessWidget {
  Widget postBuilder (BuildContext context, int index) {
    return Container(
          padding: EdgeInsets.all(4),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Image.asset("images/kanshi.png", height: 24,),
              Text("post no - " + index.toString(), style: Theme.of(context).textTheme.subtitle1,)
            ],
          ),
          Row(
            children: [
              Text("Content")
            ],
          )
        ],
      ),
        );
  }

  ScrollController _scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double preferredColumnWidth = (Theme.of(context).textTheme.bodyText1?.fontSize??12) * 42;
    int maxColumns = max(1, (size.width / preferredColumnWidth).floor());
    return Expanded(
        child: CustomScrollView(
          controller: _scrollController,
          slivers: <Widget>[
            SliverStaggeredGrid.countBuilder(
              key: UniqueKey(),
              crossAxisCount: maxColumns * 2,
              staggeredTileBuilder: (int index) => StaggeredTile.fit(2),
              itemBuilder: postBuilder,
              itemCount: 100,
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0
            )
          ],
      )
    );
  }
}