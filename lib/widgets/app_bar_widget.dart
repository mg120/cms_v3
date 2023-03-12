import 'package:cms_app/helper/appTheme.dart';
import 'package:cms_app/helper/icon_broken.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_text.dart';

class AppBarWidget extends StatelessWidget with PreferredSizeWidget{
   const AppBarWidget({Key? key, required this.title, this.centerTitle = false, this.isBackActive = true}) : super(key: key);
   final String? title;
   final bool? centerTitle;
   final bool isBackActive;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: isBackActive?InkWell(
          onTap: ()=> Get.back(),
          child: const Icon(IconBroken.arrowLeftCircle, color: Colors.white, size: 30,)):const SizedBox.shrink(),
      title: AppText(title!, fontSize: 22, color: Colors.white, fontWeight: FontWeight.w800, centerText: true,),
      centerTitle: centerTitle,
      flexibleSpace: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: <Color>[
                AppTheme.primaryColor,
                AppTheme.primaryColor,
              ],
            ),
            borderRadius: const BorderRadius.vertical(bottom: Radius.circular(16.0))
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize =>const Size.fromHeight(60.0);
}
