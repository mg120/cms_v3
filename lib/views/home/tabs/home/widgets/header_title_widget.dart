import 'package:cms_app/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../helper/appTheme.dart';

class HeaderTitleWidget extends StatelessWidget {
  const HeaderTitleWidget({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.symmetric(vertical: 4),
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 0),
      decoration: BoxDecoration(
        color: AppTheme.primaryColor,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: Stack(
            alignment: Alignment.topLeft,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: SizedBox(
                    height: 28,
                    child: AppText(title, color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
              ),
              const Positioned(
                bottom: 12,
                child: SizedBox(height: 15,
                    child: Text("-------------", style: TextStyle(color: Colors.white),)),
              )
            ],
          )),
          MaterialButton(
            onPressed: () {
              // Get.toNamed(Routes.CATEGORIES);
            },
            height: 34,
            shape: const StadiumBorder(),
            color: AppTheme.secondaryColor,
            elevation: 0,
            child: Text("View All".tr, style: Get.textTheme.subtitle1?.copyWith(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
