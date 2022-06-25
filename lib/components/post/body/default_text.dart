import 'package:cached_network_image/cached_network_image.dart';
import 'package:carbon/dao/models/deso_ninja/post_data.dart';
import 'package:carbon/util/base58.dart';
import 'package:carbon/util/textUtf8.dart';
import 'package:flutter/material.dart';

class DefaultText extends StatelessWidget {

  final PostData postData;

  DefaultText(this.postData) : super();

  @override
  Widget build(BuildContext context) {
    final double iconSize = 3 * 14;
    return
      Container(
        padding: EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(right: 12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4))
              ),
              child: CachedNetworkImage(
                imageUrl: "https://love4src.com/api/v0/get-single-profile-picture/" + Base58ToString(postData.by) + "?fallback=https://love4src.com/assets/img/default_profile_pic.png",
                placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Center(child: Icon(Icons.error)),
                fit: BoxFit.fitHeight,
                height: iconSize,
              ),
            ),
            Flexible(
              child: RichText(
                  softWrap: true,
                  text: TextSpan(text: utf8convert(postData.bdy??""), style: Theme.of(context).textTheme.bodyText1)
              ),
            )
          ],
        )
      );
  }
}