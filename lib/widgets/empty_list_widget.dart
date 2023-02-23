import 'package:cms_app/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({Key? key, required this.iconPath, required this.displayTxt}) : super(key: key);
  final String iconPath;
  final String displayTxt;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(iconPath),
        const SizedBox(height: 20,),
        AppText(displayTxt, fontSize: 16, color: Colors.black,),
      ],
    );
  }
}
