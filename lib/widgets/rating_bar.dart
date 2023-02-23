import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingBarWidget extends StatelessWidget {
  const RatingBarWidget(
      {Key? key,
      required this.rating,
      this.isClicked = true,
      this.itemCount = 5,
      this.itemSize = 14,
      this.starColor = Colors.amber,
      this.itemPadding = 0.0})
      : super(key: key);
  final double rating;
  final bool isClicked;
  final int itemCount;
  final double itemSize;
  final Color starColor;
  final double itemPadding;
  // final Function(double rating) onRatingChanged;

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: rating,
      minRating: 0,
      direction: Axis.horizontal,
      ignoreGestures: !isClicked,
      allowHalfRating: true,
      itemCount: itemCount,
      itemSize: itemSize,
      itemPadding: EdgeInsets.symmetric(horizontal: itemPadding),
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: starColor,
      ), onRatingUpdate: (double value) {},
    );
  }
}
