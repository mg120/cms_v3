import 'package:cms_app/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../controller/portfolios_controller.dart';
import '../../../../../widgets/appCachedImage.dart';
import 'header_title_widget.dart';

class HomePortfolios extends StatelessWidget {
  const HomePortfolios({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GetBuilder<PortfoliosController>(
      builder:(controller)=> Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeaderTitleWidget(title: "Portfolios",),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children: List.generate(
                controller.portfoliosList.length,
                    (index) => GestureDetector(
                  onTap: () {

                  },
                  child: Container(
                    width: size.width * 0.56,
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    padding: const EdgeInsets.all(6.0),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(6.0)),
                        boxShadow:  [
                          BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 0.2,
                            blurRadius: 2.0,
                            offset: Offset(0.0, 1.0),
                          ),
                        ]),
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
          )
        ],
      ),
    );
  }
}
