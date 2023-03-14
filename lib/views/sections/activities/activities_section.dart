import 'package:cms_app/controller/activities_section_controller.dart';
import 'package:cms_app/helper/appTheme.dart';
import 'package:cms_app/widgets/appCachedImage.dart';
import 'package:cms_app/widgets/app_text.dart';
import 'package:cms_app/widgets/empty_list_widget.dart';
import 'package:cms_app/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../controller/about_section_controller.dart';
import '../../home/tabs/home/widgets/header_title_widget.dart';

class ActivitiesSection extends StatelessWidget {
  const ActivitiesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GetBuilder<ActivitiesSectionController>(
        builder:(controller)=> controller.isLoading? const LoadingWidget(): controller.activitiesSectionList.isNotEmpty?SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // HeaderTitleWidget(title: "about".tr,),
              Center(child: AppCachedImage(imageUrl: controller.activitiesImage?.value??"", width: 260, height: 220, fit: BoxFit.contain,)),
              const SizedBox(height: 10,),
              Center(child: AppText(controller.activitiesTitle?.value??"", fontSize: 17, color: AppTheme.primaryColor,)),
              const SizedBox(height: 8),
              AppText("description".tr, underLine: true, fontSize: 16,),
              AppText(controller.activitiesDescription?.value??"", color: Colors.black54, maxLines: 100,),
              const SizedBox(height: 28),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CircularPercentIndicator( //leaner progress bar
                      animation: true,
                      animationDuration: 1000,
                      radius: 48.0,
                      lineWidth: 12.0,
                      percent:88/100,
                      center: Text(
                        "88%",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                      footer: FittedBox(
                        child: Text(
                          "about_skill_1_percentage",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                      ),
                      circularStrokeCap: CircularStrokeCap.round,
                      progressColor: AppTheme.hoverColor,
                      backgroundColor: Colors.grey.shade400,
                    ),
                  ),
                  const SizedBox(width: 16,),
                  Expanded(
                    child: CircularPercentIndicator( //leaner progress bar
                      animation: true,
                      animationDuration: 1000,
                      radius: 48.0,
                      lineWidth: 12.0,
                      percent:70/100,
                      center: Text(
                        "70%",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                      footer: FittedBox(
                        child: Text(
                          "about_skill_2_percentage",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                      ),
                      circularStrokeCap: CircularStrokeCap.round,
                      progressColor: AppTheme.hoverColor,
                      backgroundColor: Colors.grey.shade400,
                    ),
                  ),
                  const SizedBox(width: 16,),
                  Expanded(
                    child: CircularPercentIndicator( //leaner progress bar
                      animation: true,
                      animationDuration: 1000,
                      radius: 48.0,
                      lineWidth: 12.0,
                      percent:50/100,
                      center: Text(
                        "50%",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                      footer: FittedBox(
                        child: Text(
                          "about_skill_3_percentage",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                      ),
                      circularStrokeCap: CircularStrokeCap.round,
                      progressColor: AppTheme.hoverColor,
                      backgroundColor: Colors.grey.shade400,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 28),
            ],
          ),
        ): const EmptyWidget(iconPath: "iconPath", displayTxt: "About section empty"),
      ),
    );
  }
}
