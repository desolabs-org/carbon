import 'package:carbon/app.dart';
import 'package:carbon/layouts/layout_manager.dart';
import 'package:carbon/layouts/parts/brand_logo.dart';
import 'package:carbon/layouts/parts/posts_feed.dart';
import 'package:carbon/layouts/parts/search_bar.dart';
import 'package:flutter/material.dart';

class DesoGramLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    App? app = App.of(context);
    num refSize = (app?.layout?.refSize??LayoutManager.defaultRefSize);
    return Scaffold(
        primary: true,
        body: Center(
          child: Container(
            constraints: BoxConstraints(maxWidth: 800),
            child: CustomScrollView(
              primary: true,
              slivers: [
                SliverAppBar(
                  primary: true,
                  title: SearchBar(),
                  floating: true,
                  pinned: true,
                  leading: SizedBox(child: BrandLogo(), width: 2.5 * refSize),
                  leadingWidth: (2.5 * refSize),
                  actions: [
                    IconButton(onPressed: null, icon: Icon(Icons.home_outlined)),
                    IconButton(onPressed: null, icon: Icon(Icons.message_outlined)),
                    IconButton(onPressed: null, icon: Icon(Icons.add_circle_outline)),
                    IconButton(onPressed: null, icon: Icon(Icons.explore_outlined)),
                    IconButton(onPressed: null, icon: Icon(Icons.notifications_outlined)),
                    IconButton(onPressed: null, icon: Icon(Icons.person_outline_rounded)),
                  ],
                ),
                PostsFeed()
              ],
            )
          )
        )
    );
  }
}