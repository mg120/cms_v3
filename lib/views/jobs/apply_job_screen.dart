import 'dart:developer';
import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/apply_job_controller.dart';
import '../../data/models/job_model.dart';
import '../../helper/appTheme.dart';
import '../../helper/constants.dart';
import '../../helper/ui.dart';
import '../../services/network/api_service.dart';
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
        init: ApplyJobController(),
        builder: (controller) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: size.width,
              padding: const EdgeInsets.only(
                  left: 16.0, top: 56.0, right: 16.0, bottom: 16.0),
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
                        labelText: "name".tr,
                        hintText: "enter_your_name".tr,
                        showLabel: true,
                        controller: controller.nameController,
                        keyboardType: TextInputType.name,
                        validateEmptyText: 'name_required'.tr,
                      ),
                      const SizedBox(height: 16),
                      AppTextFormField(
                        showLabel: true,
                        labelText: "email".tr,
                        hintText: "enter_your_email".tr,
                        controller: controller.emailController,
                        keyboardType: TextInputType.emailAddress,
                        validateEmptyText: 'email_required'.tr,
                      ),
                      const SizedBox(height: 16),
                      AppTextFormField(
                        showLabel: true,
                        labelText: "phone".tr,
                        hintText: "enter_your_phone".tr,
                        controller: controller.phoneController,
                        keyboardType: TextInputType.phone,
                        validateEmptyText: 'phone_required'.tr,
                      ),
                      const SizedBox(height: 16),
                      AppTextFormField(
                        showLabel: true,
                        labelText: "description".tr,
                        hintText: "description_required".tr,
                        controller: controller.descriptionController,
                        keyboardType: TextInputType.text,
                        validateEmptyText: 'description_required'.tr,
                        maxLines: 4,
                      ),
                    const SizedBox(height: 16),
                    InkWell(
                      onTap: ()=> pickCvFile(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/upload_img.png", width: 24, height:24,color: AppTheme.secondaryColor,),
                          const SizedBox(width: 8,),
                          AppText("add_your_cv".tr, fontSize: 17,)
                        ],
                      ),
                    ),
                    const SizedBox(height: 28),
                    SizedBox(
                          width: size.width,
                          height: 48,
                          child: AppElevatedButton(
                            text: "apply".tr,
                            onPressed: ()async{
                              if(controller.formKey.currentState!.validate()){
                                controller.formKey.currentState?.save();

                                await controller.applyJob(jobModel.id??0);
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

  void pickCvFile()async{
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      File file = File(result.files.single.path??"");
      log("pickedFile=> $file");
    } else {
      // User canceled the picker
    }
  }

  Future<void> applyJob(Map<String, dynamic> body)async{
    log("Body==> ${body.toString()}");
    final response = await ApiService.post(jobApplyPath, body: body);
    BotToast.closeAllLoading();
    if(response.statusCode==200){
      Get.back();
      Get.showSnackbar(Ui.successSnackBar(message: "request_send_successfully".tr,));
    } else{
      Get.showSnackbar(Ui.errorSnackBar(message: response.data['message'],));
    }
  }
}
