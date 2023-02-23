import 'package:cms_app/controller/about_controller.dart';
import 'package:get/get.dart';

class AboutBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<AboutController>(() => AboutController());
  }
}