import 'package:get/get.dart';

import '../data/api_response/all_pages_response.dart';
import '../data/models/page_model.dart';
import '../helper/constants.dart';
import '../services/network/api_service.dart';

class AllPagesController extends GetxController {
  List<PageModel>? allPages;

  bool _isLoading = true;

  bool get isLoading => _isLoading;

  void updateLoading(bool value) {
    _isLoading = value;
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    fetchAllPages();
    super.onInit();
  }

  Future<void> fetchAllPages() async {
    updateLoading(true);
    final response = await ApiService.get(pagesPath);
    if (response.statusCode == 200) {
      AllPagesResponse pageResponse = AllPagesResponse.fromJson(response.data);
      allPages = pageResponse.data?.pages;
    }
    updateLoading(false);
  }
}
