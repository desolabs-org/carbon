import 'package:flutter/material.dart';

class PostFooterButton extends StatelessWidget {

  final IconData iconData;
  final String caption;

  PostFooterButton(this.iconData, this.caption): super();

  @override
  Widget build(BuildContext context) => Container(
      margin: EdgeInsets.symmetric(horizontal: 6),
      child: TextButton(
        onPressed: () {},
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 6),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(iconData,
                color: Theme.of(context).textTheme.caption?.color),
              Container(padding: EdgeInsets.only(right: 8),),
              Text(caption,
                  style: Theme.of(context).textTheme.caption)
            ],
          ),
        ),
      )
  );
}