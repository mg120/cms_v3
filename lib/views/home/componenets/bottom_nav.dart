import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:pandabar/pandabar.dart';

import '../../../controller/main_screen_controller.dart';
import '../../../helper/appTheme.dart';


class BottomNav extends StatelessWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      builder:(controller)=> PandaBar(
        buttonSelectedColor: Colors.white,
        backgroundColor: AppTheme.primaryColor,
        // fabColors: [Color(0xFFECDCFF), Color(0xFFECDCFF)],
        fabIcon: Icon(MaterialCommunityIcons.grill_outline, color: AppTheme.secondaryColor, size: 24,),
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
              icon: Icons.chat,
              title: "Chats".tr,
          ),
          PandaBarButtonData(
              id: 3,
              icon: Icons.person,
              title: "Account".tr,
          ),
        ],
        onChange: (id) {
          // controller.changePage(id);
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