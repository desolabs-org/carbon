import 'package:carbon/dao/models/deso_ninja/post_data.dart';
import 'package:carbon/components/post/footer/button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DefaultFooter extends StatelessWidget {

  final PostData postData;

  DefaultFooter(this.postData) : super();

  @override
  Widget build(BuildContext context) {
    final double iconSize = 3 * 14;
    return Container(
      padding: EdgeInsets.all(4),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(flex: 2,),
          PostFooterButton(FontAwesomeIcons.comment, iconSize, (postData.comments??0).toString()),
          Spacer(),
          PostFooterButton(FontAwesomeIcons.heart, iconSize, (postData.likes??0).toString()),
          Spacer(),
          PostFooterButton(FontAwesomeIcons.gem, iconSize, (postData.diamonds??0).toString()),
          Spacer(),
          PostFooterButton(FontAwesomeIcons.reply, iconSize, ((postData.reclouts??0) + (postData.quotes??0)).toString()),
          Spacer(flex: 4,),
        ],
      ),
    );
  }
}