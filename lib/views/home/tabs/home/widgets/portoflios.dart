import 'package:cms_app/widgets/app_text.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../controller/portfolios_controller.dart';
import '../../../../../helper/appTheme.dart';
import '../../../../../widgets/appCachedImage.dart';
import '../../../../portfolio/portfolio_details_screen.dart';
import 'header_title_widget.dart';

class HomePortfolios extends StatelessWidget {
  HomePortfolios({Key? key}) : super(key: key);
  final portfoliosController = Get.put(PortfoliosController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GetBuilder<PortfoliosController>(
      builder:(controller)=> Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderTitleWidget(title: "portfolios".tr),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(top: 16.0, left: 6, right: 6, bottom: 6),
            child: Row(
              children: List.generate(
                controller.portfoliosList.length,
                    (index) => GestureDetector(
                  onTap: ()=> Get.to(()=> PortfolioDetailsScreen(portfolioModel: controller.portfoliosList[index],)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: DottedBorder(
                        color: AppTheme.primaryColor,
                        strokeWidth: 1,
                      radius: Radius.circular(20),
                      borderType: BorderType.RRect,
                      child: Container(
                        width: size.width * 0.56,
                        // margin: const EdgeInsets.symmetric(horizontal: 8),
                        padding: const EdgeInsets.all(6.0),
                        // decoration: BoxDecoration(
                        //     color: Colors.white,
                        //     borderRadius: BorderRadius.all(Radius.circular(28.0)),
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
                            AppCachedImage(imageUrl: controller.portfoliosList[index].image??"", fit: BoxFit.cover,
                              width: double.infinity, height: 120, radius: 10.0,),
                            const SizedBox(height: 6.0),
                            AppText(controller.portfoliosList[index].title??'', fontSize: 14, color: Colors.black,),
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
      ),
    );
  }
}
