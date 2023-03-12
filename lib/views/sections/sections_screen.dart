import 'package:cms_app/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'about/about_section.dart';
import 'experience/experience_section.dart';
import 'who_we_are/who_we_are_section.dart';
import 'why_choose_us/why_choose_us_section.dart';

class SectionsScreen extends StatelessWidget {
  const SectionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: "sections".tr,
      ),
      body: ListView(
        children: const[
          SizedBox(height: 16),
          AboutSection(),
          SizedBox(height: 16),
          ExperienceSection(),
          SizedBox(height: 16),
          WhoWeAreSection(),
          // SizedBox(height: 16),
          // WhyChooseUsSection(),
        ],
      ),
    );
  }
}
