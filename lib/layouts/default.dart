import 'package:carbon/layouts/parts/brand_logo.dart';
import 'package:carbon/layouts/parts/influencers.dart';
import 'package:carbon/layouts/parts/main_menu.dart';
import 'package:carbon/layouts/parts/posts_feed.dart';
import 'package:carbon/layouts/parts/profile.dart';
import 'package:carbon/layouts/parts/search_bar.dart';
import 'package:carbon/layouts/parts/user_status.dart';
import 'package:carbon/models/deso_node_data.dart';
import 'package:carbon/themes/layout.dart';
import 'package:flutter/material.dart';

class DefaultLayout extends StatelessWidget {

  DesoNodeData _desoNodeData;

  DefaultLayout(this._desoNodeData): super();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      primary: true,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: Layout.marginLarge(size.width),
                right: Layout.marginSmall(size.width)
            ),
            child: Column(children: [ BrandLogo(_desoNodeData), MainMenu(), Profile(), ], ),
          ),
          Expanded(child: Column(children: [ SearchBar(),
            Container(child: Text("Feed Header"),), PostsFeed(), ], )),
          if (size.width > Layout.boundary) Padding(
            padding: EdgeInsets.only(
                left: Layout.marginSmall(size.width),
                right: Layout.marginLarge(size.width)
            ),
            child: Column(children: [ UserStatus(), Influencers(), ], ),
          ),
        ],
      )
    );
  }
}
