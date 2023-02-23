import 'package:flutter/material.dart';

import '../app_text.dart';

class AppOutlinedButton extends StatelessWidget {
  final String text;
  final Color? textColor;
  final bool? centerText;
  final double? fontSize;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final VoidCallback? onPressed;

  const AppOutlinedButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.textColor,
    this.centerText,
    this.fontSize,
    this.fontFamily,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: onPressed == null
          ? OutlinedButton.styleFrom(
              primary: Colors.grey,
              textStyle: TextStyle(
                fontFamily: fontFamily,
                fontSize: fontSize,
                fontWeight: fontWeight,
              ),
            )
          : OutlinedButton.styleFrom(
              textStyle: TextStyle(
                fontFamily: fontFamily,
                fontSize: fontSize,
                fontWeight: fontWeight,
              ),
              primary: textColor ?? Colors.black,
              backgroundColor: Colors.white,
              elevation: 2.0,
              side: BorderSide(color: textColor ?? Colors.black, width: 1.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        child: AppText(
          text,
          color: textColor,
          fontSize: fontSize ?? 14,
          fontWeight: fontWeight ?? FontWeight.bold,
        ),
      ),
    );
  }
}
