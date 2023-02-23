import 'package:cms_app/widgets/appCachedImage.dart';
import 'package:cms_app/widgets/app_text.dart';
import 'package:cms_app/widgets/percent_progress.dart';
import 'package:flutter/material.dart';

class AboutWidget extends StatelessWidget {
  const AboutWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
      ),
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: const [
          AppCachedImage(imageUrl: 'imageUrl', height: 160, fit: BoxFit.fill, isCircular: false,),
          AppText("header title"),
          AppText("content description...", fontSize: 15, color: Colors.grey,),
          AppText("header 2", fontSize: 16, fontWeight: FontWeight.w500,),

          PercentProgressWidget(title: "title", progress: 0.4),
          PercentProgressWidget(title: "title", progress: 0.4),
          PercentProgressWidget(title: "title", progress: 0.4),
        ],
      ),
    );
  }
}
