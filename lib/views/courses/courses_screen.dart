import 'package:cms_app/controller/courses_controller.dart';
import 'package:cms_app/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/empty_list_widget.dart';
import '../../widgets/loading_widget.dart';
import 'widgets/build_course_widget.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({Key? key, this.isHomeScreen=false}) : super(key: key);
  final bool isHomeScreen;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title:"courses".tr,
        centerTitle: isHomeScreen,
        isBackActive: !isHomeScreen,
      ),
      body: GetBuilder<CoursesController>(
        init: CoursesController(),
        builder: (controller) => controller.isLoading
            ? const LoadingWidget()
            : controller.courses.isNotEmpty
            ? ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 6.0),
          scrollDirection: Axis.vertical,
          itemCount: controller.courses.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return BuildCourseWidget(
              index: index,
              courseModel: controller.courses[index],
            );
          },
          separatorBuilder: (ctx, index) {
            return const SizedBox(
              height: 10,
            );
          },
        ) : EmptyWidget(
            iconPath: "iconPath", displayTxt: "no_courses_founded".tr),
      ),
    );
  }
}
