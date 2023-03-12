import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/donations_controller.dart';
import '../../widgets/app_bar_widget.dart';
import '../../widgets/empty_list_widget.dart';
import '../../widgets/loading_widget.dart';
import 'widgets/donation_item_widget.dart';

class DonationsScreen extends StatelessWidget {
  const DonationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title:"Donations",
        centerTitle: false,
      ),
      body: GetBuilder<DonationsController>(
        init: DonationsController(),
        builder: (controller) => controller.isLoading
            ? const LoadingWidget()
            : controller.donationsList.isNotEmpty
            ? ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 6.0),
          scrollDirection: Axis.vertical,
          itemCount: controller.donationsList.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return BuildDonationWidget(
              index: index,
              donationModel: controller.donationsList[index],
            );
          },
          separatorBuilder: (ctx, index) {
            return const SizedBox(
              height: 10,
            );
          },
        ) : const EmptyWidget(
            iconPath: "iconPath", displayTxt: "No donations founded"),
      ),
    );
  }
}
