import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextStyle? textStyle = Theme.of(context).textTheme.subtitle1?.copyWith(fontWeight: FontWeight.bold);
    return Container(
        width: size.width * 0.3,
        child: TextField(
          style: textStyle,
          decoration: InputDecoration(
            border: UnderlineInputBorder(
            ),
            hintText: 'Search social networks...',
          ),
        ),
    );
  }
}