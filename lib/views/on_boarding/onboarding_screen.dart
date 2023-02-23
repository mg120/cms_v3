import 'dart:developer';

import 'package:cms_app/views/home/home_screen.dart';
import 'package:cms_app/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../../helper/appTheme.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final introKey = GlobalKey<IntroductionScreenState>();

    return Scaffold(
        backgroundColor: Colors.white,
        body:  IntroductionScreen(
          key: introKey,
          pages: [
            PageViewModel(
              decoration: _pageDecoration(),
              title: "مرحباً بكم في cms",
              body: "cms عبارة عن منصة تطبيق الكترونى للجوالات ",
              image: _buildImage('images/placeHolder_image.png', size.height),
            ),
            PageViewModel(
              decoration: _pageDecoration(),
              title: "مرحباً بكم في cms",
              body: "cms عبارة عن منصة تطبيق الكترونى للجوالات لعرض إعلانات المستخدمين للسلع المستعملة او الجديدة",
              image: _buildImage('images/placeHolder_image.png', size.height),
            ),
            PageViewModel(
              decoration: _pageDecoration(),
              title: "مرحباً بكم في cms",
              body: "cms عبارة عن منصة تطبيق الكترونى للجوالات لعرض إعلانات المستخدمين للسلع المستعملة",
              image: _buildImage('images/placeHolder_image.png', size.height),
            ),
          ],
          onDone: () => _onIntroEnd(),
          onSkip: () => _onIntroEnd(), // You can override onSkip callback
          showSkipButton: true,
          // skipFlex: 0,
          nextFlex: 0,
          skip: const AppText('تخطى',),
          next: const Icon(Icons.arrow_forward, color: Colors.white,),
          done: const AppText('التالى',),
          dotsDecorator: DotsDecorator(
              size: const Size.square(10.0),
              activeSize: const Size(20.0, 10.0),
              activeColor: AppTheme.primaryColor,
              color: Colors.grey,
              spacing: const EdgeInsets.symmetric(horizontal: 3.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0)
              )
          ),
        ),
    );
  }

  Widget _buildImage(String assetName, double height) {
    return Align(
      child: Image.asset('assets/$assetName',height: height* 0.6, width:double.infinity ,fit: BoxFit.fill,),
      alignment: Alignment.topCenter,
    );
  }

  _onIntroEnd() {
    log("next Btn Clicked");
    Get.off(()=> const HomeScreen());
  }

  PageDecoration _pageDecoration(){
    return const PageDecoration(
      bodyPadding: EdgeInsets.only(top: 60.0),
      // pageColor: Color(0xFF25364F),
      titleTextStyle: TextStyle(color: Colors.black, fontSize: 18, fontFamily: "Almarai"),
      bodyTextStyle: TextStyle(color: Colors.grey, fontSize: 16, fontFamily: "Almarai"),
    );
  }
}
