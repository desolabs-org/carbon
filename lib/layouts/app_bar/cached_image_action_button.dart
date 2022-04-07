import 'package:cached_network_image/cached_network_image.dart';
import 'package:carbon/layouts/layout_manager.dart';
import 'package:flutter/material.dart';

class CachedImageActionButton extends StatelessWidget {

  final String assetPath;
  final Function onPressed;

  CachedImageActionButton(this.assetPath, this.onPressed): super();

  @override
  Widget build(BuildContext context) =>
      TextButton(onPressed: () => this.onPressed(),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: LayoutManager.paddingLarge),
          width: 48,
          height: 48,
          child: Center(
              child: CachedNetworkImage(imageUrl: this.assetPath, fit: BoxFit.fitHeight,)
          )
        )
      );
}