import 'package:cms_app/helper/icon_broken.dart';
import 'package:cms_app/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../helper/appTheme.dart';
import '../../../services/settings_services.dart';
import '../../../widgets/appCachedImage.dart';
import 'BuildNotificationIcon.dart';

class BuildHomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      elevation: 0,
      leadingWidth: 60,
      systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      actions: const[
        BuildNotificationIcon() ,
      ],
      title: AppCachedImage(imageUrl: Get.find<SettingsService>().appIconSettings?.plainValue??"",
        radius: 0, fit: BoxFit.contain, width: 136,height: 50,),
      leading: InkWell(
        onTap: () => Scaffold.of(context).openDrawer(),
        child: Icon(
          IconBroken.category,
          size: 30,
          color: AppTheme.secondaryColor,
        ),
      ),
      // actions: actions,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(55);
}