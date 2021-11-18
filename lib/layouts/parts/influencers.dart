import 'package:carbon/themes/colors.dart';
import 'package:carbon/themes/sizes.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum InfluenceKind {
  Diamonds, Posts, Likes, CCSales, CCBuys, NFTSales, NFTBuys
}

class Influencers extends StatelessWidget {

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

  Widget showRow(String text, TextStyle? textStyle, Size size, double value, InfluenceKind kind) {
    return Card(
      elevation: 1,
      child: Container(
          child: SizedBox(
              width: size.width * 0.22,
              child: TextButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (size.width > ThemeSizes.small) Container(
                        padding: EdgeInsets.only(left: size.width * 0.02),
                        child: Icon(getIcon(kind), size: textStyle?.fontSize??12 * 1.7, color: textStyle?.color??Colors.indigoAccent),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: size.height * 0.005, horizontal: size.width * 0.02),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(NumberFormat.compact().format(value), style: textStyle?.copyWith(fontSize: textStyle?.fontSize??12 * 0.7),),
                          if (size.width < ThemeSizes.small) Icon(getIcon(kind), size: textStyle?.fontSize??12 * 1.7, color: textStyle?.color??Colors.indigoAccent),
                          Text("TOP 5", style: textStyle?.copyWith(fontSize: textStyle?.fontSize??12 * 0.7),),
                        ],
                      ),
                    ),
                    if (size.width > ThemeSizes.small) Container(
                        padding: EdgeInsets.only(top: size.height * 0.015, bottom: size.height * 0.015, left: textStyle?.fontSize??12 * 0.7),
                        child: Text(
                          (text.length > 15)? text.substring(0, 15) + "..." : text,
                          style: textStyle?.copyWith(fontWeight: FontWeight.normal)
                        )
                    ),
                    Spacer(),
                  ],
                ),
                onPressed: () {},
              )
          )
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextStyle? textStyle = Theme.of(context).textTheme.subtitle1;
    return Expanded(child: SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
        child: Column(
          children: [
            showRow("kanshi", textStyle, size, 100, InfluenceKind.Diamonds),
            showRow("DeSoNinja", textStyle, size, 20123.1, InfluenceKind.CCBuys),
            showRow("love4src", textStyle, size, 912, InfluenceKind.NFTSales),
            showRow("astronation", textStyle, size, 12, InfluenceKind.Posts),
            showRow("yexperiment", textStyle, size, 10122, InfluenceKind.NFTBuys),
            showRow("kanshi", textStyle, size, 100, InfluenceKind.CCSales),
            showRow("DeSoNinja", textStyle, size, 20123.1, InfluenceKind.Likes),
            showRow("kanshi", textStyle, size, 100, InfluenceKind.Diamonds),
            showRow("DeSoNinja", textStyle, size, 20123.1, InfluenceKind.CCBuys),
            showRow("love4src", textStyle, size, 912, InfluenceKind.NFTSales),
            showRow("astronation", textStyle, size, 12, InfluenceKind.Posts),
            showRow("yexperiment", textStyle, size, 10122, InfluenceKind.NFTBuys),
            showRow("kanshi", textStyle, size, 100, InfluenceKind.CCSales),
            showRow("DeSoNinja", textStyle, size, 20123.1, InfluenceKind.Likes),
            showRow("kanshi", textStyle, size, 100, InfluenceKind.Diamonds),
            showRow("DeSoNinja", textStyle, size, 20123.1, InfluenceKind.CCBuys),
            showRow("love4src", textStyle, size, 912, InfluenceKind.NFTSales),
            showRow("astronation", textStyle, size, 12, InfluenceKind.Posts),
            showRow("yexperiment", textStyle, size, 10122, InfluenceKind.NFTBuys),
            showRow("kanshi", textStyle, size, 100, InfluenceKind.CCSales),
            showRow("DeSoNinja", textStyle, size, 20123.1, InfluenceKind.Likes),
            showRow("kanshi", textStyle, size, 100, InfluenceKind.Diamonds),
            showRow("DeSoNinja", textStyle, size, 20123.1, InfluenceKind.CCBuys),
            showRow("love4src", textStyle, size, 912, InfluenceKind.NFTSales),
            showRow("astronation", textStyle, size, 12, InfluenceKind.Posts),
            showRow("yexperiment", textStyle, size, 10122, InfluenceKind.NFTBuys),
            showRow("kanshi", textStyle, size, 100, InfluenceKind.CCSales),
            showRow("DeSoNinja", textStyle, size, 20123.1, InfluenceKind.Likes),
          ],
        ),
      ),
    ));
  }
}