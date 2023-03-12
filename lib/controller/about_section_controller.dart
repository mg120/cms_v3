import 'dart:developer';

import 'package:get/get.dart';

import '../data/api_response/section_response.dart';
import '../data/models/section_item_model.dart';
import '../helper/constants.dart';
import '../services/network/api_service.dart';

class AboutSectionController extends GetxController{
  bool _isLoading = true;
  bool get isLoading => _isLoading;
  List<SectionItem> aboutSectionList = [];
  SectionItem? aboutTitle;
  SectionItem? aboutSubTitle;
  SectionItem? aboutDescription;
  SectionItem? aboutImage;
  SectionItem? aboutLink;
  SectionItem? aboutSectionStatus;

  void updateLoading(bool value){
    _isLoading = value;
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    fetchAboutSection();
    super.onInit();
  }

  Future<void> fetchAboutSection()async{
    updateLoading(true);
    final response = await ApiService.get(aboutSectionPath);
    log("response==> ${response.data}");
    SectionsResponse sectionResponse = SectionsResponse.fromJson(response.data);
    if(response.statusCode==200 && response.data['success']){
      aboutSectionList = sectionResponse.data??[];
      aboutSectionList.forEach((element) {
       if (element.key == "about_section_status") {
          aboutSectionStatus = element;
        }
      });
    }
    updateLoading(false);
  }

}