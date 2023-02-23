import 'dart:developer';

import 'package:cms_app/helper/constants.dart';
import 'package:cms_app/services/network/api_service.dart';
import 'package:get/get.dart';

class PrivacyController extends GetxController{
  bool _isLoading = true;
  bool get isLoading => _isLoading;
  String? privacyData;

  void updateLoading(bool value){
    _isLoading = value;
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    fetchPrivacy();
    super.onInit();
  }

  Future<void> fetchPrivacy()async{
    updateLoading(true);
    final response = await ApiService.get(policyPath,);
    if(response.statusCode==200 && response.data['status']){
      privacyData = response.data['data']['about'];
    }
    updateLoading(false);
  }
}