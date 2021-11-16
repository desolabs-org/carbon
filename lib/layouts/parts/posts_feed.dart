import 'dart:math';
import 'package:carbon/themes/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class PostsFeed extends StatelessWidget {
  Widget postBuilder (BuildContext context, int index) {
    return Container(
          padding: EdgeInsets.all(4),
          child: Column(
            children: [
              SizedBox(
                height: 32,
                width: 400,
                child: Row(
                  children: [
                    Image.asset("images/kanshi.png", fit: BoxFit.fitHeight,),
                    Text("kanshi")
                  ],
                )
              ),
              SizedBox(
                  height: 92,
                  width: 400,
                  child: Row(
                    children: [
                      Text("Content")
                    ],
                  )
              )
            ],
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    int crossAxisCount = (size.width < ThemeSizes.small)? 1 : (size.width < ThemeSizes.large)? 2 : 3;

    return CustomScrollView(
        primary: false,
        reverse: true,
        slivers: <Widget>[
          SliverStaggeredGrid.countBuilder(
            crossAxisCount: crossAxisCount,
            staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
            itemBuilder: postBuilder,
            itemCount: 100
          )
        ],
    );
  }
}