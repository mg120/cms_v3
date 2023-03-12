import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:pandabar/pandabar.dart';

import '../../../controller/main_screen_controller.dart';
import '../../../helper/appTheme.dart';
import '../../../helper/icon_broken.dart';


class BottomNav extends StatelessWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      builder:(controller)=> PandaBar(
        buttonSelectedColor: AppTheme.secondaryColor,
        backgroundColor: AppTheme.primaryColor,
        buttonColor: Colors.white,
        fabColors: [AppTheme.secondaryColor, AppTheme.secondaryColor],
        fabIcon: const Icon(MaterialCommunityIcons.grill_outline, color: Colors.white, size: 24,),
        buttonData: [
          PandaBarButtonData(
              id: 0,
              icon: Icons.home,
              title: "Home".tr,
          ),
          PandaBarButtonData(
              id: 1,
              icon: Icons.calendar_month,
              title: "Events".tr,
          ),
          PandaBarButtonData(
              id: 2,
              icon: IconBroken.editSquare,
              title: "Courses".tr,
          ),
          PandaBarButtonData(
              id: 3,
              icon: Icons.person,
              title: "Account".tr,
          ),
        ],
        onChange: (id) {
          log("Id==> $id}");
          controller.updateNavIndex(id);
        },
        onFabButtonPressed: () {
          log("fab clicked..");
          // controller.changeCurrentPage(4);
          // controller.update();
        },
      ),
    );
  }
}