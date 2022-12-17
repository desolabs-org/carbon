import 'package:carbon/dao/network_kind.dart';
import 'package:carbon/dao/models/carbon/user_id.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class DefaultPill extends StatelessWidget {

  final UserId userId;

  DefaultPill(this.userId) : super();

  String getProfileLink() {
    switch(userId.kind) {
      case NetworkKind.DeSo:
        return "https://love4src.com/api/v0/get-single-profile-picture/" + userId.key + "?fallback=https://love4src.com/assets/img/default_profile_pic.png";
      default:
        return "https://love4src.com/assets/img/default_profile_pic.png";
    }
  }

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.contain,
      child: Row(
        children: [
          Container(
            height: 32,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(4))
            ),
            margin: EdgeInsets.only(right: 6),
            child: CachedNetworkImage(
              // TODO: add mem and disk cache sizes
              imageUrl: getProfileLink(),
              placeholder: (context, url) => Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Center(child: Icon(Icons.error)),
              fit: BoxFit.fitHeight,
            ),
          ),
          Column(
            children: [
              Text("Username")
            ],
          )
        ],
      ),
    );
  }
}