import 'package:flutter/material.dart';

import '../../widgets/app_bar_widget.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: "Terms",),
      body: ListView(
        children: [

        ],
      ),
    );
  }
}
