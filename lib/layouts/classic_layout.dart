import 'package:carbon/app.dart';
import 'package:carbon/layouts/layout_manager.dart';
import 'package:carbon/layouts/parts/brand_logo.dart';
import 'package:carbon/layouts/parts/influencers.dart';
import 'package:carbon/layouts/parts/main_menu.dart';
import 'package:carbon/layouts/parts/posts_feed.dart';
import 'package:carbon/layouts/parts/profile.dart';
import 'package:carbon/layouts/parts/search_bar.dart';
import 'package:carbon/layouts/parts/user_status.dart';
import 'package:flutter/material.dart';


class ClassicLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    App? app = App.of(context);
    return Scaffold(
      primary: true,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: app?.layout?.paddingLarge??1, right: app?.layout?.paddingSmall??0,
            ),
            child: Column(
              children: [ BrandLogo(), MainMenu(), Profile(), ],
            ),
          ),
          Expanded(child: Column(
            children: [ SearchBar(), PostsFeed(), ],
          )),
          if ((app?.layout?.kind??LayoutSize.Medium) != LayoutSize.Small) Padding(
            padding: EdgeInsets.only(
                left: app?.layout?.paddingSmall??0, right: app?.layout?.paddingLarge??1
            ),
            child: Column(
              children: [ UserStatus(), Influencers(), ],
            ),
          ),
        ],
      )
    );
  }
}
