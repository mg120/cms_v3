import 'package:cms_app/data/models/testimonial_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../helper/appTheme.dart';
import '../../../widgets/appCachedImage.dart';
import '../../../widgets/app_text.dart';
import '../testimonial_detials_screen.dart';

class TestimonialItemWidget extends StatelessWidget {
  const TestimonialItemWidget({Key? key, required this.testimonialModel}) : super(key: key);
  final TestimonialModel testimonialModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:()=> Get.to(()=> TestimonialDetailsScreen(testimonialModel: testimonialModel)),
      child: Container(
        padding: const EdgeInsets.all(4.0),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(16.0)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 2.0,
              ),
            ]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppCachedImage(imageUrl: testimonialModel.image ?? "",
                width: double.infinity,
                height: 168,
                radius: 8.0, fit: BoxFit.fitHeight,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    testimonialModel.title ?? "", maxLines: 2,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w600,
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
                            "job".tr,
                            maxLines: 1,
                            fontSize: 13,
                          ),
                          const SizedBox(
                            width: 6.0,
                          ),
                          AppText(
                            testimonialModel.job??"",
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
                      //       "minimum_amount".tr,
                      //       maxLines: 1,
                      //       fontSize: 13,
                      //     ),
                      //     const SizedBox(
                      //       width: 3.0,
                      //     ),
                      //     AppText(
                      //       "${donationModel.minimumAmount}\$",
                      //       maxLines: 1,
                      //       color: AppTheme.primaryColor,
                      //       fontSize: 14,
                      //     ),
                      //   ],
                      // ),
                    ],
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
                  Text(testimonialModel.description?? "", maxLines: 4, style: const TextStyle(
                      fontSize: 14,
                      height: 1.4,
                      color: Colors.black54),
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
