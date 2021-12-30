import 'package:flutter/material.dart';

class FeedPostFooterButton extends StatelessWidget {

  final IconData iconData;
  final double iconSize;
  final String caption;

  FeedPostFooterButton(this.iconData, this.iconSize, this.caption): super();

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: () {},
      child: Row(children: [
        Icon(iconData, color: (Theme.of(context).textTheme.caption?.color??Colors.black38),
            size: iconSize / 2),
        Padding(
            padding: EdgeInsets.only(left: iconSize / 4),
            child: Text(caption, style: Theme.of(context).textTheme.button)
        ),
      ],),
    );
  }
}