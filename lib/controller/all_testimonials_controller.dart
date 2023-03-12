import 'dart:developer';

import 'package:cms_app/data/models/testimonial_model.dart';
import 'package:get/get.dart';

import '../data/api_response/all_testimonials_response.dart';
import '../helper/constants.dart';
import '../helper/ui.dart';
import '../services/network/api_service.dart';

class AllTestimonialsController extends GetxController{
  List<TestimonialModel> _testimonials = [];
  List<TestimonialModel> get testimonials => _testimonials;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  @override
  void onInit() {
    // TODO: implement onInit
    fetchAllTestimonials();
    super.onInit();
  }

  void updateLoading(bool value){
    _isLoading = value;
    update();
  }

  Future<void> fetchAllTestimonials() async{
    updateLoading(true);
    final response = await ApiService.get(testimonialsPath);
    if(response.statusCode==200){
      AllTestimonialsResponse testimonialsResponse = AllTestimonialsResponse.fromJson(response.data);
      _testimonials = testimonialsResponse.data?.testimonials??[];
      log("testimonials==> ${_testimonials.length}");
    } else{
      Get.showSnackbar(Ui.errorSnackBar(message: response.data['message']));
    }
    updateLoading(false);
  }
}