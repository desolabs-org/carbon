import 'package:carbon/themes/sizes.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(bottom: size.height * 0.01),
      child: Center(
        child: TextButton(
          child: Image.asset("kanshi.png", fit: BoxFit.contain,),
          onPressed: () {},
        ),
      ),
    );
  }
}