import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/solutions_section_controller.dart';
import '../../../helper/appTheme.dart';
import '../../../widgets/appCachedImage.dart';
import '../../../widgets/app_text.dart';
import '../../../widgets/empty_list_widget.dart';
import '../../../widgets/loading_widget.dart';
import '../../home/tabs/home/widgets/header_title_widget.dart';

class SolutionsSections extends StatelessWidget {
  const SolutionsSections({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SolutionsSectionController>(
      init: SolutionsSectionController(),
      builder:(controller)=> controller.isLoading? const LoadingWidget(): controller.solutionsSectionList.isNotEmpty?Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // HeaderTitleWidget(title: "solutions".tr),
          Center(child: AppCachedImage(imageUrl: controller.solutionsImage?.value??"", width: 260, height: 220, fit: BoxFit.contain,)),
          const SizedBox(height: 10,),
          Center(child: AppText(controller.solutionsImage?.value??"", fontSize: 17, color: AppTheme.primaryColor,)),
          const SizedBox(height: 8),
          AppText(controller.solutionsSubTitle?.value??"", color: Colors.black54, maxLines: 100,),
          AppText("description".tr, underLine: true, fontSize: 16,),
          AppText(controller.solutionsDescription?.value??"", color: Colors.black54, maxLines: 100,),
          const SizedBox(height: 6),
        ],
      ): const EmptyWidget(iconPath: "iconPath", displayTxt: "Solutions section empty"),
    );
  }
}
