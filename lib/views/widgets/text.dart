import 'package:flutter/material.dart';

class RayankarText extends StatelessWidget {
  final TextStyle? style;
  final String text;
  final Color? color;
  final FontWeight? fontWeight;
  final double? fontSize;
  final TextAlign textAlign;
  final int? maxLines;
  final bool isEnglishFont;
  final TextOverflow? overflow;

  const RayankarText(
    this.text, {
    Key? key,
    this.style,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.textAlign = TextAlign.right,
    this.maxLines,
    this.isEnglishFont = false,
    this.overflow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: ((style ?? Theme.of(context).textTheme.bodyText2)!.copyWith(
        color: color,
        fontWeight: fontWeight,
        fontSize: fontSize,
      )),
      overflow: overflow,
      textAlign: textAlign,
      maxLines: maxLines,
    );
  }
}
