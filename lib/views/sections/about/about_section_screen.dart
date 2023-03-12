import 'package:cms_app/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

import 'about_section.dart';

class AboutSectionScreen extends StatelessWidget {
  const AboutSectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarWidget(title: "About Section",),
      body: AboutSection(),
    );
  }
}
