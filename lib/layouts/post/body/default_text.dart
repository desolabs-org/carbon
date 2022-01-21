import 'package:carbon/dao/models/deso_ninja/feed_data.dart';
import 'package:flutter/material.dart';

class DefaultText extends StatelessWidget {

  final PostData postData;

  DefaultText(this.postData) : super();

  @override
  Widget build(BuildContext context) {
    return
      Container(
        padding: EdgeInsets.all(12),
        child: RichText(
            text: TextSpan(text: postData.body, style: Theme.of(context).textTheme.bodyText1)
        ),
      );
  }
}