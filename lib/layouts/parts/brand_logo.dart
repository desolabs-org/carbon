import 'package:flutter/material.dart';

class BrandLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: TextButton(
            onPressed: () {},
            child: Container(
              alignment: Alignment.center,
              child: Image.asset("images/deso_ninja.png", height: 64),
            )
        )
    );
  }
}