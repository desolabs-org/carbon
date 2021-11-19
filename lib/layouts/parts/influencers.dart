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
    return Container(
        padding: EdgeInsets.all((Theme.of(context).textTheme.headline6?.fontSize??12) * 0.05,),
        child: TextButton(
          child: Container(
            padding: EdgeInsets.all(0.6 * (Theme.of(context).textTheme.headline6?.fontSize??12),),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  child: Icon(getIcon(kind), size: 1.5 * (Theme.of(context).textTheme.headline6?.fontSize??12)),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: (Theme.of(context).textTheme.headline6?.fontSize??12)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(NumberFormat.compact().format(value), style: Theme.of(context).textTheme.caption),
                      Text("TOP 5", style: Theme.of(context).textTheme.caption),
                    ],
                  ),
                ),
                Container(
                    child: Text(
                        (text.length > 20)? text.substring(0, 20) + "..." : text,
                        style: Theme.of(context).textTheme.headline6
                    )
                ),
              ],
            ),
          ),
          onPressed: () {},
        )
    );
  }
}