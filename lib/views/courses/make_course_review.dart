import 'package:cms_app/widgets/rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/course_review_controller.dart';
import '../../data/models/course_model.dart';
import '../../widgets/app_bar_widget.dart';
import '../../widgets/app_buttons/app_elevated_button.dart';
import '../../widgets/app_text_field.dart';

class CourseReviewScreen extends StatelessWidget {
  const CourseReviewScreen({Key? key, required this.courseModel}) : super(key: key);
  final CourseModel courseModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: "course_review".tr,
        centerTitle: true,
      ),
      body: GetBuilder<CourseReviewController>(
        init: CourseReviewController(),
        builder:(controller)=> Form(
      key: controller.formKey,
      child: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
              horizontal: 24.0, vertical: 36.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const RatingBarWidget(rating: 2, isClicked: true, itemSize: 36, itemPadding: 4.0,),
              const SizedBox(height: 36),
              AppTextFormField(
                showLabel: true,
                labelText: "description".tr,
                hintText: "enter_your_description".tr,
                controller: controller.messageController,
                keyboardType: TextInputType.text,
                validateEmptyText: 'description_required'.tr,
                maxLines: 4,
              ),
              const SizedBox(height: 28),
              SizedBox(
                width: Get.width,
                child: AppElevatedButton(
                  text: "send".tr,
                  onPressed: () async {
                    if (controller.formKey.currentState!.validate()) {
                      controller.formKey.currentState!.save();
                      await controller.sendReview(courseModel.id??0);
                    }
                  },),
              ),
              const SizedBox(height: 28),
            ],
          ),
        ),
      ),
    ),
    ),
    );
  }
}
