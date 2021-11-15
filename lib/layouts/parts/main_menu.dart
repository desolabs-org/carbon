
import 'package:carbon/themes/sizes.dart';
import 'package:flutter/material.dart';

class MainMenu extends StatelessWidget {

  Widget menuButton(IconData iconData, String text, TextStyle style, Size size) {
    return Container(
      child: Center(
          child: TextButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                      padding: EdgeInsets.symmetric(vertical: size.height * 0.015),
                      child: Icon(iconData, size: style.fontSize * 1.5, color: style.color,)
                  ),
                if (size.width > ThemeSizes.small) Container(
                    padding: EdgeInsets.only(top: size.height * 0.015, bottom: size.height * 0.015, left: style.fontSize * 0.7),
                      child: Text(text, style: style)
                  ),
              ],
            ),
            onPressed: () {},
          )
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextStyle textStyle = Theme.of(context).textTheme.headline6.copyWith(
        fontWeight: FontWeight.bold);
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
        padding: EdgeInsets.only(top: size.height * 0.02),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: (size.width < ThemeSizes.tiny)? CrossAxisAlignment.center : CrossAxisAlignment.start,
          children: [
            menuButton(Icons.star_outline, "Trends", textStyle, size),
            menuButton(Icons.notifications_active_outlined, "News", textStyle, size),
            menuButton(Icons.calendar_today_outlined, "Events", textStyle, size),
            menuButton(Icons.bookmark_outline_rounded, "Saved", textStyle, size),
            menuButton(Icons.people_outline_outlined, "Profile", textStyle, size),
            menuButton(Icons.message_outlined, "Chats", textStyle, size),
            menuButton(Icons.more_horiz, "More", textStyle, size),
          ],
        )
      )
    );
  }
}