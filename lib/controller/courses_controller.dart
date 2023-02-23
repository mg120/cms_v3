import 'dart:developer';

import 'package:get/get.dart';

import '../data/api_response/courses_response.dart';
import '../data/models/course_model.dart';
import '../helper/constants.dart';
import '../helper/ui.dart';
import '../services/network/api_service.dart';

class CoursesController extends GetxController{
  List<CourseModel> _courses = [];
  List<CourseModel> get courses => _courses;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  @override
  void onInit() {
    // TODO: implement onInit
    fetchAllCourses();
    super.onInit();
  }

  void updateLoading(bool value){
    _isLoading = value;
    update();
  }

  Future<void> fetchAllCourses() async{
    updateLoading(true);
    final response = await ApiService.get(coursesPath);
    if(response.statusCode==200){
      CoursesResponse blogsResponse = CoursesResponse.fromJson(response.data);
      _courses = blogsResponse.data?.courses??[];
      log("courses==> ${_courses.length}");
    } else{
      Get.showSnackbar(Ui.errorSnackBar(message: response.data['message']));
    }
    updateLoading(false);
  }
}