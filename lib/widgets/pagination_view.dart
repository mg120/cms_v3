import 'package:flutter/material.dart';

class PaginationView extends StatelessWidget {
  final bool showLoadMoreWidget;
  final Widget child;
  final Function loadMoreData;
  final Color textColor;

  const PaginationView({
    this.showLoadMoreWidget = false,
    required this.loadMoreData,
    required this.child,
    this.textColor = Colors.white,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Flexible(
        //   fit: FlexFit.loose,
          // child: LazyLoadScrollView(
          //   onEndOfPage: () {
          //     loadMoreData.call();
          //   },
          //   child: child,
          // ),
        // ),
        Visibility(
          visible: showLoadMoreWidget,
          child: const CircularProgressIndicator(),
        ),
      ],
    );
  }
}
