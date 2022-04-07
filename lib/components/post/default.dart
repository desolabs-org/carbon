import 'package:carbon/dao/models/deso_ninja/feed_data.dart';
import 'package:carbon/components/post/body/default_image.dart';
import 'package:carbon/components/post/body/default_text.dart';
import 'package:carbon/components/post/footer/default.dart';
import 'package:carbon/components/post/header/default.dart';
import 'package:flutter/material.dart';

class SocialPost extends StatelessWidget {

  final PostData postData;

  SocialPost(this.postData) : super();

  @override
  Widget build(BuildContext context) {
    String? imageSrc = postData.images?.first;
    return Container(
        child: Center(
            child: Container(
                constraints: BoxConstraints(maxWidth:800),
                child: Card(
                  // key: UniqueKey(),
                    child: Container(
                      padding: EdgeInsets.all(4),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DefaultHeader(postData),
                          if (imageSrc != null) DefaultImage(postData),
                          DefaultText(postData),
                          DefaultFooter(postData)
                        ],
                      ),
                    )
                )
            )
        )
    );
  }
}