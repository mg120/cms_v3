import 'package:cms_app/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class PercentProgressWidget extends StatelessWidget {
  const PercentProgressWidget({Key? key, required this.title, required this.progress}) : super(key: key);
  final String title;
  final double progress;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(title, fontSize: 16, fontWeight: FontWeight.w600,),
        const SizedBox(height: 6.0,),
        LinearPercentIndicator(
          lineHeight: 14.0,
          percent: progress,
          backgroundColor: Colors.grey,
          progressColor: Colors.blue,
        ),
      ],
    );
  }
}
