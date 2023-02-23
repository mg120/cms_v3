import '../models/course_model.dart';

class CoursesResponse {
  bool? success;
  Data? data;
  String? message;

  CoursesResponse({this.success, this.data, this.message});

  CoursesResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
  }
}

class Data {
  List<CourseModel>? courses;

  Data({this.courses});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['courses'] != null) {
      courses = <CourseModel>[];
      json['courses'].forEach((v) {
        courses!.add(CourseModel.fromJson(v));
      });
    }
  }
}