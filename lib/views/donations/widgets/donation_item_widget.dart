import 'package:cms_app/data/models/donation_model.dart';
import 'package:cms_app/views/donations/donations_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/course_model.dart';
import '../../../helper/appTheme.dart';
import '../../../widgets/appCachedImage.dart';
import '../../../widgets/app_text.dart';

class BuildDonationWidget extends StatelessWidget {
  const BuildDonationWidget(
      {Key? key, required this.index, required this.donationModel})
      : super(key: key);
  final int index;
  final DonationModel donationModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:()=> Get.to(()=> DonationDetailsScreen(donationModel: donationModel)),
      child: Container(
        padding: const EdgeInsets.all(4.0),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(16.0)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 1.0,
              ),
            ]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppCachedImage(imageUrl: donationModel.image ?? "",
                width: double.infinity,
                height: 168,
                radius: 8.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    donationModel.title ?? "", maxLines: 2,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox(
                    height: 6.0,
                  ),
                  AppText(
                    "content".tr, maxLines: 1,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500,
                    underLine: true,
                  ),
                  Text(donationModel.content?? "", maxLines: 4, style: const TextStyle(
                    fontSize: 14,
                    height: 1.4,
                    color: Colors.black54),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 4.0),
                    child: Divider(color: Colors.black54,),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          AppText(
                            "goal_amount".tr,
                            maxLines: 1,
                            fontSize: 13,
                          ),
                          const SizedBox(
                            width: 3.0,
                          ),
                          AppText(
                            "${donationModel.goalAmount}\$",
                            maxLines: 1,
                            color: AppTheme.primaryColor,
                            fontSize: 14,
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          AppText(
                            "minimum_amount".tr,
                            maxLines: 1,
                            fontSize: 13,
                          ),
                          const SizedBox(
                            width: 3.0,
                          ),
                          AppText(
                            "${donationModel.minimumAmount}\$",
                            maxLines: 1,
                            color: AppTheme.primaryColor,
                            fontSize: 14,
                          ),
                        ],
                      ),
                      // Row(
                      //   crossAxisAlignment: CrossAxisAlignment.center,
                      //   children: [
                      //     AppText(
                      //       "CustomAmount:",
                      //       maxLines: 1,
                      //       color: AppTheme.primaryColor,
                      //       fontSize: 16,
                      //     ),
                      //     const SizedBox(
                      //       width: 3.0,
                      //     ),
                      //     AppText(
                      //       "${donationModel.customAmount}\$",
                      //       maxLines: 1,
                      //       color: Colors.black,
                      //       fontSize: 16,
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
