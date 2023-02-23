import 'package:flutter/material.dart';

import '../../data/models/service_model.dart';
import '../../widgets/appCachedImage.dart';
import '../../widgets/app_bar_widget.dart';
import '../../widgets/app_text.dart';

class ServiceDetailsScreen extends StatelessWidget {
  const ServiceDetailsScreen({Key? key, required this.serviceModel}) : super(key: key);
  final ServiceModel serviceModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: "Service Details"),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        physics: const BouncingScrollPhysics(),
        children: [
          AppCachedImage(imageUrl: serviceModel.image??"", width: double.infinity, height: 160,
            fit: BoxFit.cover, radius: 16.0, bgColor: Colors.grey.shade300),
          const SizedBox(height: 10),
          AppText("# ${serviceModel.category?.name}", color: Colors.grey, fontSize: 15),
          const SizedBox(height: 4),
          AppText(serviceModel.title??"", fontWeight: FontWeight.w700, maxLines: 2, underLine: true,),
          const SizedBox(height: 6),
          AppText(serviceModel.description??"", maxLines: 20,),
        ],
      ),
    );
  }
}
