import 'package:flutter/material.dart';

import '../../../widgets/app_bar_widget.dart';
import 'why_choose_us_section.dart';

class WhyChooseUsScreen extends StatelessWidget {
  const WhyChooseUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarWidget(title: "WhyChooseUs Section",),
      body: WhyChooseUsSection(),
    );
  }
}
