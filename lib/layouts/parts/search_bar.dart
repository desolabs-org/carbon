import 'package:carbon/app.dart';
import 'package:carbon/layouts/layout_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchBar extends StatefulWidget {
  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    App? app = App.of(context);
    num refSize = (app?.layout?.refSize??LayoutManager.defaultRefSize);
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 48, vertical: 2),
        height: 3.0 * refSize,
        constraints: BoxConstraints(maxWidth: 500),
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