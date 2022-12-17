import 'package:flutter/material.dart';
import 'package:carbon/generated/l10n.dart';

class SearchInputBox extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        constraints: BoxConstraints(
            maxWidth: 200
        ),
        isDense: true,
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(),
        hintText: S.current.search,
      ),
      style: Theme.of(context).inputDecorationTheme.helperStyle,
    );
  }
}