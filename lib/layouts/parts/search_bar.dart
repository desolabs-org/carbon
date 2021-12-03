import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchBar extends StatefulWidget {
  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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