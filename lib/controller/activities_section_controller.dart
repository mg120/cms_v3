import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/api_response/section_response.dart';
import '../data/models/section_item_model.dart';
import '../helper/constants.dart';
import '../services/network/api_service.dart';

class ActivitiesSectionController extends GetxController{
  bool _isLoading = true;
  bool get isLoading => _isLoading;
  List<SectionItem> activitiesSectionList = [];
  SectionItem? activitiesTitle;
  SectionItem? activitiesSubTitle;
  SectionItem? activitiesDescription;
  SectionItem? activitiesImage;
  SectionItem? activitiesLink;
  SectionItem? activitiesSectionStatus;

  void updateLoading(bool value){
    _isLoading = value;
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    fetchActivitiesSection();
    super.onInit();
  }

  Future<void> fetchActivitiesSection()async{
    updateLoading(true);
    final response = await ApiService.get(aboutSectionPath);
    log("response==> ${response.data}");
    SectionsResponse sectionResponse = SectionsResponse.fromJson(response.data);
    if(response.statusCode==200 && response.data['success']){
      activitiesSectionList = sectionResponse.data??[];
      activitiesSectionList.forEach((element) {
        if(element.key=="activities_title"){
          activitiesTitle = element;
        } else if(element.key=="activities_link"){
          activitiesLink = element;
        } else if(element.key=="activities_description"){
          activitiesDescription = element;
        } else if(element.key=="activities_image"){
          activitiesImage = element;
        } else if(element.key=="activities_section_status"){
          activitiesSectionStatus = element;
        }
      });
    }
    updateLoading(false);
  }
}