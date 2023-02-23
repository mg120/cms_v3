import 'package:cms_app/services/local_storage/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageData {
  final String flag;
  final String name;
  final String languageCode;

  static var selectedLanguageIndex =
      languageList().where((element) => element.languageCode == (LocalStorage.languageCode)).first;

  LanguageData(this.flag, this.name, this.languageCode);

  static List<LanguageData> languageList() {
    return <LanguageData>[
      LanguageData("🇺🇸", "English", 'en'),
      LanguageData("🇸🇦", "اَلْعَرَبِيَّةُ", "ar"),
    ];
  }

  @override
  String toString() {
    return name;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LanguageData &&
          runtimeType == other.runtimeType &&
          flag == other.flag &&
          name == other.name &&
          languageCode == other.languageCode;

  @override
  int get hashCode => flag.hashCode ^ name.hashCode ^ languageCode.hashCode;

  static Future<void> changeLanguage(LanguageData value) async {
    await Get.updateLocale(Locale(value.languageCode));
    await LocalStorage.setString(LocalStorage.languageCode, value.languageCode);
  }
}
