import 'dart:developer';
import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:cms_app/helper/constants.dart';
import 'package:cms_app/helper/ui.dart';
import 'package:cms_app/services/network/api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();


  Future<void> login() async {
    if(passwordController.text.trim().length < 6){
      Get.showSnackbar(Ui.errorSnackBar(message: "password should be more than 6 characters!",));
      return;
    }
    BotToast.showLoading();
    Map<String, dynamic> body = {
      "email": emailController.text.trim(),
      "password": passwordController.text.trim(),
    };
    log("Body==> ${body.toString()}");
    final response = await ApiService.post(loginPath, body: body);
    BotToast.closeAllLoading();
    log("response==> ${response.data}");
    // if(response.statusCode==200){
    //   LoginResponse loginResponse = LoginResponse.fromJson(response.data);
    //   await LocalStorage.setString(LocalStorage.apiToken, loginResponse.data!.user!.token);
    //   await  LocalStorage.setString(LocalStorage.loggedInType, 'user');
    //   Get.showSnackbar(Ui.successSnackBar(message: response.data['message'],));
    // } else{
    //   Get.showSnackbar(Ui.errorSnackBar(message: response.data['message'],));
    //   if(response.data['message'] == "auth.not_active"){
    //     Get.to(()=> OtpScreen(phoneNum: phoneController.text.trim(),));
    //   }
    // }
  }
}