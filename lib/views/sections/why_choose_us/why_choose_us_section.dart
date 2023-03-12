import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/why_choose_us_controller.dart';
import '../../../helper/appTheme.dart';
import '../../../widgets/appCachedImage.dart';
import '../../../widgets/app_text.dart';
import '../../../widgets/empty_list_widget.dart';
import '../../../widgets/loading_widget.dart';
import '../../home/tabs/home/widgets/header_title_widget.dart';

class WhyChooseUsSection extends StatelessWidget {
  const WhyChooseUsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WhyChooseUsController>(
      builder:(controller)=> controller.isLoading? const LoadingWidget(): controller.whyChooseUsSectionList.isNotEmpty?Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // HeaderTitleWidget(title: "why_choose_us".tr,),
          Center(child: AppCachedImage(imageUrl: controller.whyChooseUsImage?.value??"", width: 260, height: 220, fit: BoxFit.contain,)),
          const SizedBox(height: 10,),
          Center(child: AppText(controller.whyChooseUsTitle?.value??"", fontSize: 17, color: AppTheme.primaryColor,)),
          const SizedBox(height: 8),
          AppText(controller.whyChooseUsSubTitle?.value??"", color: Colors.black54, maxLines: 100,),
          AppText("description".tr, underLine: true, fontSize: 16,),
          AppText(controller.whyChooseUsDescription?.value??"", color: Colors.black54, maxLines: 100,),
          const SizedBox(height: 6),
        ],
      ): const EmptyWidget(iconPath: "iconPath", displayTxt: "WhyChooseUs section empty"),
    );
  }
}
