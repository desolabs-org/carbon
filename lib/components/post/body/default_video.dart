import 'package:carbon/dao/models/deso_ninja/post_data.dart';
import 'package:flutter/material.dart';

class DefaultVideo extends StatelessWidget {

  final PostData postData;

  DefaultVideo(this.postData) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints(maxWidth: 600),
        child: Center(
          child: CircularProgressIndicator(),
        )
    );
  }
}