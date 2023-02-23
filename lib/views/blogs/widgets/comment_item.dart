import 'package:cms_app/data/models/comment_model.dart';
import 'package:cms_app/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../controller/blogs_controller.dart';

class CommentItem extends StatelessWidget {
  const CommentItem({Key? key, required this.index, required this.commentModel}) : super(key: key);
  final int index;
  final CommentModel commentModel;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BlogsController>(
      builder:(controller)=> Container(
        // padding: const EdgeInsets.all(kDefaultPadding),
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        decoration: const BoxDecoration(
          color: Color.fromRGBO(244, 244, 244, 1),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      "assets/icons/account.png",
                      color: Colors.white,
                      width: 20,
                      height: 20,
                    ),
                  ),
                  _sizedBox(width: 6.0),
                  AppText(
                    commentModel.commentUser,
                    maxLines: 1,
                    fontSize: 17,
                  ),
                  _sizedBox(width: 6.0),
                  AppText(
                    "${commentModel.timeAgo}",
                    maxLines: 1,
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                  _sizedBox(width: 3.0),
                  AppText(
                    "hours_ago".tr,
                    maxLines: 1,
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ],
              ),
              _sizedBox(height: 6.0),
              AppText(
                commentModel.commentBody,
                maxLines: 4,
                fontSize: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sizedBox({double width = 0, double height = 0}) {
    return SizedBox(
      width: width,
      height: height,
    );
  }
}
