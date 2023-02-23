import 'package:cms_app/views/notifications/notifications_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuildNotificationIcon extends StatelessWidget {
  const BuildNotificationIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(()=> const NotificationsScreen()),
      child: Image.asset("assets/icons/notifications.png",scale: 2.5),
    );
  }
}
