import 'dart:async';
import 'package:cms_app/helper/get_binding.dart';
import 'package:cms_app/services/settings_services.dart';
import 'package:cms_app/widgets/appCachedImage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../partners/partners_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(const Duration(seconds: 4), () {
      Get.off(() => const PartnersScreen(), binding: GetBinding());
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: AppCachedImage(
        imageUrl: Get.find<SettingsService>().appIconSettings?.plainValue??"",
        width: 260, height: 360, radius: 0, fit: BoxFit.contain,
      )),
    );
  }
}
