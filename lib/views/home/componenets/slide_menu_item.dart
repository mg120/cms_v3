
import 'package:cms_app/widgets/app_text.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';

import '../../../helper/appTheme.dart';

class SlideMenuItem extends StatelessWidget {
  const SlideMenuItem({Key? key, required this.title, this.icon,required this.index,required this.isActive, required this.press}) : super(key: key);
  final String title;
  final IconData? icon;
  final VoidCallback press;
  final bool isActive;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _fullWidthPath,
            // Divider(color: AppTheme.primaryColor, height: 2, ),
            // SizedBox(height: 15,child: Text("-----------------------------------------------", style: TextStyle(color: AppTheme.primaryColor),maxLines: 1,)),
            SizedBox(
              height: 48,
              child: Stack(
                children: [
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 300),
                    height: 56,
                    width: isActive?Get.width:0,
                    left: 0,
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppTheme.primaryColor,
                      ),
                    ),),
                  SizedBox(
                    height: 48,
                    child: ListTile(
                      // tileColor: Colors.red,
                      contentPadding: EdgeInsets.symmetric(horizontal: 8),
                      visualDensity: VisualDensity(horizontal: 0, vertical: -1),
                      onTap: press,
                      leading: SizedBox(
                        width: 36,
                        height: 36,
                        child: Icon(icon, color: isActive?Colors.white: AppTheme.primaryColor,),
                      ),
                      title: Text(
                        title,
                        style: TextStyle(color: isActive? Colors.white:AppTheme.primaryColor),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
          );
  }

  Widget get _fullWidthPath {
    return DottedBorder(
      color: AppTheme.primaryColor,
      customPath: (size) {
        return Path()
          ..moveTo(0, 2)
          ..lineTo(size.width, 2);
      },
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Container(),
      ),
    );
  }
}
