import 'package:cms_app/controller/jobs_controller.dart';
import 'package:cms_app/widgets/app_text.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../helper/appTheme.dart';
import '../../../../../widgets/appCachedImage.dart';
import '../../../../jobs/job_details_screen.dart';
import 'header_title_widget.dart';

class Jobs extends StatelessWidget {
  Jobs({Key? key}) : super(key: key);
  final jobsController = Get.put(JobsController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GetBuilder<JobsController>(
      builder:(controller)=> Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderTitleWidget(title: "jobs".tr),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(left: 6.0, top: 16, right: 6, bottom: 6.6),
            child: Row(
              children: List.generate(
                controller.jobsList.length,
                    (index) => GestureDetector(
                      onTap: () {
                        Get.to(()=> JobDetailsScreen(jobModel: controller.jobsList[index]));
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: DottedBorder(
                          color: AppTheme.primaryColor,
                          strokeWidth: 1,
                          radius: const Radius.circular(20),
                          borderType: BorderType.RRect,
                          child: Container(
                            width: size.width * 0.35,
                            height: 136,
                            margin: const EdgeInsets.symmetric(),
                            padding: const EdgeInsets.all(2.0),
                            // decoration: BoxDecoration(
                            //     color: Colors.white,
                            //     borderRadius: BorderRadius.all(Radius.circular(28.0)),
                            //     boxShadow:  [
                            //       BoxShadow(
                            //         color: AppTheme.secondaryColor,
                            //         spreadRadius: 0.8,
                            //         blurRadius: 2.0,
                            //         offset: Offset(0.0, 1.0),
                            //       ),
                            //     ]),
                            child: Column(
                              children: [
                                Expanded(
                                  child: AppCachedImage(imageUrl: controller.jobsList[index].photo??"",
                                      fit: BoxFit.contain, width: double.infinity, radius: 6.0,),
                                ),
                                const SizedBox(height: 6.0),
                                SizedBox(
                                  height: 36,
                                  child: Text(controller.jobsList[index].title??'', style: const TextStyle(fontSize: 12,
                                    color: Colors.black87, height: 1.5), maxLines: 2, textAlign: TextAlign.center,),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
