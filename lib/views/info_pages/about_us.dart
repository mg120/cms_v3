import 'package:flutter/material.dart';

import '../../widgets/app_bar_widget.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: "About Us",),
      body: ListView(
        children: [],
      ),
    );
  }
}
