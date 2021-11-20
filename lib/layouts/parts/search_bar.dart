import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: TextField(
          decoration: InputDecoration(
            border: UnderlineInputBorder(
            ),
            hintText: 'Search social networks...',
          ),
        ),
    );
  }
}