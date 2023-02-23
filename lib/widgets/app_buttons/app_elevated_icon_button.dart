import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AppElevatedIconButton extends StatelessWidget {
  final String text;
  final String iconPath;
  final Color? textColor;
  final Color? backgroundColor;
  final bool? centerText;
  final double? fontSize;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final VoidCallback? onPressed;

  const AppElevatedIconButton({
    Key? key,
    required this.text,
    required this.iconPath,
    this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.centerText,
    this.fontSize,
    this.fontFamily = "Cairo",
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        textStyle: TextStyle(fontFamily:"Cairo", fontSize: fontSize, color: textColor??Colors.white),
        primary: backgroundColor?? Theme.of(context).primaryColor, //background color
        onPrimary: Colors.white,
        elevation: 2.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onPressed: onPressed,
      icon: SvgPicture.asset(iconPath),
      label: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3.0),
        child: Text(text),
      ), // <-- Text
    );
  }
}
