import 'package:cached_network_image/cached_network_image.dart';
import 'package:carbon/dao/models/deso_ninja/post_data.dart';
import 'package:flutter/material.dart';

class DefaultVideo extends StatelessWidget {

  final PostData postData;

  DefaultVideo(this.postData) : super();

  @override
  Widget build(BuildContext context) {
    String imageSrc = postData.images!.first;
    return Container(
        constraints: BoxConstraints(maxHeight: 400),
        child: Center(
          child: CircularProgressIndicator(),
        )
    );
  }
}