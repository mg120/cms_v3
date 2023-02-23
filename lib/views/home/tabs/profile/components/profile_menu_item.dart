import 'package:cms_app/helper/appTheme.dart';
import 'package:cms_app/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class ProfileMenuItem extends StatelessWidget {
  const ProfileMenuItem({Key? key, required this.text,required this.icon,required this.press,}) : super(key: key);
  final String text, icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      backgroundColor: Colors.white,
      minimumSize: Size(88, 44),
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(2.0)),
      ),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextButton(
        style: flatButtonStyle,
        onPressed: press,
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              width: 18,
              color: AppTheme.primaryColor,
            ),
            const SizedBox(width: 16),
            Expanded(child: AppText(text, color: AppTheme.lightGreyTxtColor, maxLines: 1, fontSize: 16,fontWeight: FontWeight.w600,)),
            const Icon(Icons.arrow_forward_ios, color: AppTheme.lightGreyTxtColor, size: 20,)
          ],
        ),
      ),
    );
  }
}
