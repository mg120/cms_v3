import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppText extends StatelessWidget {
  final String text;
  final Color? color;
  final bool centerText;
  final int maxLines;
  final double fontSize;
  final FontWeight fontWeight;
  final bool lineThrough;
  final bool underLine;

  const AppText(
    this.text, {
    this.color,
    this.centerText = false,
    this.maxLines = 1,
    this.fontSize = 14,
    this.fontWeight = FontWeight.w500,
    this.lineThrough = false,
    this.underLine = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      textAlign: centerText ? TextAlign.center : TextAlign.start,
      style: Theme.of(context).textTheme.subtitle1!.copyWith(
          color: color ?? Theme.of(context).textTheme.subtitle1!.color,
          fontSize: fontSize,
          fontWeight: fontWeight,
          fontFamily: GoogleFonts.cairo().fontFamily,
          decoration: lineThrough
              ? TextDecoration.lineThrough
              : underLine
                  ? TextDecoration.underline
                  : TextDecoration.none,
          decorationThickness: 1,
          decorationColor: color ?? Colors.black,
          overflow: TextOverflow.ellipsis),
    );
  }
}
