import 'package:carbon/layouts/parts/brand_logo.dart';
import 'package:carbon/layouts/parts/influencers.dart';
import 'package:carbon/layouts/parts/main_menu.dart';
import 'package:carbon/layouts/parts/posts_feed.dart';
import 'package:carbon/layouts/parts/profile.dart';
import 'package:carbon/layouts/parts/search_bar.dart';
import 'package:carbon/layouts/parts/user_status.dart';
import 'package:carbon/models/deso_sdk_manager.dart';
import 'package:flutter/material.dart';

class DefaultLayout extends StatelessWidget {

  DesoSdkManager _desoSdkManager;

  DefaultLayout(this._desoSdkManager): super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Column(children: [ BrandLogo(_desoSdkManager), MainMenu(), Profile(), ], ),
          Expanded(child: Column(children: [ SearchBar(), PostsFeed(), ], )),
          Column(children: [ UserStatus(), Influencers(), ], ),
        ],
      )
    );
  }
}
