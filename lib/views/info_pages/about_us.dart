import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/app_bar_widget.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: "about_us".tr,),
      body: ListView(
        children: [],
      ),
    );
  }
}
