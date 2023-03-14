import 'package:cms_app/views/sections/activities/activities_section.dart';
import 'package:flutter/material.dart';

import '../../../widgets/app_bar_widget.dart';

class ActivitiesSectionScreen extends StatelessWidget {
  const ActivitiesSectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarWidget(title: "Activities Section",),
      body: ActivitiesSection(),
    );
  }
}
