import 'dart:developer';

import 'package:get/get.dart';

import '../data/api_response/page_response.dart';
import '../data/models/page_model.dart';
import '../helper/constants.dart';
import '../services/network/api_service.dart';

class TermsController extends GetxController {
  PageModel? termsPage;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  void updateLoading(bool value) {
    _isLoading = value;
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    fetchTerms();
    super.onInit();
  }

  Future<void> fetchTerms() async {
    updateLoading(true);
    final response = await ApiService.get(termsPath);
    log("response==> ${response.data}");
    if (response.statusCode == 200) {
      PageResponse pageResponse = PageResponse.fromJson(response.data);
      termsPage = pageResponse.page;
    }
    updateLoading(false);
  }
}
