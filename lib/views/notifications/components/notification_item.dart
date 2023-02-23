import 'package:cms_app/widgets/app_text.dart';
import 'package:flutter/material.dart';

import '../../../helper/appTheme.dart';

class BuildNotificationItem extends StatelessWidget {
  const BuildNotificationItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey)
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Icon(Icons.circle,color: AppTheme.primaryColor,size: 10,),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppText(
                  "Hany Tamer has added new activity to his profile, check his progress now",
                  fontSize: 14,
                  maxLines: 3,
                ),
                const SizedBox(
                  height: 5,
                ),
                AppText(
                  "13:29 PM",
                  fontSize: 12,
                  color: AppTheme.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
