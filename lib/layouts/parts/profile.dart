import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(size.height * 0.01),
      child: Center(
        child: TextButton(
          child: Image.asset("images/kanshi.png", fit: BoxFit.contain,),
          onPressed: () {},
        ),
      ),
    );
  }
}