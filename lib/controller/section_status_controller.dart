import 'dart:developer';

import 'package:cms_app/data/api_response/modules_status_response.dart';
import 'package:cms_app/data/models/modules_status_model.dart';
import 'package:cms_app/helper/constants.dart';
import 'package:cms_app/services/network/api_service.dart';
import 'package:get/get.dart';

class SectionStatusController extends GetxController{
  bool _isLoading = true;
  bool get isLoading => _isLoading;

  ModulesStatus? modulesStatus;

  void updateLoading(bool value){
    _isLoading = value;
    update();
  }

  Future<void> fetchAbout()async{
    updateLoading(true);
    final response = await ApiService.get(sectionStatusPath,);
    log("response==> ${response.data}");
    if(response.statusCode==200 && response.data['status']){
      ModulesStatusResponse modulesStatusResponse = ModulesStatusResponse.fromJson(response.data);
      modulesStatus = modulesStatusResponse.modulesStatus;
    }
    updateLoading(false);
  }
}