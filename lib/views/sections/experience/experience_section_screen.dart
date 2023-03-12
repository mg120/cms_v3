import 'package:cms_app/views/sections/experience/experience_section.dart';
import 'package:cms_app/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';


class ExperienceSectionScreen extends StatelessWidget {
  const ExperienceSectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarWidget(title: "Experience Section",),
      body: ExperienceSection(),
    );
  }
}
