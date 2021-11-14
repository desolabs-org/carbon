import 'package:flutter/material.dart';

import 'layout/default.dart';

void main() {
  runApp(CarbonApp());
}

class CarbonApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Carbon app by Love4src',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: DefaultLayout(title: 'Welcome to Carbon app'),
    );
  }
}
