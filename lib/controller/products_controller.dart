import 'dart:developer';

import 'package:bot_toast/bot_toast.dart';
import 'package:cms_app/data/api_response/products_response.dart';
import 'package:cms_app/data/models/product_category_model.dart';
import 'package:cms_app/data/models/product_model.dart';
import 'package:get/get.dart';

import '../data/api_response/product_category_response.dart';
import '../helper/constants.dart';
import '../helper/ui.dart';
import '../services/network/api_service.dart';

class ProductsController extends GetxController {
  bool _isLoading = true;

  bool get isLoading => _isLoading;

  List<ProductModel> productsList = [];
  List<ProductCategory> productCategories = [];

  void updateLoading(bool value) {
    _isLoading = value;
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    fetchAllProducts();
    super.onInit();
  }

  Future<void> fetchProductsCategories() async {
    updateLoading(true);
    final response = await ApiService.get(productCategoriesPath);
    if (response.statusCode == 200) {
      ProductCategoriesResponse categoriesResponse =
          ProductCategoriesResponse.fromJson(response.data);
      productCategories = categoriesResponse.data?.categories ?? [];
      log("productsList==> ${productsList.length}");
    } else {
      Get.showSnackbar(Ui.errorSnackBar(message: response.data['message']));
    }
    updateLoading(false);
  }

  Future<void> fetchAllProducts() async {
    updateLoading(true);
    final response = await ApiService.get(productsPath);
    if (response.statusCode == 200) {
      ProductsResponse productsResponse =
          ProductsResponse.fromJson(response.data);
      productsList = productsResponse.data?.products ?? [];
      log("productsList==> ${productsList.length}");
    } else {
      Get.showSnackbar(Ui.errorSnackBar(message: response.data['message']));
    }
    updateLoading(false);
  }

  Future<void> makeProductReview(Map<String, dynamic> body) async {
    BotToast.showLoading();
    final response = await ApiService.post(productsPath, body: body);
    BotToast.closeAllLoading();
    if (response.statusCode == 200) {
      Get.back();
      Get.showSnackbar(Ui.successSnackBar(message: response.data['message']));
    } else {
      Get.showSnackbar(Ui.errorSnackBar(message: response.data['message']));
    }
  }
}
