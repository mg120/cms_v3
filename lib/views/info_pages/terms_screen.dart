import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/app_bar_widget.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: "terms_of_use".tr,),
      body: ListView(
        children: [

        ],
      ),
    );
  }
}
