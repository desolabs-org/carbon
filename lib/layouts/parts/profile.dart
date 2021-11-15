import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return TextButton(
      child: Center(
        child: Container(
          padding: EdgeInsets.all(4),
          child: Image.asset("images/kanshi.png", fit: BoxFit.contain,),
        ),
      ),
      onPressed: () {},
    );
  }
}