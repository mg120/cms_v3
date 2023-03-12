import 'package:flutter/material.dart';

import '../../../widgets/app_bar_widget.dart';
import 'who_we_are_section.dart';

class WhoWeAreScreen extends StatelessWidget {
  const WhoWeAreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarWidget(title: "WhoWeAre Section",),
      body: WhoWeAreSection(),
    );
  }
}
