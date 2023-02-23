
import 'package:cms_app/controller/about_controller.dart';
import 'package:cms_app/controller/blogs_controller.dart';
import 'package:cms_app/controller/categories_controller.dart';
import 'package:cms_app/controller/courses_controller.dart';
import 'package:cms_app/controller/home_view_controller.dart';
import 'package:cms_app/controller/login_controller.dart';
import 'package:cms_app/controller/main_screen_controller.dart';
import 'package:cms_app/controller/notifications_controller.dart';
import 'package:cms_app/controller/privacy_controller.dart';
import 'package:cms_app/controller/profile_controller.dart';
import 'package:get/get.dart';

import '../controller/apply_job_controller.dart';
import '../controller/events_controller.dart';
import '../controller/faqs_controller.dart';
import '../controller/jobs_controller.dart';
import '../controller/onboarding_controller.dart';
import '../controller/partners_controller.dart';
import '../controller/portfolios_controller.dart';
import '../controller/products_controller.dart';

class GetBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnBoardingController>(() => OnBoardingController());
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<PartnerController>(() => PartnerController());
    Get.lazyPut<MainController>(() => MainController());
    Get.lazyPut<ProfileController>(() => ProfileController());
    Get.lazyPut<HomeViewController>(() => HomeViewController());
    Get.lazyPut<CategoriesController>(() => CategoriesController());
    Get.lazyPut<BlogsController>(() => BlogsController());
    Get.lazyPut<PortfoliosController>(() => PortfoliosController());
    Get.lazyPut<EventsController>(() => EventsController());
    Get.lazyPut<CoursesController>(() => CoursesController());
    Get.lazyPut<ProductsController>(() => ProductsController());
    Get.lazyPut<JobsController>(() => JobsController());
    Get.lazyPut<ApplyJobController>(() => ApplyJobController());
    Get.lazyPut<NotificationsController>(() => NotificationsController());
    Get.lazyPut<FaqsController>(() => FaqsController());
    Get.lazyPut<AboutController>(() => AboutController());
    Get.lazyPut<PrivacyController>(() => PrivacyController());
  }
}
