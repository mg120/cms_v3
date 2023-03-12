import 'package:cms_app/controller/login_controller.dart';
import 'package:cms_app/helper/get_binding.dart';
import 'package:cms_app/views/auth/register/register_screen.dart';
import 'package:cms_app/widgets/app_buttons/app_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../helper/appTheme.dart';
import '../../../services/settings_services.dart';
import '../../../widgets/appCachedImage.dart';
import '../../../widgets/app_text.dart';
import '../../../widgets/app_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<LoginController>(
        init: LoginController(),
        builder:(controller)=> Form(
          key: controller.loginFormKey,
          child: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              padding:
              const EdgeInsets.symmetric(horizontal: 24.0, vertical: 36.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 48,),
                  Center(
                    child: AppCachedImage(
                      imageUrl: Get.find<SettingsService>().appIconSettings?.plainValue??"",
                      fit: BoxFit.contain,
                      width: 260,
                      height: 160,
                    ),
                  ),
                  const SizedBox(height: 36),
                  AppTextFormField(
                    labelText: "email".tr,
                    hintText: "enter_your_email".tr,
                    showLabel: true,
                    controller: controller.emailController,
                    keyboardType: TextInputType.emailAddress,
                    validateEmptyText: 'email_required'.tr,
                  ),
                  const SizedBox(height: 28),
                  AppTextFormField(
                    showLabel: true,
                    isPassword: true,
                    labelText: "password".tr,
                    hintText: "password_required".tr,
                    controller: controller.passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    validateEmptyText: 'password_required'.tr,
                  ),
                  const SizedBox(height: 28),
                  SizedBox(
                    width: double.infinity,
                    child: AppElevatedButton(
                      text: "login".tr,
                      onPressed:() async{
                        if (controller.loginFormKey.currentState!.validate()) {
                          controller.loginFormKey.currentState!.save();
                          await controller.login();
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppText("not_have_account".tr),
                      const SizedBox(width: 6.0,),
                      InkWell(
                          onTap:()=> Get.off(()=> const RegisterScreen(), binding: GetBinding()),
                          child: AppText("sign_up".tr, color: AppTheme.primaryColor, fontSize: 16,)),
                    ],
                  ),
                  const SizedBox(height: 36),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
