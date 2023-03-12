import 'package:cms_app/controller/main_screen_controller.dart';
import 'package:cms_app/views/home/componenets/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'tabs/home/home_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop:()=> _onWillPop(context),
      child: Scaffold(
        // body: HomeView(),
        extendBody: true,
        body: Padding(
          padding: const EdgeInsets.only(bottom: 68.0),
          child: GetBuilder<MainController>(
              init: MainController(),
              builder: (controller)=>controller.children[controller.selectedNavIndex]
          ),
        ),
        bottomNavigationBar: BottomNav(),
      ),
    );
  }

  Future<bool> _onWillPop(BuildContext context) async {
    return (await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('are_you_sure'.tr),
        content: Text('exit_the_app'.tr),
        actions: <Widget>[
          TextButton(
            onPressed: () => Get.back(),
            child: Text('cancel'.tr),
          ),
          TextButton(
            onPressed: () => Get.back(),
            child: Text('ok'.tr),
          ),
        ],
      ),
    )) ?? false;
  }
}
