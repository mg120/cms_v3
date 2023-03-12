import 'dart:developer';

import 'package:cms_app/widgets/app_buttons/app_elevated_button.dart';
import 'package:cms_app/widgets/app_text.dart';
import 'package:cms_app/widgets/empty_list_widget.dart';
import 'package:cms_app/widgets/loading_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import '../../controller/blogs_controller.dart';
import '../../widgets/app_bar_widget.dart';
import 'widgets/blog_item.dart';

class BlogsView extends StatelessWidget {
  const BlogsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: "blogs".tr,
        centerTitle: true,
      ),
      body: GetBuilder<BlogsController>(
        init: BlogsController(),
        builder: (controller) => controller.isLoading
            ? const LoadingWidget()
            : controller.blogs.isNotEmpty
                ? ListView.separated(
                    padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 6.0),
                    scrollDirection: Axis.vertical,
                    itemCount: controller.blogs.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return BlogItem(
                        index: index,
                        blog: controller.blogs[index],
                      );
                    },
                    separatorBuilder: (ctx, index) {
                      return const SizedBox(
                        height: 10,
                      );
                    },
                  )
                : EmptyWidget(
                    iconPath: "iconPath", displayTxt: "no_blogs_founded".tr),
      ),
    );
  }

  Widget _filterBottomSheet(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(28.0)),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: GetBuilder<BlogsController>(
          builder: (controller) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: AppText(
                  "filter".tr,
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  maxLines: 1,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              AppText(
                "category".tr,
                fontSize: 17,
                fontWeight: FontWeight.w700,
                maxLines: 1,
              ),
              // ListView.separated(
              //   padding: const EdgeInsets.symmetric(horizontal: 6.0),
              //   itemCount: controller.filterCategories.length,
              //   shrinkWrap: true,
              //   physics: const NeverScrollableScrollPhysics(),
              //   itemBuilder: (BuildContext context, int index) {
              //     final isChecked = controller.selectedCategories
              //         .contains(controller.filterCategories[index]);
              //     return SizedBox(
              //       height: 36,
              //       child: CheckboxListTile(
              //         value: isChecked,
              //         activeColor: kPrimaryDarkColor,
              //         contentPadding: EdgeInsets.zero,
              //         title: Text(
              //           controller.filterCategories[index],
              //           style: TextStyle(
              //               color: isChecked ? kPrimaryDarkColor : Colors.black,
              //               fontSize: 17),
              //         ),
              //         controlAffinity: ListTileControlAffinity.leading,
              //         onChanged: (checked) {
              //           if (checked!) {
              //             controller.selectedCategories
              //                 .add(controller.filterCategories[index]);
              //           } else {
              //             controller.selectedCategories
              //                 .remove(controller.filterCategories[index]);
              //           }
              //           controller.update();
              //         },
              //       ),
              //     );
              //   },
              //   separatorBuilder: (_, __) {
              //     return const SizedBox(
              //       height: 16.0,
              //     );
              //   },
              // ),
              // const Padding(
              //   padding: EdgeInsets.symmetric(vertical: 16.0),
              //   child: Divider(color: Colors.black87),
              // ),
              // AppText(
              //   "related".tr,
              //   fontSize: 17,
              //   fontWeight: FontWeight.w700,
              //   maxLines: 1,
              // ),
              // ListView.separated(
              //   padding: const EdgeInsets.symmetric(horizontal: 6.0),
              //   itemCount: controller.relatedCategories.length,
              //   shrinkWrap: true,
              //   physics: const NeverScrollableScrollPhysics(),
              //   itemBuilder: (BuildContext context, int index) {
              //     final isChecked = controller.selectedRelated
              //         .contains(controller.relatedCategories[index]);
              //     return SizedBox(
              //       height: 36,
              //       child: CheckboxListTile(
              //         value: isChecked,
              //         activeColor: kPrimaryDarkColor,
              //         contentPadding: EdgeInsets.zero,
              //         title: Text(
              //           controller.relatedCategories[index],
              //           style: TextStyle(
              //               color: isChecked ? kPrimaryDarkColor : Colors.black,
              //               fontSize: 17),
              //         ),
              //         controlAffinity: ListTileControlAffinity.leading,
              //         onChanged: (checked) {
              //           if (checked!) {
              //             controller.selectedRelated.add(controller.relatedCategories[index]);
              //           } else {
              //             controller.selectedRelated.remove(controller.relatedCategories[index]);
              //           }
              //           controller.update();
              //         },
              //       ),
              //     );
              //   },
              //   separatorBuilder: (_, __) {
              //     return const SizedBox(
              //       height: 16.0,
              //     );
              //   },
              // ),
              // const SizedBox(
              //   height: 28,
              // ),
              Center(
                child: AppElevatedButton(
                    text: "search".tr,
                    onPressed: () {
                      log("search btn clicked..");
                      // log("SelectedCarTypes==> ${controller.selectedCategories.length}");
                      Navigator.of(context).pop();
                    }),
              ),
              const SizedBox(
                height: 16.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
