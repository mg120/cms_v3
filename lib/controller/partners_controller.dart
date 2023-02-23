import 'dart:developer';

import 'package:cms_app/data/models/partner_model.dart';
import 'package:get/get.dart';

import '../data/api_response/partners_response.dart';
import '../helper/constants.dart';
import '../helper/get_binding.dart';
import '../helper/ui.dart';
import '../services/network/api_service.dart';
import '../views/home/home_screen.dart';

class PartnerController extends GetxController{
  List<Partner> _partners = [];
  List<Partner> get partners => _partners;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  @override
  void onInit() {
    // TODO: implement onInit
    fetchAllPartners();
    super.onInit();
  }

  void updateLoading(bool value){
    _isLoading = value;
    update();
  }

  Future<void> fetchAllPartners() async{
    updateLoading(true);
    final response = await ApiService.get(partnersPath);
    if(response.statusCode==200){
      PartnersResponse partnersResponse = PartnersResponse.fromJson(response.data);
      _partners = partnersResponse.data?.partners??[];
      log("partners==> ${_partners.length}");
    } else{
      Get.showSnackbar(Ui.errorSnackBar(message: response.data['message']));
    }
    updateLoading(false);
  }
}