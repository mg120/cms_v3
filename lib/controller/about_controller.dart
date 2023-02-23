import 'dart:developer';
import 'package:cms_app/services/network/api_service.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../data/api_response/page_response.dart';
import '../data/models/page_model.dart';
import '../helper/constants.dart';

class AboutController extends GetxController{
  PageModel? aboutPage;
  bool _isLoading= true;
  bool get isLoading=> _isLoading;

  void updateLoading(bool value){
    _isLoading = value;
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    fetchAbout();
    super.onInit();
  }

  Future<void> fetchAbout()async{
    updateLoading(true);
    final response = await ApiService.get(aboutPath,);
    log("response==> ${response.data}");
    if(response.statusCode==200){
      PageResponse pageResponse = PageResponse.fromJson(response.data);
      aboutPage = pageResponse.page;
    }
    updateLoading(false);
  }
}