import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum InfluenceKind {
  Diamonds, Posts, Likes, CCSales, CCBuys, NFTSales, NFTBuys
}

class Influencers extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        primary: false,
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InfluencerButton("kanshi", 100, InfluenceKind.Diamonds),
              InfluencerButton("DeSoNinja", 20123.1, InfluenceKind.CCBuys),
              InfluencerButton("love4src", 912, InfluenceKind.NFTSales),
              InfluencerButton("astronation", 12, InfluenceKind.Posts),
              InfluencerButton("yexperiment", 10122, InfluenceKind.NFTBuys),
              InfluencerButton("kanshi", 100, InfluenceKind.CCSales),
              InfluencerButton("DeSoNinja", 20123.1, InfluenceKind.Likes),
              InfluencerButton("kanshi", 100, InfluenceKind.Diamonds),
              InfluencerButton("DeSoNinja", 20123.1, InfluenceKind.CCBuys),
              InfluencerButton("love4src", 912, InfluenceKind.NFTSales),
              InfluencerButton("astronation", 12, InfluenceKind.Posts),
              InfluencerButton("yexperiment", 10122, InfluenceKind.NFTBuys),
              InfluencerButton("kanshi", 100, InfluenceKind.CCSales),
              InfluencerButton("DeSoNinja", 20123.1, InfluenceKind.Likes),
              InfluencerButton("kanshi", 100, InfluenceKind.Diamonds),
              InfluencerButton("DeSoNinja", 20123.1, InfluenceKind.CCBuys),
              InfluencerButton("love4src", 912, InfluenceKind.NFTSales),
              InfluencerButton("astronation", 12, InfluenceKind.Posts),
              InfluencerButton("yexperiment", 10122, InfluenceKind.NFTBuys),
              InfluencerButton("kanshi", 100, InfluenceKind.CCSales),
              InfluencerButton("DeSoNinja", 20123.1, InfluenceKind.Likes),
              InfluencerButton("kanshi", 100, InfluenceKind.Diamonds),
              InfluencerButton("DeSoNinja", 20123.1, InfluenceKind.CCBuys),
              InfluencerButton("love4src", 912, InfluenceKind.NFTSales),
              InfluencerButton("astronation", 12, InfluenceKind.Posts),
              InfluencerButton("yexperiment", 10122, InfluenceKind.NFTBuys),
              InfluencerButton("kanshi", 100, InfluenceKind.CCSales),
              InfluencerButton("DeSoNinja", 20123.1, InfluenceKind.Likes),
            ],
          ),
        ),
      )
    );
  }
}

class InfluencerButton extends StatelessWidget {

  final String text;
  final InfluenceKind kind;
  final double value;

  InfluencerButton(this.text, this.value, this.kind): super();

  IconData getIcon(InfluenceKind kind) {
    switch (kind) {
      case InfluenceKind.Diamonds:
        return Icons.auto_awesome;
      case InfluenceKind.Posts:
        return Icons.local_post_office_outlined;
      case InfluenceKind.Likes:
        return Icons.thumb_up_alt_outlined;
      case InfluenceKind.CCSales:
        return Icons.monetization_on_outlined;
      case InfluenceKind.CCBuys:
        return Icons.support;
      case InfluenceKind.NFTSales:
        return Icons.palette_outlined;
      case InfluenceKind.NFTBuys:
        return Icons.money;
      default:
        return Icons.star_outline_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double refSize = (Theme.of(context).textTheme.headline6?.fontSize??12);
    return Card(
      elevation: 0,
        child: Container(
          child: TextButton(
            child: Container(
              padding: EdgeInsets.all(0.25 * refSize),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 5 * refSize,
                    padding: EdgeInsets.all(0.25 * refSize),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(NumberFormat.compact().format(value), style: Theme.of(context).textTheme.caption),
                        Container(
                          child: Icon(getIcon(kind), size: refSize),
                        ),
                        Text("TOP 5", style: Theme.of(context).textTheme.caption),
                      ],
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.only(right: 2 * refSize),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.only(bottom: 0.25 * refSize),
                            child: Text(
                              (text.length > 20)? text.substring(0, 20) + "..." : text,
                              style: Theme.of(context).textTheme.button
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(Icons.check_circle_outline_outlined, size: refSize),
                              Icon(Icons.palette_outlined, size: refSize),
                              Icon(Icons.monetization_on_outlined, size: refSize),
                              Icon(Icons.star_outline, size: refSize),
                            ],
                          )
                        ]
                      )
                  ),
                ],
              ),
            ),
          onPressed: () {},
        )
      ),
    );
  }
}