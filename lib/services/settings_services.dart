import 'dart:developer';

import 'package:cms_app/data/api_response/settings_response.dart';
import 'package:cms_app/data/models/settings_item_model.dart';
import 'package:cms_app/helper/constants.dart';
import 'package:cms_app/helper/ui.dart';
import 'package:cms_app/services/network/api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsService extends GetxService {
  SettingsItem? webTitleSettings;
  SettingsItem? titleSettings;
  SettingsItem? primaryColorSettings;
  SettingsItem? secondaryColorSettings;
  SettingsItem? hoverColorSettings;
  SettingsItem? navColorSettings;
  SettingsItem? emailSettings;
  SettingsItem? appIconSettings;

  List<SettingsItem>? settings;


  Future<SettingsService> init() async {
    await fetchSettingsData();
    return this;
  }

  ThemeData getLightTheme() {
    // TODO change font dynamically
    return ThemeData(
        primaryColor: Color(0xFF27004E),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(elevation: 0, foregroundColor: Colors.white),
        brightness: Brightness.light,
        // dividerColor: Ui.parseColor(setting.value.accentColor, opacity: 0.1),
        // focusColor: Ui.parseColor(setting.value.accentColor),
        // hintColor: Ui.parseColor(setting.value.secondColor),
        // textButtonTheme: TextButtonThemeData(
        //   style: TextButton.styleFrom(primary: Ui.parseColor(setting.value.mainColor)),
        // ),
        colorScheme: const ColorScheme.light(
          primary: Color(0xFF27004E),
          // primary: Ui.parseColor(setting.value.mainColor),
          secondary: Color(0xFF27004E),
        ),
        // textTheme: GoogleFonts.getTextTheme(
        //   _getLocale().startsWith('ar') ? 'Cairo' : 'Poppins',
        //   TextTheme(
        //     headline6: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w700, color: Ui.parseColor(setting.value.mainColor), height: 1.3),
        //     headline5: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700, color: Ui.parseColor(setting.value.secondColor), height: 1.3),
        //     headline4: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400, color: Ui.parseColor(setting.value.secondColor), height: 1.3),
        //     headline3: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700, color: Ui.parseColor(setting.value.secondColor), height: 1.3),
        //     headline2: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w700, color: Ui.parseColor(setting.value.mainColor), height: 1.4),
        //     headline1: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w300, color: Ui.parseColor(setting.value.secondColor), height: 1.4),
        //     subtitle2: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600, color: Ui.parseColor(setting.value.secondColor), height: 1.2),
        //     subtitle1: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w400, color: Ui.parseColor(setting.value.mainColor), height: 1.2),
        //     bodyText2: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w600, color: Ui.parseColor(setting.value.secondColor), height: 1.2),
        //     bodyText1: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400, color: Ui.parseColor(setting.value.secondColor), height: 1.2),
        //     caption: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w300, color: Ui.parseColor(setting.value.accentColor), height: 1.2),
        //   ),
        // )
    );
  }

  ThemeData getDarkTheme() {
    // TODO change font dynamically
    SettingsItem? primaryColor = settings?.firstWhere((element) => element.key=="primary_color");
    SettingsItem? secondaryColor = settings?.firstWhere((element) => element.key=="secondary_color");
    return ThemeData(
        primaryColor: Color(0xFF252525),
        floatingActionButtonTheme: FloatingActionButtonThemeData(elevation: 0),
        scaffoldBackgroundColor: Color(0xFF2C2C2C),
        brightness: Brightness.dark,
        // dividerColor: Ui.parseColor(setting.value.accentDarkColor, opacity: 0.1),
        // focusColor: Ui.parseColor(setting.value.accentDarkColor),
        // hintColor: Ui.parseColor(setting.value.secondDarkColor),
        // toggleableActiveColor: Ui.parseColor(setting.value.mainDarkColor),
        // textButtonTheme: TextButtonThemeData(
        //   style: TextButton.styleFrom(primary: Ui.parseColor(setting.value.mainColor)),
        // ),
        // colorScheme: ColorScheme.dark(
        //   primary: Ui.parseColor(setting.value.mainDarkColor),
        //   secondary: Ui.parseColor(setting.value.mainDarkColor),
        // ),
        // textTheme: GoogleFonts.getTextTheme(
        //     _getLocale().startsWith('ar') ? 'Cairo' : 'Poppins',
        //     TextTheme(
        //       headline6: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w700, color: Ui.parseColor(setting.value.mainDarkColor), height: 1.3),
        //       headline5: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700, color: Ui.parseColor(setting.value.secondDarkColor), height: 1.3),
        //       headline4: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400, color: Ui.parseColor(setting.value.secondDarkColor), height: 1.3),
        //       headline3: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700, color: Ui.parseColor(setting.value.secondDarkColor), height: 1.3),
        //       headline2: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w700, color: Ui.parseColor(setting.value.mainDarkColor), height: 1.4),
        //       headline1: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w300, color: Ui.parseColor(setting.value.secondDarkColor), height: 1.4),
        //       subtitle2: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600, color: Ui.parseColor(setting.value.secondDarkColor), height: 1.2),
        //       subtitle1: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w400, color: Ui.parseColor(setting.value.mainDarkColor), height: 1.2),
        //       bodyText2: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w600, color: Ui.parseColor(setting.value.secondDarkColor), height: 1.2),
        //       bodyText1: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400, color: Ui.parseColor(setting.value.secondDarkColor), height: 1.2),
        //       caption: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w300, color: Ui.parseColor(setting.value.accentDarkColor), height: 1.2),
        //     )),
    );
  }

  Future<void> fetchSettingsData() async{
    final response = await ApiService.get(settingsPath,);
    if(response.statusCode==200){
      SettingsResponse settingsResponse = SettingsResponse.fromJson(response.data);
      settings = settingsResponse.data;
      for(var item in settings!){
        log("item==> ${item.plainValue}");
        if(item.key == "WebsiteTitle"){
          webTitleSettings = item;
        } else if(item.key == "logo"){
          appIconSettings = item;
        } else if(item.key == "email"){
          emailSettings = item;
        } else if(item.key == "nav_color"){
          navColorSettings = item;
        } else if(item.key == "application_name"){
          titleSettings = item;
        } else if(item.key == "primary_color"){
          primaryColorSettings = item;
        } else if(item.key == "secondary_color"){
          secondaryColorSettings = item;
        } else if(item.key == "hover_color"){
          hoverColorSettings = item;
    }
      }
    } else{
      Get.showSnackbar(Ui.errorSnackBar(message: response.data['message'],));
    }
  }
}