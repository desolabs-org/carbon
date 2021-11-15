
import 'package:carbon/themes/sizes.dart';
import 'package:flutter/material.dart';

class MainMenu extends StatelessWidget {

  Widget menuButton(IconData iconData, String text, TextStyle style, Size size) {
    return Container(
      child: TextButton.icon(
        label: (size.width > ThemeSizes.small)? Padding(
            padding: EdgeInsets.only(top: size.height * 0.015, bottom: size.height * 0.015, right: size.width * 0.02),
            child: Text(text, style: style)
        ) : Padding(
            padding: EdgeInsets.only(top: size.height * 0.015, bottom: size.height * 0.015, right: size.width * 0.02),
            child: Text("")
        ),
        icon: Padding(
          padding: EdgeInsets.only(top: size.height * 0.015, bottom: size.height * 0.015, left: size.width * 0.02),
          child: Icon(iconData, size: style.fontSize * 1.5, color: style.color,)
        ),
        onPressed: () {},
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextStyle textStyle = Theme.of(context).textTheme.headline6.copyWith(
        fontWeight: FontWeight.bold);
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(top: size.height * 0.02),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: (size.width < ThemeSizes.tiny)? CrossAxisAlignment.center : CrossAxisAlignment.start,
          children: [
            menuButton(Icons.home_work_outlined, "Home", textStyle, size),
            menuButton(Icons.notifications_active_outlined, "News", textStyle, size),
            menuButton(Icons.star_outline_rounded, "Trends", textStyle, size),
            menuButton(Icons.bookmark_outline_rounded, "Saved", textStyle, size),
            menuButton(Icons.calendar_today_outlined, "Events", textStyle, size),
            menuButton(Icons.person_outline_rounded, "Profile", textStyle, size),
            menuButton(Icons.message_outlined, "Chats", textStyle, size),
            menuButton(Icons.more_horiz, "More", textStyle, size),
          ],
        )
      )
    );
  }
}