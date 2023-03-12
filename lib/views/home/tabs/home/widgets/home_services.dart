import 'package:cms_app/helper/appTheme.dart';
import 'package:cms_app/widgets/app_text.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../data/models/service_model.dart';
import '../../../../../widgets/appCachedImage.dart';
import '../../../../services/services_details_screen.dart';
import 'header_title_widget.dart';

class HomeServices extends StatelessWidget {
  const HomeServices({Key? key, required this.services}) : super(key: key);
  final List<ServiceModel> services;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeaderTitleWidget(title: "services".tr,),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.only(top: 16.0, bottom: 4),
          child: Row(
            children: List.generate(
              services.length,
                  (index) => GestureDetector(
                onTap:()=> Get.to(()=> ServiceDetailsScreen(serviceModel: services[index])),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: DottedBorder(
                    color: AppTheme.primaryColor,
                    strokeWidth: 1,
                    radius: const Radius.circular(20),
                    borderType: BorderType.RRect,
                    child: Container(
                      width: Get.width * 0.28,
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                      // decoration: BoxDecoration(
                      //     color: Colors.white,
                      //     borderRadius: BorderRadius.all(Radius.circular(16.0)),
                      //     boxShadow:  [
                      //       BoxShadow(
                      //         color: AppTheme.secondaryColor,
                      //         spreadRadius: 0.8,
                      //         blurRadius: 2.0,
                      //         offset: Offset(0.0, 1.0),
                      //       ),
                      //     ]),
                      child: Column(
                        children: [
                          AppCachedImage(imageUrl: services[index].image??"", fit: BoxFit.cover, width: 48, height: 48, radius: 6.0,),
                          const SizedBox(height: 6.0),
                          AppText(services[index].title??'', maxLines: 2, fontSize: 12, color: Colors.black87, fontWeight: FontWeight.w700,),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
