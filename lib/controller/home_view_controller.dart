import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/api_response/allSlider_response.dart';
import '../data/api_response/services_response.dart';
import '../data/models/service_model.dart';
import '../data/models/slider_model.dart';
import '../helper/constants.dart';
import '../helper/ui.dart';
import '../services/network/api_service.dart';

class HomeViewController extends GetxController{
  bool _isLoading = true;
  bool get isLoading => _isLoading;

  List<SliderModel> sliderList = [];
  List<ServiceModel> services = [];

  @override
  void onInit() {
    // TODO: implement onInit
    loadHomeData();
    super.onInit();
  }

  void updateLoading(bool value) {
    _isLoading = value;
    update();
  }

  void loadHomeData() async{
    updateLoading(true);
    await fetchAllSliders();
    await fetchAllServices();
    // await fetchAllCategories();
    updateLoading(false);
  }

  Future<void> fetchAllSliders() async{
    final response = await ApiService.get(slidersPath);
    if(response.statusCode==200){
      AllSlidersResponse allSlidersResponse = AllSlidersResponse.fromJson(response.data);
      sliderList = allSlidersResponse.data?.sliders??[];
      log("sliderList=> ${sliderList.length}");
    } else{
      Get.showSnackbar(Ui.errorSnackBar(message: response.data['message']));
    }
  }

  Future<void> fetchAllServices() async{
    final response = await ApiService.get(servicesPath);
    if(response.statusCode==200){
      ServicesResponse servicesResponse = ServicesResponse.fromJson(response.data);
      services = servicesResponse.data?.services??[];
      log("services=> ${services.length}");
    } else{
      Get.showSnackbar(Ui.errorSnackBar(message: response.data['message']));
    }
  }

  Future<void> fetchAllCategories() async{
    final response = await ApiService.get(categoriesPath);
    if(response.statusCode==200){

    } else{
      Get.showSnackbar(Ui.errorSnackBar(message: response.data['message']));
    }
  }
}