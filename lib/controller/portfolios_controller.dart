import 'dart:developer';

import 'package:get/get.dart';

import '../data/api_response/portfolios_response.dart';
import '../data/models/portfolio_model.dart';
import '../helper/constants.dart';
import '../helper/ui.dart';
import '../services/network/api_service.dart';

class PortfoliosController extends GetxController{
  bool _isLoading = true;
  bool get isLoading => _isLoading;

  List<PortfolioModel> portfoliosList = [];

  void updateLoading(bool value) {
    _isLoading = value;
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    fetchPortfolios();
    super.onInit();
  }

  Future<void> fetchPortfolios() async {
    updateLoading(true);
    final response = await ApiService.get(portfoliosPath);
    if (response.statusCode == 200) {
      PortfoliosResponse portfoliosResponse = PortfoliosResponse.fromJson(response.data);
      portfoliosList = portfoliosResponse.data?.portfolios ?? [];
      log("portfoliosList==> ${portfoliosList.length}");
    } else {
      Get.showSnackbar(Ui.errorSnackBar(message: response.data['message']));
    }
    updateLoading(false);
  }
}