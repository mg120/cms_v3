import 'package:cms_app/controller/main_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/home_view_controller.dart';
import '../../../../helper/appTheme.dart';
import '../../../../widgets/loading_widget.dart';
import '../../../sections/about/about_section.dart';
import '../../componenets/BuildHomeAppBar.dart';
import '../../componenets/bottom_nav.dart';
import '../../componenets/drawer.dart';
import 'widgets/home_services.dart';
import 'widgets/home_slider.dart';
import 'widgets/jobs.dart';
import 'widgets/popular_services.dart';
import 'widgets/portoflios.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  final homeViewController = Get.put(HomeViewController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
          extendBody: true,
          appBar: BuildHomeAppBar(),
          drawer: const MainDrawer(),
          body: GetBuilder<HomeViewController>(
            builder:(homeController)=> homeController.isLoading? const LoadingWidget(): SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HomeSlider(sliderList: homeController.sliderList,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 1.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 16.0,),
                        HomeServices(services: homeController.services,),
                        const SizedBox(height: 20.0,),
                        HomePortfolios(),
                        const SizedBox(height: 20.0,),
                        Jobs(),
                        const SizedBox(height: 36.0,),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
    );
  }
}
