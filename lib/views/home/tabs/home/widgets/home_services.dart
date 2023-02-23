import 'package:cms_app/widgets/app_text.dart';
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
        const HeaderTitleWidget(title: "Services",),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            children: List.generate(
              services.length,
                  (index) => GestureDetector(
                onTap:()=> Get.to(()=> ServiceDetailsScreen(serviceModel: services[index])),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      AppCachedImage(imageUrl: services[index].image??"", fit: BoxFit.cover, width: 36, height: 36, radius: 6.0,),
                      const SizedBox(height: 6.0),
                      AppText(services[index].title??'', fontSize: 12, color: Colors.black87,),
                    ],
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
