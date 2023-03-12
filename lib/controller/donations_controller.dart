import 'dart:developer';

import 'package:cms_app/data/api_response/donations_response.dart';
import 'package:cms_app/data/models/donation_model.dart';
import 'package:get/get.dart';

import '../helper/constants.dart';
import '../services/network/api_service.dart';

class DonationsController extends GetxController{
  bool _isLoading = true;
  bool get isLoading => _isLoading;
  List<DonationModel> donationsList = [];

  void updateLoading(bool value){
    _isLoading = value;
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    fetchAllDonations();
    super.onInit();
  }

  Future<void> fetchAllDonations()async{
    updateLoading(true);
    final response = await ApiService.get(donationsPath);
    log("response==> ${response.data}");
    if(response.statusCode==200 && response.data['success']){
      DonationsResponse sectionResponse = DonationsResponse.fromJson(response.data);
      donationsList = sectionResponse.data?.donations??[];
    }
    updateLoading(false);
  }

  Future<void> fetchDonationDetails()async{
    updateLoading(true);
    final response = await ApiService.get(donationsPath);
    log("response==> ${response.data}");
    if(response.statusCode==200 && response.data['status']){
      DonationsResponse sectionResponse = DonationsResponse.fromJson(response.data);
      donationsList = sectionResponse.data?.donations??[];
    }
    updateLoading(false);
  }
}