import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../controller/who_we_are_controller.dart';
import '../../../helper/appTheme.dart';
import '../../../widgets/appCachedImage.dart';
import '../../../widgets/app_text.dart';
import '../../../widgets/empty_list_widget.dart';
import '../../../widgets/loading_widget.dart';
import '../../home/tabs/home/widgets/header_title_widget.dart';

class WhoWeAreSection extends StatelessWidget {
  const WhoWeAreSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GetBuilder<WhoWeAreController>(
      init: WhoWeAreController(),
      builder:(controller)=> controller.isLoading? const LoadingWidget(): controller.experienceSectionList.isNotEmpty?Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // HeaderTitleWidget(title: "who_we_are".tr,),
          Center(child: AppCachedImage(imageUrl: controller.whoWeAreImage?.value??"",
            width: size.width, height: 220, fit: BoxFit.cover, radius: 16,)),
          const SizedBox(height: 10,),
          Center(child: AppText(controller.whoWeAreTitle?.value??"", fontSize: 17, color: AppTheme.primaryColor,)),
          const SizedBox(height: 6),
          AppText(controller.whoWeAreSubTitle?.value??"", color: Colors.black54, maxLines: 100,),
          AppText("description".tr, underLine: true, fontSize: 16,),
          AppText(controller.whoWeAreDescription?.value??"", color: Colors.black54, maxLines: 100,),
          const SizedBox(height: 6),
        ],
      ): const EmptyWidget(iconPath: "iconPath", displayTxt: "Experience section empty"),
    );
  }
}
