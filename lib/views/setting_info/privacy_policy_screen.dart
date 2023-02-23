import 'package:cms_app/controller/privacy_controller.dart';
import 'package:cms_app/widgets/app_bar_widget.dart';
import 'package:cms_app/widgets/app_text.dart';
import 'package:cms_app/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: "terms_of_use".tr,),
      body: GetBuilder<PrivacyController>(
        builder:(controller)=> controller.isLoading? const LoadingWidget():SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: AppText(controller.privacyData??"", maxLines: 1000,),
          ),
        ),
      ),
    );
  }
}
