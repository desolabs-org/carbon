import 'package:carbon/controls/expandable_text.dart';
import 'package:carbon/dao/models/deso_ninja/post_data.dart';
import 'package:flutter/material.dart';

class DefaultText extends StatelessWidget {

  final PostData postData;

  DefaultText(this.postData) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 600),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ExpandableText(postData.body??"")
    );
  }
}