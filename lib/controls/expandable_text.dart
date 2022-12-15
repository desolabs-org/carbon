import 'package:carbon/generated/l10n.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ExpandableText extends StatefulWidget {

  ExpandableText(
      this.content,
      {
        Key? key,
        this.maxLines = 1,
      }) : super(key: key);

  final String content;
  final int maxLines;

  @override
  ExpandableTextState createState() => ExpandableTextState();
}

class ExpandableTextState extends State<ExpandableText> with TickerProviderStateMixin {
  bool isCollapsed = true;

  void _onTapLink() {
    setState(() => isCollapsed = !isCollapsed);
  }

  TextSpan getLink() =>
      TextSpan(
          text: " \n~ " + (isCollapsed ? S.current.read_more.toLowerCase() : S.current.read_less.toLowerCase()) + " ~",
          style: Theme.of(context).textTheme.button,
          recognizer: TapGestureRecognizer()..onTap = _onTapLink
      );

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final cleanContent = widget.content.trim();
        TextPainter textPainter = TextPainter(
          text: TextSpan(text: cleanContent),
          textDirection: TextDirection.ltr,
          maxLines: widget.maxLines
        );

        textPainter.layout(minWidth: constraints.minWidth, maxWidth: constraints.maxWidth);
        final textSize = textPainter.size;

        final pos = textPainter.getPositionForOffset(Offset(textSize.width, textSize.height));

        final endIndex = textPainter.getOffsetAfter(pos.offset);

        final textSpan;
        if (textPainter.didExceedMaxLines) {
          textSpan = TextSpan(
            text: isCollapsed
                ? cleanContent.substring(0, endIndex).trim()
                : cleanContent,
            style: Theme.of(context).textTheme.bodyText1,
            children: <TextSpan>[getLink()],
          );
        } else {
          textSpan = TextSpan(
            text: cleanContent,
            style: Theme.of(context).textTheme.bodyText1,
          );
        }

        return AnimatedSize(
            duration: Duration(milliseconds: 50),
            alignment: Alignment.topLeft,
            child: RichText(
              softWrap: true,
              overflow: TextOverflow.clip,
              text: textSpan,
            )
        );
      },
    );
  }
}