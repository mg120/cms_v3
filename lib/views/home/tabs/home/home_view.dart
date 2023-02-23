import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/home_view_controller.dart';
import '../../../../helper/appTheme.dart';
import '../../../../widgets/loading_widget.dart';
import '../../componenets/BuildHomeAppBar.dart';
import '../../componenets/bottom_nav.dart';
import '../../componenets/drawer.dart';
import 'widgets/home_services.dart';
import 'widgets/home_slider.dart';
import 'widgets/jobs.dart';
import 'widgets/popular_services.dart';
import 'widgets/portoflios.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        appBar: BuildHomeAppBar(),
        drawer: const MainDrawer(),
        body: GetBuilder<HomeViewController>(
          builder:(homeController)=> homeController.isLoading? const LoadingWidget(): SingleChildScrollView(
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
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(vertical: 8.0),
                      //   child: Divider(color: AppTheme.primaryColor.withOpacity(0.6)),
                      // ),
                      const SizedBox(height: 28.0,),
                      const HomePortfolios(),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(vertical: 8.0),
                      //   child: Divider(color: AppTheme.primaryColor.withOpacity(0.6)),
                      // ),
                      const SizedBox(height: 28.0,),
                      const Jobs(),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(vertical: 8.0),
                      //   child: Divider(color: AppTheme.primaryColor.withOpacity(0.6)),
                      // ),
                      const SizedBox(height: 16.0,),
                      PopularServices(),
                      const SizedBox(height: 28.0,),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: const BottomNav(),
      ),
    );
  }
}
