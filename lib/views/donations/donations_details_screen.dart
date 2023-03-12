import 'package:cms_app/data/models/donation_model.dart';
import 'package:cms_app/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helper/appTheme.dart';
import '../../widgets/appCachedImage.dart';
import '../../widgets/app_text.dart';

class DonationDetailsScreen extends StatelessWidget {
  const DonationDetailsScreen({Key? key, required this.donationModel}) : super(key: key);
  final DonationModel donationModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: "donation_details".tr),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppCachedImage(imageUrl: donationModel.image ?? "",
                width: double.infinity,
                height: 220,
                radius: 16.0),
            const SizedBox(height: 10),
            AppText(donationModel.title??"", fontSize: 17, color: AppTheme.primaryColor,),
            AppText(
              "content".tr, maxLines: 1,
              fontSize: 15.0,
              fontWeight: FontWeight.w500,
              underLine: true,
            ),
            Text(donationModel.content?? "", style: const TextStyle(
                fontSize: 14,
                height: 1.4,
                color: Colors.black54),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 4.0),
              child: Divider(color: Colors.black54,),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppText(
                  "goal_amount".tr,
                  maxLines: 1,
                  fontSize: 14,
                ),
                const SizedBox(
                  width: 6.0,
                ),
                AppText(
                  "${donationModel.goalAmount}\$",
                  maxLines: 1,
                  color: AppTheme.primaryColor,
                  fontSize: 15,
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 1.0),
              child: Divider(color: Colors.black54,),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppText(
                  "minimum_amount".tr,
                  maxLines: 1,
                  fontSize: 14,
                ),
                const SizedBox(
                  width: 6.0,
                ),
                AppText(
                  "${donationModel.minimumAmount}\$",
                  maxLines: 1,
                  color: AppTheme.primaryColor,
                  fontSize: 15,
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 1.0),
              child: Divider(color: Colors.black54,),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppText(
                  "custom_amount".tr,
                  maxLines: 1,
                  fontSize: 14,
                ),
                const SizedBox(
                  width: 6.0,
                ),
                AppText(
                  "${donationModel.customAmount}\$",
                  maxLines: 1,
                  color: AppTheme.primaryColor,
                  fontSize: 15,
                ),
              ],
            ),
            const SizedBox(height: 36.0,),
          ],
        ),
      ),
    );
  }
}
