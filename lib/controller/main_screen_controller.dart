import 'dart:developer';
import 'package:cms_app/views/auth/login/login_screen.dart';
import 'package:cms_app/views/faqs/faqs_screen.dart';
import 'package:cms_app/views/home/tabs/categories/categories_view.dart';
import 'package:cms_app/views/home/tabs/home/home_view.dart';
import 'package:cms_app/views/home/tabs/profile/profile_view.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../views/blogs/blogs_view.dart';
import '../views/courses/courses_screen.dart';
import '../views/events/events_screen.dart';
import '../views/products/products_screen.dart';


class MainController extends GetxController{
  int _selectedNavIndex = 0;
  int get selectedNavIndex => _selectedNavIndex;

  void updateNavIndex(int index){
    _selectedNavIndex = index;
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  final List<Widget> _userHomeChildren = [
    HomeView(),
    const EventsScreen(isHomeScreen: true,),
    const CoursesScreen(isHomeScreen: true,),
    const LoginScreen(),
  ];
  List<Widget> get children => _userHomeChildren;
}