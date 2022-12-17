import 'package:carbon/dao/models/deso_ninja/post_data.dart';
import 'package:carbon/components/post/footer/button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:carbon/generated/l10n.dart';

class DefaultFooter extends StatelessWidget {

  final PostData postData;

  DefaultFooter(this.postData) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 600),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.blueGrey,
            width: 1
          )
        )
      ),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            PostFooterButton(FontAwesomeIcons.comment, S.current.comment),
            PostFooterButton(FontAwesomeIcons.heart, S.current.recommend),
            PostFooterButton(FontAwesomeIcons.reply, S.current.repost),
          ],
        ),
      ),
    );
  }
}