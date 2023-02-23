import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/contact_us_controller.dart';
import '../../widgets/app_bar_widget.dart';
import '../../widgets/app_buttons/app_elevated_button.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: "contact_us".tr,),
      body: GetBuilder<ContactUsController>(
        builder:(controller)=> Form(
          key: controller.formKey,
          child: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                  horizontal: 24.0, vertical: 36.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 8.height,
                  // AppTextField(
                  //   textFieldType: TextFieldType.NAME,
                  //   controller: controller.fullNameController,
                  //   decoration: defaultInputDecoration(label: 'Name'),
                  // ),
                  // 8.height,
                  // AppTextField(
                  //   textFieldType: TextFieldType.EMAIL,
                  //   controller: controller.emailController,
                  //   decoration: defaultInputDecoration(label: 'Email'),
                  // ),
                  // /// message TextField
                  // AppTextField(
                  //   textFieldType: TextFieldType.MULTILINE,
                  //   controller: controller.messageController,
                  //   decoration: defaultInputDecoration(label: 'Message'),
                  //   minLines: 4,
                  // ),
                  // 8.height,
                  const SizedBox(height: 28),
                  SizedBox(
                    width: Get.width,
                    child: AppElevatedButton(
                      text: "send".tr,
                      onPressed: () async {
                        if (controller.formKey.currentState!.validate()) {
                          controller.formKey.currentState!.save();
                          await controller.sendMessage();
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
