import 'package:cms_app/data/models/testimonial_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helper/appTheme.dart';
import '../../widgets/appCachedImage.dart';
import '../../widgets/app_bar_widget.dart';
import '../../widgets/app_text.dart';

class TestimonialDetailsScreen extends StatelessWidget {
  const TestimonialDetailsScreen({Key? key, required this.testimonialModel}) : super(key: key);
  final TestimonialModel testimonialModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: "testimonial_details".tr),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1.0,
              child: AppCachedImage(imageUrl: testimonialModel.image ?? "",
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.fitHeight,
                  radius: 16.0),
            ),
            const SizedBox(height: 10),
            AppText(testimonialModel.title??"", fontSize: 17, color: AppTheme.primaryColor,),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 4.0),
              child: Divider(color: Colors.black54,),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppText(
                  "job".tr,
                  maxLines: 1,
                  fontSize: 14,
                ),
                const SizedBox(
                  width: 6.0,
                ),
                AppText(
                  "${testimonialModel.job}",
                  maxLines: 1,
                  color: AppTheme.primaryColor,
                  fontSize: 15,
                ),
              ],
            ),
            const SizedBox(height: 8,),
            AppText(
              "content".tr, maxLines: 1,
              fontSize: 15.0,
              fontWeight: FontWeight.w500,
              underLine: true,
            ),
            Text(testimonialModel.description??"", style: const TextStyle(
                fontSize: 14,
                height: 1.4,
                color: Colors.black54),
            ),
            const SizedBox(height: 36.0,),
          ],
        ),
      ),
    );
  }
}
