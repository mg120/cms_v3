import 'package:cms_app/widgets/appCachedImage.dart';
import 'package:cms_app/widgets/app_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../controller/blogs_controller.dart';
import '../../../data/models/blog_model.dart';
import '../../../helper/appTheme.dart';

class BlogItem extends StatelessWidget {
  const BlogItem({Key? key, required this.index, required this.blog})
      : super(key: key);
  final int index;
  final BlogModel blog;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BlogsController>(
      builder: (controller) => Container(
        padding: const EdgeInsets.all(6.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 1.0,
            ),
          ]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(6.0),
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(
                    "assets/icons/account.svg",
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 28,
                          child: AppText(
                            blog.username ?? "",
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600
                          ),
                        ),
                        SizedBox(
                          height: 20,
                          child: AppText(
                            blog.publishDate ?? "",
                            maxLines: 1,
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    )),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 2.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppTheme.primaryColor.withOpacity(0.3),
                    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  ),
                  child: AppText(
                    blog.category?.name?? "",
                    maxLines: 1,
                    color: AppTheme.primaryColor,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 6.0,
            ),
            AppCachedImage(imageUrl: blog.image??"", width: double.infinity, height: 136, radius: 16.0,),
            const SizedBox(
              height: 6.0,
            ),
            AppText(
              blog.title??"", maxLines: 1, fontSize: 15.0, fontWeight: FontWeight.w600,
            ),
            AppText(
              blog.description??"", maxLines: 3, fontSize: 12.0, color: Colors.grey
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.0),
              child: Divider(
                color: Colors.black,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(Icons.favorite,
                        size: 18, color: Colors.red),
                    const SizedBox(
                      width: 4.0,
                    ),
                    const AppText(
                      "25",
                      maxLines: 1,
                      color: Colors.black,
                      fontSize: 16,
                    ),
                    const SizedBox(
                      width: 4.0,
                    ),
                    AppText(
                      "likes".tr,
                      maxLines: 1,
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    // showModalBottomSheet(
                    //   context: context,
                    //   isScrollControlled: true,
                    //   backgroundColor: Colors.transparent,
                    //   builder: (BuildContext context) {
                    //     return const BlogComments();
                    //   },
                    // );
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(Icons.wechat, size: 18, color: Colors.grey),
                      const SizedBox(
                        width: 4.0,
                      ),
                      const AppText(
                        "5",
                        maxLines: 1,
                        color: Colors.black,
                        fontSize: 16,
                      ),
                      const SizedBox(
                        width: 4.0,
                      ),
                      AppText(
                        "comments".tr,
                        maxLines: 1,
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _blogLocation() {
    return SizedBox(
      width: Get.width,
      height: 140,
      child: Stack(
        children: [
          ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(16.0)),
              child: Image.asset(
                "assets/images/university.jpeg",
                width: Get.width,
                height: double.infinity,
                fit: BoxFit.fill,
              )),
          Align(
            alignment: Alignment.center,
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
              decoration: const BoxDecoration(
                color: Color.fromRGBO(158, 124, 136, 1),
                borderRadius: BorderRadius.all(Radius.circular(16.0)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.location_on_outlined,
                    color: Colors.black,
                    size: 24,
                  ),
                  const SizedBox(
                    width: 6.0,
                  ),
                  AppText(
                    "view_location".tr,
                    maxLines: 1,
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
