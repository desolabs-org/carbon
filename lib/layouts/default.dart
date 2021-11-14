import 'package:carbon/layouts/parts/branding_banner.dart';
import 'package:carbon/layouts/parts/main_menu.dart';
import 'package:carbon/layouts/parts/profile.dart';
import 'package:carbon/themes/sizes.dart';
import 'package:flutter/material.dart';

class DefaultLayout extends StatefulWidget {
  DefaultLayout({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DefaultLayoutState createState() => _DefaultLayoutState();
}

class _DefaultLayoutState extends State<DefaultLayout> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      primary: true,
      body: Row(
        children: [
          Expanded(
              flex: (size.width > ThemeSizes.small)? 2 : 1,
              child: Column(
                children: [
                  if (size.height > ThemeSizes.tiny)
                    SizedBox(height: 64, child: BrandingBanner()),
                  Expanded(child: MainMenu()),
                  if (size.height > ThemeSizes.tiny) SizedBox(
                      height: 92,
                      child: Profile(),
                  ),
                ],
              )
          ),
          Expanded(
              flex: (size.width > ThemeSizes.large)? 8 : 6,
              child: Column(
                children: [
                  if (size.height > ThemeSizes.tiny) SizedBox(height: 64, child: Container(color: Colors.indigo,)),
                  Expanded(child: Container(color: Colors.blue,)),
                  if(size.height > ThemeSizes.tiny) SizedBox(height: 128, child: Container(color: Colors.cyan,)),
                ],
              )
          ),
          Expanded(
              flex: (size.width > ThemeSizes.small)? 3 : (size.width > ThemeSizes.tiny)? 4 : 0,
              child: Column(
                children: [
                  if (size.height > ThemeSizes.tiny) SizedBox(height: 64, child: Container(color: Colors.deepPurpleAccent,)),
                  Expanded(child: Container(color: Colors.green,)),
                  if(size.height > ThemeSizes.tiny) SizedBox(height: 64, child: Container(color: Colors.teal,)),
                ],
              )
          ),
        ],
      )
    );
  }
}
