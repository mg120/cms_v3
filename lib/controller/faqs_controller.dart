import 'dart:developer';

import 'package:cms_app/data/api_response/faqs_response.dart';
import 'package:get/get.dart';

import '../data/models/faqs_model.dart';
import '../helper/constants.dart';
import '../helper/ui.dart';
import '../services/network/api_service.dart';

class FaqsController extends GetxController{
  bool _isLoading = true;
  bool get isLoading => _isLoading;
  List<FaqsModel> faqsList = [];

  @override
  void onInit() {
    // TODO: implement onInit
    fetchAllFaqs();
    super.onInit();
  }

  void updateLoading(bool value){
    _isLoading = value;
    update();
  }

  Future<void> fetchAllFaqs() async{
    updateLoading(true);
    final response = await ApiService.get(faqsPath);
    if(response.statusCode==200){
      FaqsResponse faqsResponse = FaqsResponse.fromJson(response.data);
      faqsList = faqsResponse.data?.faqs??[];
      log("faqsList==> ${faqsList.length}");
    } else{
      Get.showSnackbar(Ui.errorSnackBar(message: response.data['message']));
    }
    updateLoading(false);
  }
}