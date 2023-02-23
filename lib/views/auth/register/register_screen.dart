import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/register_controller.dart';
import '../../../services/settings_services.dart';
import '../../../widgets/appCachedImage.dart';
import '../../../widgets/app_buttons/app_elevated_button.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<RegisterController>(
        builder:(controller)=> SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding:
            const EdgeInsets.symmetric(horizontal: 24.0, vertical: 36.0),
            child: Form(
              key: controller.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: AppCachedImage(
                      imageUrl: Get.find<SettingsService>().appIconSettings?.plainValue??"",
                      width: 128, height: 128,
                    ),
                  ),
                  const SizedBox(height: 36),
                  // AppTextField(
                  //   textFieldType: TextFieldType.NAME,
                  //   controller: controller.nameController,
                  //   decoration: defaultInputDecoration(label: 'Name'),
                  // ),
                  // /// Email TextField
                  // AppTextField(
                  //   textFieldType: TextFieldType.EMAIL,
                  //   controller: controller.emailController,
                  //   decoration: defaultInputDecoration(label: 'Email'),
                  // ),
                  // 8.height,
                  // /// Password TextField
                  // AppTextField(
                  //   textFieldType: TextFieldType.PASSWORD,
                  //   controller: controller.passwordController,
                  //   decoration: defaultInputDecoration(label: 'Password'),
                  // ),
                  const SizedBox(height: 28),
                  SizedBox(
                    width: double.infinity,
                    child: AppElevatedButton(
                      text: "register".tr,
                      onPressed:() async{
                        if (controller.formKey.currentState!.validate()) {
                          controller.formKey.currentState!.save();
                          await controller.signUp();
                          ///--------------------------
                          //   if(controller.passwordController.text.trim().length < 6){
                          //     Get.showSnackbar(Ui.ErrorSnackBar(message: "password should be more than 6 characters!",));
                          //     return;
                          //   }
                          //   BotToast.showLoading();
                          //   await LocalStorage.setString(LocalStorage.apiToken, "token token");
                          //   BotToast.closeAllLoading();
                        }
                      },
                    ),
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
