import 'package:cms_app/helper/appTheme.dart';
import 'package:cms_app/helper/get_binding.dart';
import 'package:cms_app/views/notifications/notifications_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../sections/sections_screen.dart';

class BuildNotificationIcon extends StatelessWidget {
  const BuildNotificationIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: () => Get.to(()=> const SectionsScreen(), binding: GetBinding()),
      onTap: () => Get.to(()=> const NotificationsScreen()),
      child: Image.asset("assets/images/notification.png",scale: 2.5, color: AppTheme.primaryColor,),
    );
  }
}
