import 'dart:developer';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../helper/constants.dart';
import '../helper/ui.dart';
import '../services/network/api_service.dart';

class ContactUsController extends GetxController{
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  Future<void> sendMessage() async{
    BotToast.showLoading();
    Map<String, dynamic> body = {
      "name": fullNameController.text.trim(),
      "phone": phoneController.text.trim(),
      "email": emailController.text.trim(),
      "message": messageController.text.trim(),
    };
    log("Body==> ${body.toString()}");
    final response = await ApiService.post(contactUsPath, body: body);
    BotToast.closeAllLoading();
    log("response==> ${response.data}");
    if(response.statusCode==200){
      Get.back();
      Get.showSnackbar(Ui.successSnackBar(message: "message_send_successfully".tr,));
    } else{
      Get.showSnackbar(Ui.errorSnackBar(message: response.data['message'],));
    }
  }
}