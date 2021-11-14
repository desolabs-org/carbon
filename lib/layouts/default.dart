import 'package:carbon/layouts/parts/branding_banner.dart';
import 'package:carbon/themes/colors.dart';
import 'package:carbon/themes/sizes.dart';
import 'package:flutter/material.dart';

class DefaultLayout extends StatefulWidget {
  DefaultLayout({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DefaultLayoutState createState() => _DefaultLayoutState();
}

class _DefaultLayoutState extends State<DefaultLayout> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    double pageWidth = MediaQuery.of(context).size.width;
    double pageHeight = MediaQuery.of(context).size.height;
    double shortestSide = MediaQuery.of(context).size.shortestSide;
    return Scaffold(
      primary: true,
      backgroundColor: ThemeColors.primarySwatch[50],
      body: Row(
        children: [
          Expanded(
              flex: (pageWidth > ThemeSizes.small)? 2 : 0,
              child: Column(
                children: [
                  SizedBox(height: (pageHeight > ThemeSizes.tiny)? 128 : 64,
                      child: BrandingBanner()
                  ),
                  Expanded(child: Container(color: Colors.red,)),
                  if(pageHeight > ThemeSizes.tiny) SizedBox(height: pageHeight * 0.15, child: Container(color: Colors.amber,)),
                ],
              )
          ),
          Expanded(
              flex: (pageWidth > ThemeSizes.large)? 8 : 6,
              child: Column(
                children: [
                  SizedBox(height: (pageHeight > ThemeSizes.tiny)? 128 : 64, child: Container(color: Colors.indigo,)),
                  Expanded(child: Container(color: Colors.blue,)),
                  if(pageHeight > ThemeSizes.tiny) SizedBox(height: pageHeight * 0.15, child: Container(color: Colors.cyan,)),
                ],
              )
          ),
          Expanded(
              flex: (pageWidth > ThemeSizes.small)? 3 : (pageWidth > ThemeSizes.tiny)? 4 : 0,
              child: Column(
                children: [
                  SizedBox(height: (pageHeight > ThemeSizes.tiny)? 128 : 64, child: Container(color: Colors.deepPurpleAccent,)),
                  Expanded(child: Container(color: Colors.green,)),
                  if(pageHeight > ThemeSizes.tiny) SizedBox(height: pageHeight * 0.15, child: Container(color: Colors.teal,)),
                ],
              )
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
