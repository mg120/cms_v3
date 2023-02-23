import 'dart:developer';
import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import '../helper/constants.dart';
import '../services/network/api_service.dart';

class ApplyJobController extends GetxController{
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  File? cvFile;

  Future<void> applyJob(int jobId) async{
    if(cvFile == null){
      BotToast.showText(text: "please, add your c.v first");
      return;
    }
    BotToast.showLoading();
    Map<String, dynamic> body = {
      "job_id": jobId,
      "name": nameController.text.trim(),
      "phone": phoneController.text.trim(),
      "email": emailController.text.trim(),
      "description": descriptionController.text.trim(),
      "file": await dio.MultipartFile.fromFile(cvFile?.path?? "") ,
    };
    log("Body==> ${body.toString()}");
    final response = await ApiService.post(jobApplyPath, body: body);
    BotToast.closeAllLoading();
    log("response==> ${response.data}");
    if(response.statusCode == 200){

    }else{

    }
  }
}