import 'package:carbon/components/profile/default_pill.dart';
import 'package:carbon/dao/models/deso_ninja/post_data.dart';
import 'package:carbon/dao/network_kind.dart';
import 'package:carbon/dao/user_id.dart';
import 'package:flutter/material.dart';

class DefaultHeader extends StatelessWidget {

  final PostData postData;

  DefaultHeader(this.postData) : super();

  @override
  Widget build(BuildContext context) {
    final userId = UserId(postData.author??"", NetworkKind.DeSo);
    return Container(
      constraints: BoxConstraints(maxWidth: 600),
      padding: EdgeInsets.only(left: 12, right: 12, top: 12, bottom: 0),
      child: Flex(
        direction: Axis.horizontal,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          DefaultPill(userId)
        ],
      )
    );
  }
}