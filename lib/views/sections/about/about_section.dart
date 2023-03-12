import 'package:cms_app/helper/appTheme.dart';
import 'package:cms_app/widgets/appCachedImage.dart';
import 'package:cms_app/widgets/app_text.dart';
import 'package:cms_app/widgets/empty_list_widget.dart';
import 'package:cms_app/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/about_section_controller.dart';
import '../../home/tabs/home/widgets/header_title_widget.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GetBuilder<AboutSectionController>(
        builder:(controller)=> controller.isLoading? const LoadingWidget(): controller.aboutSectionList.isNotEmpty?Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // HeaderTitleWidget(title: "about".tr,),
            Center(child: AppCachedImage(imageUrl: controller.aboutSectionList[8].value??"", width: 260, height: 220, fit: BoxFit.contain,)),
            const SizedBox(height: 10,),
            Center(child: AppText(controller.aboutSectionList[0].value??"", fontSize: 17, color: AppTheme.primaryColor,)),
            const SizedBox(height: 8),
            AppText(controller.aboutSectionList[1].value??"", color: Colors.black54, maxLines: 100,),
            AppText("description".tr, underLine: true, fontSize: 16,),
            AppText(controller.aboutSectionList[2].value??"", color: Colors.black54, maxLines: 100,),
            const SizedBox(height: 6),
            Row(
              children: [
                const AppText("text"),
                const SizedBox(width: 8.0,),
                Expanded(child: Container(
                  width: 300,
                  height: 12,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: const ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    child: LinearProgressIndicator(
                      value: 0.7,
                      valueColor: AlwaysStoppedAnimation<Color>(Color(0xff00ff00)),
                      backgroundColor: Color(0xffD6D6D6),
                    ),
                  ),
                ),),
              ],
            ),

            const SizedBox(height: 6),
            // Container(
            //   width: 300,
            //   height: 14,
            //   child: ClipRRect(
            //     borderRadius: BorderRadius.all(Radius.circular(8)),
            //     child: LinearProgressIndicator(
            //       value: 0.7,
            //       valueColor: AlwaysStoppedAnimation<Color>(Color(0xff00ff00)),
            //       backgroundColor: Color(0xffD6D6D6),
            //     ),
            //   ),
            // ),
          ],
        ): const EmptyWidget(iconPath: "iconPath", displayTxt: "About section empty"),
      ),
    );
  }
}
