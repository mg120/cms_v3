import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SharedMethods {
  static String getRandomString(int length) {
    const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    Random _rnd = Random();
    String token = String.fromCharCodes(
      Iterable.generate(
        length,
        (_) => _chars.codeUnitAt(
          _rnd.nextInt(_chars.length),
        ),
      ),
    );

    return token;
  }

  static hideLoadingDialog() {
    if (Get.isDialogOpen ?? false) {
      Get.back();
    }
  }

  static showLoadingDialog() {
    Get.dialog(
      Center(
        child: Container(
          height: 90,
          width: 150,
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                child: CircularProgressIndicator(),
                width: 30,
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('loading'.tr),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static String getFileSize(File file) {
    int bytes = file.lengthSync();
    final kb = bytes / 1024;
    final mb = kb / 1024;

    return bytes >= 1024 ? '${mb.toStringAsFixed(2)} MB' : '${kb.toStringAsFixed(2)} KB';
  }

  static Future<bool> checkNetwork() async {
    // var connectivityResult = await (Connectivity().checkConnectivity());
    // if (connectivityResult == ConnectivityResult.mobile) {
    //   return true;
    // } else if (connectivityResult == ConnectivityResult.wifi) {
    //   return true;
    // } else {
    //   return false;
    // }
    return false;
  }

  static String? email(String value) {
    if (value.isEmpty) {
      return 'empty'.tr;
    } else if (!value.contains('@') || !value.contains('.')) {
      return 'EX: example@mail.com';
    } else {
      return null;
    }
  }

  static String? any(String? value) {
    if ((value ?? '').isEmpty) {
      return 'empty'.tr;
    } else {
      return null;
    }
  }

  static String? phone(String value) {
    if (value.isEmpty) {
      return 'empty'.tr;
    } else if (!GetUtils.isPhoneNumber(value)) {
      return 'invalid_phone'.tr;
    } else {
      return null;
    }
  }
}
