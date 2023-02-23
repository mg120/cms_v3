import 'package:get/get.dart';

class ProfileController extends GetxController{
  bool _isCurLogin = true;
  bool get isCurLogin => _isCurLogin;

  void changeCurToLoginView(bool value){
    _isCurLogin = value;
    update();
  }
}