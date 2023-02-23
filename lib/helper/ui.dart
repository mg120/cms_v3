import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Ui {
  static GetBar successSnackBar({String title = 'Success', required String message}) {
    Get.log("[$title] $message");
    return GetBar(
      titleText: Text(title.tr, style: Get.textTheme.headline6!.copyWith(color: Colors.black,)),
      messageText: Text(message, style: Get.textTheme.caption!.copyWith(color: Colors.black,)),
      snackPosition: SnackPosition.BOTTOM,
      margin:const EdgeInsets.all(20),
      backgroundColor: Colors.green,
      icon: const Icon(Icons.check_circle_outline, size: 32,),
      padding:const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      borderRadius: 8,
      duration:const Duration(milliseconds: 1300),
    );
  }

  static GetBar errorSnackBar({String title = 'Error', required String message}) {
    Get.log("[$title] $message", isError: true);
    return GetBar(
      titleText: Text(title.tr, style: Get.textTheme.headline6!.copyWith(color: Colors.black,)),
      messageText: Text(message, style: Get.textTheme.caption!.copyWith(color: Colors.black, fontSize: 16)),
      snackPosition: SnackPosition.BOTTOM,
      margin:const EdgeInsets.all(20),
      backgroundColor: Colors.redAccent,
      icon:const Icon(Icons.error_outline_outlined, size: 32,),
      padding:const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      borderRadius: 8,
      duration:const Duration(milliseconds: 1400),
    );
  }

  static GetBar defaultSnackBar({String title = 'Alert', required String message}) {
    Get.log("[$title] $message", isError: false);
    return GetBar(
      titleText: Text(title.tr, style: Get.textTheme.headline6!.merge(const TextStyle(color: Colors.black))),
      messageText: Text(message, style: Get.textTheme.caption!.merge(const TextStyle(color: Colors.black87))),
      snackPosition: SnackPosition.BOTTOM,
      margin:const EdgeInsets.all(20),
      backgroundColor: Colors.grey.shade200,
      borderColor: Get.theme.focusColor.withOpacity(0.1),
      icon: Icon(Icons.warning_amber_rounded, size: 32, color: Get.theme.hintColor),
      padding:const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      borderRadius: 8,
      duration:const Duration(seconds: 2),
    );
  }

  static AlignmentDirectional getAlignmentDirectional(String alignmentDirectional) {
    switch (alignmentDirectional) {
      case 'top_start':
        return AlignmentDirectional.topStart;
      case 'top_center':
        return AlignmentDirectional.topCenter;
      case 'top_end':
        return AlignmentDirectional.topEnd;
      case 'center_start':
        return AlignmentDirectional.centerStart;
      case 'center':
        return AlignmentDirectional.topCenter;
      case 'center_end':
        return AlignmentDirectional.centerEnd;
      case 'bottom_start':
        return AlignmentDirectional.bottomStart;
      case 'bottom_center':
        return AlignmentDirectional.bottomCenter;
      case 'bottom_end':
        return AlignmentDirectional.bottomEnd;
      default:
        return AlignmentDirectional.bottomEnd;
    }
  }

  static Color parseColor(String hexCode, {double? opacity}) {
    try {
      return Color(int.parse(hexCode.replaceAll("#", "0xFF"))).withOpacity(opacity ?? 1);
    } catch (e) {
      return Color(0xFFCCCCCC).withOpacity(opacity ?? 1);
    }
  }

  static List<Icon> getStarsList(double rate, {double size = 18}) {
    var list = <Icon>[];
    list = List.generate(rate.floor(), (index) {
      return Icon(Icons.star, size: size, color: const Color(0xFFFFB24D));
    });
    if (rate - rate.floor() > 0) {
      list.add(Icon(Icons.star_half, size: size, color: const Color(0xFFFFB24D)));
    }
    list.addAll(List.generate(5 - rate.floor() - (rate - rate.floor()).ceil(), (index) {
      return Icon(Icons.star_border, size: size, color: const Color(0xFFFFB24D));
    }));
    return list;
  }

  static BoxFit getBoxFit(String boxFit) {
    switch (boxFit) {
      case 'cover':
        return BoxFit.cover;
      case 'fill':
        return BoxFit.fill;
      case 'contain':
        return BoxFit.contain;
      case 'fit_height':
        return BoxFit.fitHeight;
      case 'fit_width':
        return BoxFit.fitWidth;
      case 'none':
        return BoxFit.none;
      case 'scale_down':
        return BoxFit.scaleDown;
      default:
        return BoxFit.cover;
    }
  }

  static bool isDesktop(BoxConstraints constraint) {
    return constraint.maxWidth >= 1280;
  }

  static bool isTablet(BoxConstraints constraint) {
    return constraint.maxWidth >= 768 && constraint.maxWidth <= 1280;
  }

  static bool isMobile(BoxConstraints constraint) {
    return constraint.maxWidth < 768;
  }

  static double col12(BoxConstraints constraint, {double desktopWidth = 1280, double tabletWidth = 768, double mobileWidth = 480}) {
    if (isMobile(constraint)) {
      return mobileWidth;
    } else if (isTablet(constraint)) {
      return tabletWidth;
    } else {
      return desktopWidth;
    }
  }

  static double col9(BoxConstraints constraint, {double desktopWidth = 1280, double tabletWidth = 768, double mobileWidth = 480}) {
    if (isMobile(constraint)) {
      return mobileWidth * 3 / 4;
    } else if (isTablet(constraint)) {
      return tabletWidth * 3 / 4;
    } else {
      return desktopWidth * 3 / 4;
    }
  }

  static double col8(BoxConstraints constraint, {double desktopWidth = 1280, double tabletWidth = 768, double mobileWidth = 480}) {
    if (isMobile(constraint)) {
      return mobileWidth * 2 / 3;
    } else if (isTablet(constraint)) {
      return tabletWidth * 2 / 3;
    } else {
      return desktopWidth * 2 / 3;
    }
  }

  static double col6(BoxConstraints constraint, {double desktopWidth = 1280, double tabletWidth = 768, double mobileWidth = 480}) {
    if (isMobile(constraint)) {
      return mobileWidth / 2;
    } else if (isTablet(constraint)) {
      return tabletWidth / 2;
    } else {
      return desktopWidth / 2;
    }
  }

  static double col4(BoxConstraints constraint, {double desktopWidth = 1280, double tabletWidth = 768, double mobileWidth = 480}) {
    if (isMobile(constraint)) {
      return mobileWidth * 1 / 3;
    } else if (isTablet(constraint)) {
      return tabletWidth * 1 / 3;
    } else {
      return desktopWidth * 1 / 3;
    }
  }

  static double col3(BoxConstraints constraint, {double desktopWidth = 1280, double tabletWidth = 768, double mobileWidth = 480}) {
    if (isMobile(constraint)) {
      return mobileWidth * 1 / 4;
    } else if (isTablet(constraint)) {
      return tabletWidth * 1 / 4;
    } else {
      return desktopWidth * 1 / 4;
    }
  }
}
