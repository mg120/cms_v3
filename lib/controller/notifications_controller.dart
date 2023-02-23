import 'package:get/get.dart';

import '../data/api_response/notifications_response.dart';
import '../helper/constants.dart';
import '../helper/ui.dart';
import '../services/network/api_service.dart';

class NotificationsController extends GetxController{

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  Future<void> fetchNotifications() async{
    final response = await ApiService.get(blogsPath);
    if(response.statusCode==200){
      // NotificationsResponse notificationsResponse = NotificationsResponse.fromJson(response.data);

    } else{
      Get.showSnackbar(Ui.errorSnackBar(message: response.data['message']));
    }
  }
}