import 'package:get/get_utils/get_utils.dart';

class Validations {
  static String? email(String value) {
    if (value.isEmpty)
      return 'empty'.tr;
    else if (!value.contains('@') || !value.contains('.'))
      return 'EX: example@mail.com';
    else
      return null;
  }

  static String? any(String? value) {
    if (value!.isEmpty)
      return 'empty'.tr;
    else
      return null;
  }

  static String? phone(String value) {
    if (value.isEmpty)
      return 'empty'.tr;
    // else if (GetUtils.isPhoneNumber(value))
    //   return 'invalid_phone'.tr;
    else
      return null;
  }
}
