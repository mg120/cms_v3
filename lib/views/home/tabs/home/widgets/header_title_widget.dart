import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../helper/appTheme.dart';

class HeaderTitleWidget extends StatelessWidget {
  const HeaderTitleWidget({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 0),
      decoration: BoxDecoration(
        color: AppTheme.primaryColor,
      ),
      child: Row(
        children: [
          Expanded(child: Text(title??"", style: Get.textTheme.headline5!.copyWith(color: Colors.white))),
          MaterialButton(
            onPressed: () {
              // Get.toNamed(Routes.CATEGORIES);
            },
            height: 28,
            shape: StadiumBorder(),
            color: Color(0xFFe9d7fd).withOpacity(0.8),
            child: Text("View All".tr, style: Get.textTheme.subtitle1),
            elevation: 0,
          ),
        ],
      ),
    );
  }
}
