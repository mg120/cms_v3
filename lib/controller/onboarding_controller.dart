import 'package:cms_app/data/models/onboard_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController{
  int curPage = 0;
  PageController pageController = PageController();

  final List<OnBoardModel> _introList = [
    OnBoardModel(image: "assets/images/intro_1.png", title: "قم بإنشاء حساب أولا لتتمكن من طلب استشارة وظيفية", subTitle: ""),
    OnBoardModel(image: "assets/images/intro_2.png", title: "يمكنك طرح تفاصيل الاستشاره حيث سيجيب عليها مختص بنفس المجال", subTitle: ""),
    OnBoardModel(image: "assets/images/intro_3.png", title: "ستتمكن من متابعة استشارتك بكل سهولة", subTitle: ""),
  ];
  List<OnBoardModel> get introList=> _introList;


  // List<IntroPage> _introPagesList = [];
  // List<IntroPage> get introPagesList => _introPagesList;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  @override
  void onInit() {
    // TODO: implement onInit
    fetchOnBoardingData();
    super.onInit();
  }

  void fetchOnBoardingData() async{
    // updateLoading(true);
    // final response = await ApiService.get(onBoardingPath,);
    // log("onBoardingRs==> ${response.data}");
    // OnBoardingResponse onBoardingResponse = OnBoardingResponse.fromJson(response.data);
    // if(onBoardingResponse.status!){
    //   _introPagesList = onBoardingResponse.data!.pages!;
    //   update();
    //   log("_introPagesList==> ${_introPagesList.length}");
    // } else{
    //   log("message==> ${onBoardingResponse.message}");
    // }
    // updateLoading(false);
  }

  void updateLoading(bool value){
    _isLoading = value;
    update();
  }
}