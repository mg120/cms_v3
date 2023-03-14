import 'package:cms_app/controller/all_testimonials_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/app_bar_widget.dart';
import '../../widgets/empty_list_widget.dart';
import '../../widgets/loading_widget.dart';
import 'widgets/testimonial_item_widget.dart';

class AllTestimonialsScreen extends StatelessWidget {
  const AllTestimonialsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: "testimonials".tr,
        centerTitle: false,
      ),
      body: GetBuilder<AllTestimonialsController>(
        init: AllTestimonialsController(),
        builder: (controller) => controller.isLoading
            ? const LoadingWidget()
            : controller.testimonials.isNotEmpty
                ? ListView.separated(
                    padding: const EdgeInsets.only( left: 8.0, top: 16, right: 8,
                        bottom: 28),
                    scrollDirection: Axis.vertical,
                    itemCount: controller.testimonials.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return TestimonialItemWidget(
                        testimonialModel: controller.testimonials[index],
                      );
                    },
                    separatorBuilder: (ctx, index) {
                      return const SizedBox(
                        height: 16,
                      );
                    },
                  )
                : const EmptyWidget(
                    iconPath: "iconPath",
                    displayTxt: "No testimonials founded"),
      ),
    );
  }
}
