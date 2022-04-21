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
    final double iconSize = 3 * 14;
    double desoLocked = (postData.profile?.creatorCoin?.coins??0) / 1E9;
    double coinPrice = (postData.profile?.price??0) / 1E9;
    final postStamp = DateTime.fromMillisecondsSinceEpoch(nanoStampToMillis(postData.timestamp), isUtc: true);
    return Container(
      padding: EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4))
            ),
            child: CachedNetworkImage(
              imageUrl: "https://love4src.com/api/v0/get-single-profile-picture/" + Base58ToString(postData.author) + "?fallback=https://love4src.com/assets/img/default_profile_pic.png",
              placeholder: (context, url) => Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Center(child: Icon(Icons.error)),
              fit: BoxFit.fitHeight,
              height: iconSize,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Text(postData.profile?.desoHandle??(Base58ToString(postData.author)).substring(0, 32),
                      style: TextStyle(fontWeight: FontWeight.bold,
                          fontFamily: 'SourceCodePro'))
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  DateFormat.jms().format(postStamp) + (
                      (postStamp.day != DateTime.now().day)? (", " + DateFormat.yMEd().format(postStamp)) : ""
                  ),
                  style: Theme.of(context).textTheme.caption,
                ),
              ),
            ],
          ),
          Spacer(),
          TextButton(onPressed: () {},
            child: Row(children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text("\$DESO " + coinPrice.toStringAsFixed(2),
                        style: Theme.of(context).textTheme.caption),
                  ),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text("coins " + desoLocked.toStringAsFixed(2),
                          style: Theme.of(context).textTheme.caption
                      )
                  ),
                ],
              ),
              Icon(Icons.auto_awesome_outlined,
                  color: (Theme.of(context).textTheme.caption?.color??Colors.black38),
                  size: iconSize / 2
              )
            ],),
          )
        ],
      ),
    );
  }

  int nanoStampToMillis(String? stamp) {
    if (stamp != null) {
      String tempStamp = stamp.substring(0, stamp.length - 6);
      if (tempStamp.length > 0) {
        int? stampValue = int.tryParse(tempStamp);
        if (stampValue != null) {
          return stampValue;
        } else return 0;

      } else return 0;
    } else return 0;
  }
}