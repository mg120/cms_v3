import 'package:get/get.dart';

import '../data/api_response/categories_response.dart';
import '../helper/constants.dart';
import '../helper/ui.dart';
import '../services/network/api_service.dart';

class CategoriesController extends GetxController{


  Future<void> fetchAllCategories() async{
    final response = await ApiService.get(categoriesPath);
    if(response.statusCode==200){
      // CategoriesResponse blogsResponse = CategoriesResponse.fromJson(response.data);

    } else{
      Get.showSnackbar(Ui.errorSnackBar(message: response.data['message']));
    }
  }
}