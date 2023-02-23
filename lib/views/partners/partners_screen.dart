import 'package:cms_app/views/partners/components/build_partner_widget.dart';
import 'package:cms_app/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/partners_controller.dart';
import '../../helper/appTheme.dart';
import '../../helper/get_binding.dart';
import '../../widgets/empty_list_widget.dart';
import '../../widgets/loading_widget.dart';
import '../home/home_screen.dart';

class PartnersScreen extends StatelessWidget {
  const PartnersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppText("Partners", fontSize: 20, fontWeight: FontWeight.bold),
        actions: [
          InkWell(
              onTap: ()=> Get.off(() => const HomeScreen(), binding: GetBinding()),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  alignment: Alignment.center,
                  child: AppText('Skip', color: AppTheme.primaryColor, fontSize: 16,))),
        ],
      ),
      body: GetBuilder<PartnerController>(
        init: PartnerController(),
        builder: (controller) => controller.isLoading
            ? const LoadingWidget()
            : controller.partners.isNotEmpty
                ? GridView.builder(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 28.0),
                    scrollDirection: Axis.vertical,
                    itemCount: controller.partners.length,
                    physics: const BouncingScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 12,
                            crossAxisSpacing: 12,
                            childAspectRatio: 0.9),
                    itemBuilder: (BuildContext context, int index) {
                      return BuildPartnerWidget(
                        partner: controller.partners[index],
                        index: index,
                      );
                    },
                  )
                : const EmptyWidget(
                    iconPath: 'assets/icons.category.svg',
                    displayTxt: "No Partners founded"),
      ),
    );
  }
}
