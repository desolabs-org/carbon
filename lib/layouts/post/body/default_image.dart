import 'package:cached_network_image/cached_network_image.dart';
import 'package:carbon/dao/models/deso_ninja/feed_data.dart';
import 'package:flutter/material.dart';

class DefaultImage extends StatelessWidget {

  final PostData postData;

  DefaultImage(this.postData) : super();

  @override
  Widget build(BuildContext context) {
    String imageSrc = postData.images!.first;
    return Container(
        child: Center(
          child: CachedNetworkImage(
            imageUrl: imageSrc,
            placeholder: (context, url) => Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => Center(child: Icon(Icons.error)),
            fit: BoxFit.fitWidth,
          ),
        )
    );
  }
}