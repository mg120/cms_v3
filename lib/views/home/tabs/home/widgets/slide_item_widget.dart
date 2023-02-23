import 'dart:math' as math;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cms_app/helper/appTheme.dart';
import 'package:cms_app/helper/ui.dart';
import 'package:cms_app/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../data/models/slider_model.dart';
import '../../../../../widgets/appCachedImage.dart';

class SlideItemWidget extends StatelessWidget {
  final SliderModel? slide;

  const SlideItemWidget({this.slide, Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Transform(
          alignment: Alignment.center,
          transform: Matrix4.rotationY(Directionality.of(context) == TextDirection.rtl ? math.pi : 0),
          child: AppCachedImage(imageUrl: slide?.image??"", width: double.infinity, height: 310,
            fit: Ui.getBoxFit("cover"), bgColor: Colors.grey.shade200, radius: 0,),
        ),
        Container(
            alignment: Alignment.center,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                  Text(
                    slide?.title??"",
                    style: Get.textTheme.bodyText2?.merge(const TextStyle(color: Colors.white, fontSize: 15)),
                    overflow: TextOverflow.fade,
                    maxLines: 3,
                    textAlign: TextAlign.center,
                  ),
                const SizedBox(height: 6.0),
                if (slide?.link != null && slide?.link != '')
                  MaterialButton(
                    onPressed: () {

                    },
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    color: AppTheme.primaryColor,
                    shape: StadiumBorder(),
                    child: Text(
                      "View More",
                      textAlign: TextAlign.start,
                      style: TextStyle(color: Colors.white),
                    ),
                    elevation: 0,
                  ),
              ],
            )
        ),
      ],
    );
  }
}
