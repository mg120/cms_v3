import 'package:cms_app/helper/appTheme.dart';
import 'package:cms_app/views/auth/login/login_screen.dart';
import 'package:cms_app/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/register_controller.dart';
import '../../../helper/get_binding.dart';
import '../../../services/settings_services.dart';
import '../../../widgets/appCachedImage.dart';
import '../../../widgets/app_buttons/app_elevated_button.dart';
import '../../../widgets/app_text_field.dart';

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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 36),
                  Center(
                    child: AppCachedImage(
                      imageUrl: Get.find<SettingsService>().appIconSettings?.plainValue??"",
                      fit: BoxFit.contain,
                      width: 260, height: 168,
                    ),
                  ),
                  const SizedBox(height: 16),
                  AppTextFormField(
                    labelText: "name".tr,
                    hintText: "enter_your_name".tr,
                    showLabel: true,
                    controller: controller.nameController,
                    keyboardType: TextInputType.name,
                    validateEmptyText: 'name_required'.tr,
                  ),
                  const SizedBox(height: 20),
                  AppTextFormField(
                    labelText: "email".tr,
                    hintText: "enter_your_email".tr,
                    showLabel: true,
                    controller: controller.emailController,
                    keyboardType: TextInputType.emailAddress,
                    validateEmptyText: 'email_required'.tr,
                  ),
                  const SizedBox(height: 20),
                  AppTextFormField(
                    showLabel: true,
                    isPassword: true,
                    labelText: "password".tr,
                    hintText: "enter_your_password".tr,
                    controller: controller.passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    validateEmptyText: 'password_required'.tr,
                  ),
                  const SizedBox(height: 28),
                  SizedBox(
                    width: double.infinity,
                    child: AppElevatedButton(
                      text: "sign_up".tr,
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
                  const SizedBox(height: 16),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const AppText("Already have account,"),
                      const SizedBox(width: 6.0,),
                      InkWell(
                          onTap:()=> Get.off(()=> const LoginScreen(), binding: GetBinding()),
                          child: AppText("Login Now", color: AppTheme.primaryColor, fontSize: 16,)),
                    ],
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
