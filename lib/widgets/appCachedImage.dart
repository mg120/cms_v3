import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/settings_services.dart';

class AppCachedImage extends StatelessWidget {
  final String imageUrl;
  final double? radius;
  final double width, height;
  final BoxFit? fit;
  final Color? borderColor;
  final Color? bgColor;
  final double? borderWidth;
  final bool isCircular;

  const AppCachedImage({
    required this.imageUrl,
    this.width = 100,
    this.height = 100,
    this.radius,
    this.fit,
    this.borderColor,
    this.bgColor,
    this.borderWidth,
    this.isCircular = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: borderColor == null
            ? null
            : Border.all(
                color: borderColor ?? Theme.of(context).primaryColor,
                width: borderWidth ?? 0),
        shape: isCircular ? BoxShape.circle : BoxShape.rectangle,
        borderRadius: isCircular
            ? null
            : BorderRadius.only(
                topLeft: Radius.circular(radius ?? 12),
                topRight: Radius.circular(radius ?? 12),
                bottomLeft: Radius.circular(radius ?? 12),
                bottomRight: Radius.circular(radius ?? 12),
              ),
      ),
      child: CachedNetworkImage(
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            color: bgColor == null? Colors.transparent: bgColor,
            shape: isCircular ? BoxShape.circle : BoxShape.rectangle,
            borderRadius: isCircular
                ? null
                : BorderRadius.only(
                    topLeft: Radius.circular(radius ?? 12),
                    topRight: Radius.circular(radius ?? 12),
                    bottomLeft: Radius.circular(radius ?? 12),
                    bottomRight: Radius.circular(radius ?? 12),
                  ),
            image: DecorationImage(
              image: imageProvider,
              fit: fit ?? BoxFit.cover,
            ),
          ),
        ),
        imageUrl: imageUrl,
        width: width,
        height: height,
        progressIndicatorBuilder: (context, url, downloadProgress) => Center(
          child: SizedBox(
            height: 50,
            width: 50,
            child: CircularProgressIndicator(
              value: downloadProgress.progress,
              color: Theme.of(context).primaryColor,
              strokeWidth: 2.0,
            ),
          ),
        ),
        errorWidget: (context, url, error) => Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            shape: isCircular ? BoxShape.circle : BoxShape.rectangle,
            borderRadius: isCircular
                ? null
                : BorderRadius.only(
                    topLeft: Radius.circular(radius ?? 12),
                    topRight: Radius.circular(radius ?? 12),
                    bottomLeft: Radius.circular(radius ?? 12),
                    bottomRight: Radius.circular(radius ?? 12),
                  ),
            image: DecorationImage(
              image: NetworkImage(Get.find<SettingsService>().appIconSettings?.plainValue??"",),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
