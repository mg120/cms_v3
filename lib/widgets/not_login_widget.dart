import 'package:cms_app/helper/appTheme.dart';
import 'package:flutter/material.dart';

import 'app_text.dart';

class NoyLoginWidget extends StatelessWidget {
  const NoyLoginWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(Icons.image),
          const SizedBox(height: 28,),
          AppText("Login Now", color: AppTheme.primaryColor,),
        ],
      ),
    );
  }
}
