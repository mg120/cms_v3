import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LocalStorage {
  static const String languageKey = 'language';
  static const String apiToken = 'token';
  static const String apiTokenType = 'token_type';
  static const String allowNotificationKey = 'notification';
  static const String currencyKey = 'currency';

  static init() async {
    await GetStorage.init();
    log("deviceLocale=> ${Get.deviceLocale?.languageCode}");
    if (GetStorage().read(languageKey) == null) {
      // String langCode = 'ar';
      String langCode = (Get.deviceLocale?.languageCode ?? 'en');
      if (langCode == 'ar' || languageCode == 'en') {
        await setString(languageKey, langCode);
      } else {
        await setString(languageKey, 'ar');
      }
    }
  }

  static bool get isLoggedIn => getString(apiToken) != null;

  static bool get isAr => GetStorage().read(languageKey) == 'ar';

  static String get languageCode => GetStorage().read(languageKey) ?? 'en';

  /// =============================================================
  static Future setString(String key, String? value) async {
    await GetStorage().write(key, value);
    if (kDebugMode) {
      print('saved key: $key with value: $value');
    }
  }

  static String? getString(String key) {
    String? value = GetStorage().read(key);
    return value;
  }

  static Future setBool(String key, bool value) async {
    await GetStorage().write(key, value);
    if (kDebugMode) {
      print('saved key: $key with value: $value');
    }
  }

  static bool getBool(String key) {
    bool? value = GetStorage().read(key);
    return value ?? false;
  }

  static setInt(String key, int value) async {
    await GetStorage().write(key, value);
    if (kDebugMode) {
      print('saved key: $key with value: $value');
    }
  }

  static int getInt(String key) {
    return GetStorage().read(key) ?? 0;
  }

  static Future<void> signOut() async {
    await GetStorage().erase();
    // Get.offAll(() => const LoginScreen());
    if (kDebugMode) {
      print('You logged out');
    }
  }

  // static Future<bool> saveUser(UserResponse? userResponse) async {
  //   if (userResponse?.accessToken != null) {
  //     await setString(apiToken, userResponse?.accessToken);
  //     await setString(apiTokenType, userResponse?.tokenType);
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }
}
