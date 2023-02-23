import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class AnimatedWidgets extends StatelessWidget {
  final Widget child;
  final double? verticalOffset;
  final double? horizontalOffset;
  final double? duration;

  const AnimatedWidgets({
    required this.child,
    this.verticalOffset,
    this.horizontalOffset,
    this.duration,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
      position: 1,
      duration: Duration(milliseconds: duration?.toInt() ?? 500),
      child: SlideAnimation(
        horizontalOffset: horizontalOffset ?? 0,
        verticalOffset: verticalOffset ?? 100,
        child: FadeInAnimation(
          child: child,
        ),
      ),
    );
  }
}
