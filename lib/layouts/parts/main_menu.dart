import 'package:flutter/material.dart';
import 'package:carbon/generated/l10n.dart';

class MainMenu extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: (Theme.of(context).textTheme.headline6?.fontSize??12) * 0.5,),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MainMenuButton(Icons.star_outline, S.of(context).trends),
                MainMenuButton(Icons.notifications_active_outlined, S.of(context).news),
                MainMenuButton(Icons.calendar_today_outlined, S.of(context).events),
                MainMenuButton(Icons.bookmark_outline_rounded, S.of(context).saved),
                MainMenuButton(Icons.people_outline_outlined, S.of(context).profile),
                MainMenuButton(Icons.message_outlined, S.of(context).chats),
                MainMenuButton(Icons.more_horiz, S.of(context).more),
              ],
            )
          )
        )
    );
  }

}

class MainMenuButton extends StatelessWidget {

  final IconData iconData;
  final String title;

  MainMenuButton(this.iconData, this.title): super();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: (Theme.of(context).textTheme.headline6?.fontSize??12) * 0.05,),
        child: TextButton(
          child: Container(
            padding: EdgeInsets.all((Theme.of(context).textTheme.headline6?.fontSize??12) * 0.6,),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    child: Icon(iconData, size: 1.5 * (Theme.of(context).textTheme.headline6?.fontSize??12))
                  )
                ),
                Container(
                    padding: EdgeInsets.only(
                      left: 0.75 * (Theme.of(context).textTheme.headline6?.fontSize??12),
                    ),
                    child: Text(title, style: Theme.of(context).textTheme.headline6)
                ),
              ],
            ),
          ),
          onPressed: () {},
        )
    );
  }

}
