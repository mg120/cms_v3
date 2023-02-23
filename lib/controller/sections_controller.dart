import 'dart:developer';

import 'package:cms_app/helper/constants.dart';
import 'package:cms_app/services/network/api_service.dart';
import 'package:get/get.dart';

import '../data/models/section_item_model.dart';

class SectionsController extends GetxController{
  bool _isLoading = true;
  bool get isLoading => _isLoading;
  List<SectionItem> sectionsList = [];

  void updateLoading(bool value){
    _isLoading = value;
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  Future<void> getSectionByType(String type)async{
    updateLoading(true);
    final response = await ApiService.get(sectionByTypePath+type);
    log("response==> ${response.data}");
    if(response.statusCode==200 && response.data['status']){
      // SectionResponse sectionResponse = SectionResponse.f
      // SectionResponse = response.data['data']['about'];
    }
    updateLoading(false);
  }
}