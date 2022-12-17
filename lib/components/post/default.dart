import 'package:carbon/components/post/body/default_video.dart';
import 'package:carbon/dao/models/deso_ninja/post_data.dart';
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
    String? videoSrc = postData.videos?.first;
    return Container(
      child: Center(
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DefaultHeader(postData),
              DefaultText(postData),
              if (imageSrc != null) DefaultImage(postData),
              if (videoSrc != null) DefaultVideo(postData),
              DefaultFooter(postData)
            ],
          ),
        )
      )
    );
  }
}