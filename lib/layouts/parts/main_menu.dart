import 'package:carbon/app.dart';
import 'package:carbon/layouts/layout_manager.dart';
import 'package:flutter/material.dart';
import 'package:carbon/generated/l10n.dart';

class MainMenu extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
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
    App? app = App.of(context);
    LayoutSize size = app?.layout?.size??LayoutManager.defaultSize;
    num refSize = (Theme.of(context).textTheme.headline6?.fontSize??LayoutManager.defaultRefSize);
    return Container(
        child: TextButton(
          child: Container(
            padding: EdgeInsets.all(refSize * 0.6,),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  child: Icon(iconData, size: 1.5 * refSize)
                ),
                if(size != LayoutSize.Small) Container(
                    padding: EdgeInsets.only(
                      left: 0.6 * refSize,
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
