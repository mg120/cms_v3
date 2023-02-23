import 'dart:developer';
import 'dart:io';

import 'package:cms_app/controller/profile_controller.dart';
import 'package:cms_app/helper/appTheme.dart';
import 'package:cms_app/helper/get_binding.dart';
import 'package:cms_app/services/local_storage/local_storage.dart';
import 'package:cms_app/views/setting_info/about_screen.dart';
import 'package:cms_app/views/setting_info/binding/about_binding.dart';
import 'package:cms_app/views/setting_info/privacy_policy_screen.dart';
import 'package:cms_app/widgets/app_buttons/app_text_button.dart';
import 'package:cms_app/widgets/app_text.dart';
import 'package:cms_app/widgets/modal_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'components/profile_menu_item.dart';

class ProfileView extends StatelessWidget {
  ProfileView({Key? key}) : super(key: key);

  final ProfileController _controller = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        title: AppText(
          "my_account".tr,
          fontSize: 22,
          fontWeight: FontWeight.w800,
          color: Colors.black,
        ),
      ),
      body: _profileBody(context),
    );
  }

  Widget _profileBody(BuildContext context){
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 16.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: AppText(
              "personal_information".tr,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          _firstContainer(),
          const SizedBox(
            height: 28,
          ),
          Padding(
              padding:const EdgeInsets.symmetric(horizontal: 16.0),
              child: AppText(
                "settings".tr,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              )),
          _secondContainer(context),
          const SizedBox(
            height: 16.0,
          ),
          Center(
            child: InkWell(
              onTap: ()=> _logoutPop(context),
              child: Container(
                width: 200,
                padding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: AppTheme.primaryColor),
                  borderRadius: const BorderRadius.all(Radius.circular(25.0)),
                ),
                alignment: Alignment.center,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      "assets/icons/logout.svg",
                      width: 20,
                      color: AppTheme.primaryColor,
                    ),
                    const SizedBox(
                      width: 16.0,
                    ),
                    AppText(
                      "logout".tr,
                      fontSize: 17,
                      color: AppTheme.primaryColor,
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 48.0,
          ),
        ],
      ),
    );
  }

  Widget _firstContainer() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: Get.width,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0.0, 1.0),
            ),
          ],
        ),
        child: Column(
          children: [
            // ProfileMenuItem(
            //     icon: "assets/icons/user.svg",
            //     text: "personal_data".tr,
            //     press: ()=> Get.to(()=> const UpdateProfile(), binding: GetBinding())),
            // ProfileMenuItem(
            //     icon: "assets/icons/edit.svg",
            //     text: "profile".tr,
            //     press: ()=> Get.to(()=> const EditProfileInfoScreen(), binding: GetBinding())),
            // ProfileMenuItem(
            //     icon: "assets/icons/cards.svg",
            //     text: "credit_cards".tr,
            //     press: ()=> Get.to(()=> const CardsScreen())),
          ],
        ),
      ),
    );
  }

  Widget _secondContainer(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: Get.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade500,
              spreadRadius: 1,
              blurRadius: 1,
            ),
          ],
        ),
        child: Column(
          children: [
            ProfileMenuItem(
                icon: "assets/icons/info.svg",
                text: "about".tr,
                press: () => Get.to(() => const AboutScreen(), binding: AboutBinding())),
            ProfileMenuItem(
                icon: "assets/icons/language.svg",
                text: "language".tr,
                press: () {
                  log("isAr=>${LocalStorage.getString(LocalStorage.languageKey)}");
                  log("isAr=>${GetStorage().read(LocalStorage.languageKey)}");
                  log("isAr=>${LocalStorage.isAr},");
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (BuildContext context) {
                      return ModelBottomSheet(child: _langBottomSheet(), sheetHeight: Get.height*0.35,);
                    },
                  );
                }),
            ProfileMenuItem(
                icon: "assets/icons/conditions.svg",
                text: "terms_of_use".tr,
                press: () => Get.to(() => const PrivacyPolicyScreen())),
            // ProfileMenuItem(
            //     icon: "assets/icons/contact.svg",
            //     text: "contact_us".tr,
            //     press: ()=> Get.to(()=> const ContactUsScreen(), binding: ContactUsBinding())),
            ProfileMenuItem(
                icon: "assets/icons/rate.svg",
                text: "rate_app".tr,
                press: () {
                  // LaunchReview.launch(androidAppId: "com.hawzen.direction_app",
                  //     iOSAppId: "585027354");
                }),
            ProfileMenuItem(
                icon: "assets/icons/share.svg",
                text: "share_app".tr,
                press: () {
                  if(Platform.isAndroid){
                    // Share.share('Install this coll application\n https://play.google.com/store/apps/details?id=com.hawzen.direction_app');
                  } else{
                    // Share.share('Install this coll application\n http://apps.apple.com/<country>/app/<app–name>/id<store-ID>');
                  }
                }),
          ],
        ),
      ),
    );
  }

  Widget _langBottomSheet(){
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppText("language".tr, fontSize: 18,),
          const SizedBox(height: 16,),
          ListTile(
            onTap: ()=> _changeLocale("ar", const Locale("ar", "SA")),
            leading: SvgPicture.asset(
              "assets/icons/language.svg",
              width: 20,
            ),
            title: AppText(
              "arabic".tr,
              fontSize: 17,
              maxLines: 1,
            ),
            trailing: LocalStorage.getString(LocalStorage.languageKey)=="ar"? _currentLang():const SizedBox(),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 16.0,),
            child: Divider(color: Colors.black54,),
          ),
          ListTile(
            onTap: ()=> _changeLocale("en",const Locale("en", "US")),
            leading: SvgPicture.asset(
              "assets/icons/language.svg",
              width: 20,
            ),
            title: AppText(
              "english".tr,
              fontSize: 17,
              maxLines: 1,
            ),
            trailing: LocalStorage.getString(LocalStorage.languageKey)=="en"? _currentLang():const SizedBox(),
          ),
        ],
      ),
    );
  }

  _logoutPop(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('are_you_sure'.tr),
        content: Text('logout_of_app'.tr),
        actions: <Widget>[
          AppTextButton(
            onPressed: () => Get.back(),
            text: 'cancel'.tr,
            textColor: AppTheme.primaryColor,
          ),
          AppTextButton(
            onPressed: () async{
              Get.back();
              await LocalStorage.signOut();
              _controller.update();
            },
            text: 'ok'.tr,
            textColor: AppTheme.primaryColor,
          ),
        ],
      ),
    );
  }

  Future<void> _changeLocale(String? lang, Locale locale)async{
    Get.back();
    await LocalStorage.setString(LocalStorage.languageKey, lang);
    Get.updateLocale(locale);
    log("isAr=>${GetStorage().read(LocalStorage.languageKey)}");
    log("isAr=>${LocalStorage.getString(LocalStorage.languageKey)}");
    log("isAr=>${LocalStorage.isAr}, $lang");
  }

  Widget _currentLang(){
    return Container(
      padding: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        color: AppTheme.primaryColor,
        shape: BoxShape.circle,
      ),
      child:const Icon(Icons.check, color: Colors.white,),
    );
  }
}
