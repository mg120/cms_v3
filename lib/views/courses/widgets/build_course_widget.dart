import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/course_model.dart';
import '../../../helper/appTheme.dart';
import '../../../widgets/appCachedImage.dart';
import '../../../widgets/app_text.dart';
import '../course_details_screen.dart';

class BuildCourseWidget extends StatelessWidget {
  const BuildCourseWidget({Key? key, required this.index, required this.courseModel}) : super(key: key);
  final int index;
  final CourseModel courseModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:()=> Get.to(()=> CourseDetailsScreen(courseModel: courseModel)),
      child: Container(
          padding: const EdgeInsets.all(4.0),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(16.0)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 1.0,
                ),
              ]
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppCachedImage(imageUrl: courseModel.images?[0]??"", width: double.infinity, height: 168, radius: 8.0),
              Padding(
               padding: const EdgeInsets.all(8.0),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   AppText(
                     courseModel.title??"", maxLines: 2, fontSize: 15.0, fontWeight: FontWeight.w600,
                   ),
                   const SizedBox(
                     height: 6.0,
                   ),
                   Container(
                     padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                     decoration: BoxDecoration(
                       color: AppTheme.primaryColor.withOpacity(0.3),
                       borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                     ),
                     child: AppText(
                       courseModel.category?.name?? "",
                       maxLines: 1,
                       color: AppTheme.primaryColor,
                       fontSize: 13,
                     ),
                   ),
                   const SizedBox(
                     height: 8.0,
                   ),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Row(
                         crossAxisAlignment: CrossAxisAlignment.center,
                         children: [
                           Icon(Icons.sell_outlined,
                               size: 18, color: AppTheme.primaryColor.withOpacity(0.6)),
                           const SizedBox(
                             width: 4.0,
                           ),
                           AppText(
                             "${courseModel.currentPrice}\$",
                             maxLines: 1,
                             color: AppTheme.primaryColor,
                             fontSize: 16,
                           ),
                           AppText(
                             " ${courseModel.previousPrice}\$ ",
                             maxLines: 1,
                             color: Colors.grey,
                             fontSize: 13,
                             lineThrough: true,
                           ),
                         ],
                       ),
                       Row(
                         crossAxisAlignment: CrossAxisAlignment.center,
                         children: [
                           Icon(Icons.schedule_outlined, size: 18, color: AppTheme.primaryColor.withOpacity(0.6)),
                           const SizedBox(
                             width: 4.0,
                           ),
                           AppText(
                             "${courseModel.courseDuration} hours",
                             maxLines: 1,
                             color: Colors.black,
                             fontSize: 16,
                           ),
                         ],
                       ),
                       Row(
                         crossAxisAlignment: CrossAxisAlignment.center,
                         children: const[
                           Icon(Icons.star,
                               size: 18, color: Colors.orange),
                           SizedBox(
                             width: 4.0,
                           ),
                           AppText(
                             "4.5",
                             maxLines: 1,
                             color: Colors.black,
                             fontSize: 16,
                           ),
                         ],
                       ),
                     ],
                   ),
                 ],
               ),
             )
            ],
          ),
      ),
    );
  }
}
