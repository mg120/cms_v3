import 'dart:developer';

import 'package:cms_app/data/api_response/events_response.dart';
import 'package:get/get.dart';

import '../data/models/event_model.dart';
import '../helper/constants.dart';
import '../helper/ui.dart';
import '../services/network/api_service.dart';

class EventsController extends GetxController{
  List<EventModel> _events = [];
  List<EventModel> get events => _events;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  @override
  void onInit() {
    // TODO: implement onInit
    fetchAllEvents();
    super.onInit();
  }

  void updateLoading(bool value){
    _isLoading = value;
    update();
  }

  Future<void> fetchAllEvents() async{
    updateLoading(true);
    final response = await ApiService.get(eventsPath);
    if(response.statusCode==200){
      EventsResponse blogsResponse = EventsResponse.fromJson(response.data);
      _events = blogsResponse.data?.events??[];
      log("Events==> ${_events.length}");
    } else{
      Get.showSnackbar(Ui.errorSnackBar(message: response.data['message']));
    }
    updateLoading(false);
  }
}