import 'package:cached_network_image/cached_network_image.dart';
import 'package:carbon/dao/models/deso_ninja/post_data.dart';
import 'package:carbon/util/base58.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DefaultHeader extends StatelessWidget {

  final PostData postData;

  DefaultHeader(this.postData) : super();

  @override
  Widget build(BuildContext context) {
    final postStamp = DateTime.fromMillisecondsSinceEpoch(postData.tc??0, isUtc: true);
    return Container(
      // padding: EdgeInsets.all(12),
      // child: Center(
      //     child: Text(Base58ToString(postData.by),
      //       style: Theme.of(context).textTheme.caption)
      // ),
    );
  }
}