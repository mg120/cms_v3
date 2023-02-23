import '../models/blog_model.dart';

class BlogsResponse {
  bool? success;
  Data? data;
  String? message;

  BlogsResponse({this.success, this.data, this.message});

  BlogsResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
  }
}

class Data {
  List<BlogModel>? blogs;

  Data({this.blogs});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['blogs'] != null) {
      blogs = <BlogModel>[];
      json['blogs'].forEach((v) {
        blogs!.add(BlogModel.fromJson(v));
      });
    }
  }
}