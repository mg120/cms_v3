import 'package:cms_app/controller/about_controller.dart';
import 'package:cms_app/widgets/app_bar_widget.dart';
import 'package:cms_app/widgets/app_text.dart';
import 'package:cms_app/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: "about".tr,),
      body: GetBuilder<AboutController>(
        builder:(controller)=> controller.isLoading? const LoadingWidget(): SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(16.0),
        child: AppText(controller.aboutPage?.description??"", maxLines: 1000,),
          ),
        ),
    );
  }
}
