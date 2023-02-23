import 'package:cms_app/data/models/faqs_model.dart';
import 'package:cms_app/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/faqs_controller.dart';
import '../../helper/appTheme.dart';
import '../../widgets/app_bar_widget.dart';

class FaqsScreen extends StatelessWidget {
  const FaqsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: "FAQS",
        centerTitle: true,
      ),
      body: GetBuilder<FaqsController>(
        builder:(controller)=> controller.isLoading? const LoadingWidget(): SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          physics: const BouncingScrollPhysics(),
          child: ExpansionPanelList(
            elevation: 3,
            // Controlling the expansion behavior
            expansionCallback: (index, isExpanded) {
                controller.faqsList[index].isExpanded= !isExpanded;
                controller.update();
            },
            animationDuration: Duration(milliseconds: 500),
            children: controller.faqsList.map(
                  (item) => ExpansionPanel(
                canTapOnHeader: true,
                backgroundColor:
                item.isExpanded == true ? AppTheme.secondaryColor.withOpacity(0.3) : Colors.white,
                headerBuilder: (_, isExpanded) => Container(
                    padding:
                    EdgeInsets.symmetric(vertical: 15, horizontal: 16),
                    child: Text(
                      item.question??"",
                      style: TextStyle(fontSize: 16),
                    )),
                body: Container(
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
                  child: Text(item.answer??""),
                ),
                isExpanded: item.isExpanded??false,
              ),
            ).toList(),
          ),
        ),
      ),
    );
  }
}
