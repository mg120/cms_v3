import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/apply_job_controller.dart';
import '../../data/models/job_model.dart';
import '../../helper/appTheme.dart';
import '../../widgets/appCachedImage.dart';
import '../../widgets/app_buttons/app_elevated_button.dart';
import '../../widgets/app_text.dart';
import '../../widgets/app_text_field.dart';

class ApplyJobScreen extends StatelessWidget {
  const ApplyJobScreen({Key? key, required this.jobModel}) : super(key: key);
  final JobModel jobModel;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: GetBuilder<ApplyJobController>(
        builder: (controller) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: size.width,
              padding: const EdgeInsets.only(
                  left: 16.0, top: 30.0, right: 16.0, bottom: 16.0),
              decoration: BoxDecoration(
                  color: AppTheme.primaryColor,
                  borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(16.0))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: InkWell(
                        onTap: () => Get.back(),
                        child: const Icon(Icons.arrow_back_ios,
                            color: Colors.white)),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      AppCachedImage(
                        imageUrl: jobModel.photo ?? "",
                        width: 68,
                        height: 68,
                        isCircular: true,
                        borderColor: Colors.white,
                        borderWidth: 1.5,
                      ),
                      const SizedBox(width: 8.0),
                      Expanded(
                          child: AppText(
                        jobModel.title ?? "",
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        maxLines: 2,
                      )),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Form(
                key: controller.formKey,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 16.0,
                      ),
                      AppTextFormField(
                        labelText: "Name",
                        hintText: "Enter your name",
                        showLabel: true,
                        controller: controller.nameController,
                        keyboardType: TextInputType.name,
                        validateEmptyText: 'name_required'.tr,
                      ),
                      const SizedBox(height: 16),
                      AppTextFormField(
                        showLabel: true,
                        labelText: "Email",
                        hintText: "Enter your email",
                        controller: controller.emailController,
                        keyboardType: TextInputType.emailAddress,
                        validateEmptyText: 'email_required'.tr,
                      ),
                      const SizedBox(height: 16),
                      AppTextFormField(
                        showLabel: true,
                        labelText: "Phone",
                        hintText: "Enter your phone",
                        controller: controller.phoneController,
                        keyboardType: TextInputType.phone,
                        validateEmptyText: 'phone_required'.tr,
                      ),
                      const SizedBox(height: 16),
                      AppTextFormField(
                        showLabel: true,
                        labelText: "Description",
                        hintText: "Enter your description",
                        controller: controller.descriptionController,
                        keyboardType: TextInputType.text,
                        validateEmptyText: 'description_required'.tr,
                        maxLines: 4,
                      ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                      ],
                    ),
                    const SizedBox(height: 28),
                    SizedBox(
                          width: size.width,
                          height: 48,
                          child: AppElevatedButton(
                            text: "Apply",
                            onPressed: (){
                              if(controller.formKey.currentState!.validate()){
                                controller.formKey.currentState?.save();
                              }
                            },),
                          ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
