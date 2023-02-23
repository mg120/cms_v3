import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/models/page_model.dart';
import '../../widgets/app_bar_widget.dart';
import '../../widgets/app_text.dart';

class OnePageViewScreen extends StatelessWidget {
  const OnePageViewScreen({Key? key, required this.pageModel}) : super(key: key);
  final PageModel pageModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: pageModel.name??""),
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(16.0),
          child: Text(pageModel.description??"", maxLines: 1000, style: const TextStyle(fontSize: 16, height: 1.5),),
      ),
    );
  }
}
