import 'package:flutter/material.dart';
import 'package:tomel_news_app/constants/textstyle.dart';

class AppText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final bool multiText;
  final TextOverflow overflow;
  final Color? color;
  final bool centered;
  final int? maxLines;
  final bool softWrap;

  ///heading 1 text, fontSize = 24, fontWeight = 500
  AppText.heading1(
    this.text, {
    this.multiText = false,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.centered = false,
    this.maxLines,
    this.softWrap = false,
  }) : style = headingStyle1.copyWith(color: color);

  ///heading 2 text, fontSize = 22, fontWeight = 500
  AppText.heading2(
    this.text, {
    this.multiText = false,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.centered = false,
    this.maxLines,
    this.softWrap = false,
  }) : style = headingStyle2.copyWith(color: color);

  ///heading 3 text, fontSize = 20, fontWeight = 500
  AppText.heading3(
    this.text, {
    this.multiText = false,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.centered = false,
    this.maxLines,
    this.softWrap = false,
  }) : style = headingStyle3.copyWith(color: color);

  ///heading 4 text, fontSize = 18, fontWeight = 500
  AppText.heading4(
    this.text, {
    this.multiText = false,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.centered = false,
    this.maxLines,
    this.softWrap = false,
  }) : style = headingStyle4.copyWith(color: color);

  ///heading 5 text, fontSize = 16, fontWeight = 500
  AppText.heading5(
    this.text, {
    this.multiText = false,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.centered = false,
    this.maxLines,
    this.softWrap = false,
  }) : style = headingStyle5.copyWith(color: color);

  ///heading 6 Text, fontSize = 14, fontWeight = 500
  AppText.heading6(
    this.text, {
    this.multiText = false,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.centered = false,
    this.maxLines,
    this.softWrap = false,
  }) : style = headingStyle6.copyWith(color: color);

  ///body 1 Text, fontSize = 14, fontWeight = 400
  AppText.body1(
    this.text, {
    this.multiText = false,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.centered = false,
    this.maxLines,
    this.softWrap = false,
  }) : style = bodyStyle1.copyWith(color: color);

  ///body 2 Text, fontSize = 12, fontWeight = 400
  AppText.body2(
    this.text, {
    this.multiText = false,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.centered = false,
    this.maxLines,
    this.softWrap = false,
  }) : style = bodyStyle2.copyWith(color: color);

  ///caption Text, fontSize = 10, fontWeight = 400
  AppText.caption(
    this.text, {
    this.multiText = false,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.centered = false,
    this.maxLines,
    this.softWrap = false,
  }) : style = captionStyle.copyWith(color: color);

  ///button Text, fontSize = 13, fontWeight = 500
  AppText.button(
    this.text, {
    this.multiText = false,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.centered = false,
    this.maxLines,
    this.softWrap = false,
  }) : style = buttonStyle.copyWith(color: color);

  ///small Text, fontSize = 8, fontWeight = 400
  AppText.small(
    this.text, {
    this.multiText = false,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.centered = false,
    this.maxLines,
    this.softWrap = false,
  }) : style = smallStyle.copyWith(color: color);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: multiText || maxLines != null ? maxLines ?? 9999999999 : 1,
      overflow: overflow,
      textAlign: centered ? TextAlign.center : TextAlign.left,
      style: style,
      softWrap: softWrap,
    );
  }
}
