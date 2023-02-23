import 'dart:developer';

import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../data/api_response/blogs_response.dart';
import '../data/models/blog_model.dart';
import '../helper/constants.dart';
import '../helper/ui.dart';
import '../services/network/api_service.dart';

class BlogsController extends GetxController {
// The key of the list
  final GlobalKey<AnimatedListState> blogsKey = GlobalKey();
  final GlobalKey<AnimatedListState> commentsKey = GlobalKey();

  List<BlogModel> _blogs = [];
  List<BlogModel> get blogs => _blogs;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  @override
  void onInit() {
    // TODO: implement onInit
    fetchAllBlogs();
    super.onInit();
  }

  void updateLoading(bool value){
    _isLoading = value;
    update();
  }

  Future<void> fetchAllBlogs() async{
    updateLoading(true);
    final response = await ApiService.get(blogsPath);
    if(response.statusCode==200){
      BlogsResponse blogsResponse = BlogsResponse.fromJson(response.data);
      _blogs = blogsResponse.data?.blogs??[];
      log("blogs==> ${_blogs.length}");
    } else{
      Get.showSnackbar(Ui.errorSnackBar(message: response.data['message']));
    }
    updateLoading(false);
  }

  Future<void> fetchBlogData(int blogId) async{
    final response = await ApiService.get(blogsPath +"$blogId");
    if(response.statusCode==200){
      BlogsResponse blogsResponse = BlogsResponse.fromJson(response.data);
      _blogs = blogsResponse.data?.blogs??[];
      log("blogs==> ${_blogs.length}");
    } else{
      Get.showSnackbar(Ui.errorSnackBar(message: response.data['message']));
    }
  }
}
