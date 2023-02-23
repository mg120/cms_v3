import 'dart:developer';

import 'package:cms_app/data/api_response/settings_response.dart';
import 'package:cms_app/data/models/settings_item_model.dart';
import 'package:cms_app/helper/constants.dart';
import 'package:cms_app/helper/ui.dart';
import 'package:cms_app/services/network/api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/api_response/all_pages_response.dart';
import '../data/models/page_model.dart';

class MenuService extends GetxService {
  List<PageModel>? allPages;


  Future<MenuService> init() async {
    await fetchAllMenus();
    await fetchAllPages();
    return this;
  }

  Future<void> fetchAllMenus() async{
    final response = await ApiService.get(settingsPath,);
    if(response.statusCode==200){
      // SettingsResponse settingsResponse = SettingsResponse.fromJson(response.data);
      // settings = settingsResponse.data;

    } else{
      Get.showSnackbar(Ui.errorSnackBar(message: response.data['message'],));
    }
  }

  Future<void> fetchAllPages() async{
    final response = await ApiService.get(pagesPath);
    if (response.statusCode == 200) {
      AllPagesResponse pageResponse = AllPagesResponse.fromJson(response.data);
      allPages = pageResponse.data?.pages;
    }
  }
}