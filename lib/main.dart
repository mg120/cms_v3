import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'helper/appTheme.dart';
import 'helper/get_binding.dart';
import 'helper/language/translation.dart';
import 'services/local_storage/local_storage.dart';
import 'services/menu_service.dart';
import 'services/settings_services.dart';
import 'views/splash/splash_screen.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';

Future<void> initServices() async {
  Get.log('starting services...');
  await LocalStorage.init();
  await Get.putAsync(() => SettingsService().init());
  await Get.putAsync(() => MenuService().init());
  Get.log('All services started..');
}

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
  await initServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(AppTheme.primaryColor);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 250),
      title: Get.find<SettingsService>().titleSettings?.plainValue??"CMS",
      initialBinding: GetBinding(),
      translations: Translation(),
      locale: LocalStorage.getString(LocalStorage.languageKey)=="ar"?
      const Locale("ar", "SA"):const Locale("en", "US"),
      fallbackLocale: Locale(LocalStorage.languageCode),
      builder: BotToastInit(), //1. call BotToastInit
      navigatorObservers: [BotToastNavigatorObserver()],
      theme: AppTheme.themeData,
      home: const SplashScreen(),
    );
  }
}



