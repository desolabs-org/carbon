import 'package:carbon/layouts/parts/brand_logo.dart';
import 'package:carbon/layouts/parts/influencers.dart';
import 'package:carbon/layouts/parts/main_menu.dart';
import 'package:carbon/layouts/parts/posts_feed.dart';
import 'package:carbon/layouts/parts/profile.dart';
import 'package:carbon/layouts/parts/search_bar.dart';
import 'package:carbon/layouts/parts/user_status.dart';
import 'package:carbon/models/deso_node_data.dart';
import 'package:flutter/material.dart';

class DefaultLayout extends StatelessWidget {

  DesoNodeData _desoNodeData;

  DefaultLayout(this._desoNodeData): super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Column(children: [ BrandLogo(_desoNodeData), MainMenu(), Profile(), ], ),
          Expanded(child: Column(children: [ SearchBar(), PostsFeed(), ], )),
          Column(children: [ UserStatus(), Influencers(), ], ),
        ],
      )
    );
  }
}
