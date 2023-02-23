import 'package:carousel_slider/carousel_slider.dart';
import 'package:cms_app/helper/ui.dart';
import 'package:cms_app/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../data/models/slider_model.dart';
import '../../../../../helper/appTheme.dart';
import '../../../../../widgets/appCachedImage.dart';
import 'slide_item_widget.dart';

class HomeSlider extends StatefulWidget {
  HomeSlider({Key? key, required this.sliderList}) : super(key: key);
  List<SliderModel> sliderList;

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  int currentSlide = 0;
  double aspectRatio = 0.0;
  final offerPagesController = PageController(viewportFraction: 0.93, keepPage: true, initialPage: 1);
  final reviewPagesController = PageController(viewportFraction: 0.93, keepPage: true, initialPage: 1);

  @override
  Widget build(BuildContext context) {
    return Stack(
        alignment: widget.sliderList.isEmpty
            ? AlignmentDirectional.center
            : Ui.getAlignmentDirectional("center"),

        children: <Widget>[
          CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 7),
              height: 200,
              viewportFraction: 1.0,
              onPageChanged: (index, reason) {
                setState(() {
                  currentSlide = index;
                });
              },
            ),
            items: widget.sliderList.map((SliderModel slide) {
              return SlideItemWidget(slide: slide);
            }).toList(),
          ),
          Positioned(
            right: 0.0,
            left: 0.0,
            bottom: 0.0,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: widget.sliderList.map((SliderModel slide) {
                return Container(
                  width: 20.0,
                  height: 5.0,
                  margin: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      color: currentSlide == widget.sliderList.indexOf(slide)? AppTheme.primaryColor : Colors.grey.withOpacity(0.4)),
                );
              }).toList(),
            ),
          ),
        ],
      );
    // return Column(
    //   children: [
    //     SizedBox(
    //       height: 170,
    //       child: PageView.builder(
    //         controller: offerPagesController,
    //         itemCount: sliderList.length,
    //         itemBuilder: (context, index) {
    //           return GestureDetector(
    //             onTap: () {
    //               // Navigator.push(
    //               //   context,
    //               //   MaterialPageRoute(builder: (context) => ServiceProvidersScreen(index: index)),
    //               // );
    //             },
    //             child: Padding(
    //               padding: const EdgeInsets.all(8),
    //               child: ClipRRect(
    //                 borderRadius: BorderRadius.circular(8),
    //                 child: AppCachedImage(imageUrl: sliderList[index].image??"", fit: BoxFit.cover,bgColor: Colors.grey.shade200,),
    //               ),
    //             ),
    //           );
    //         },
    //       ),
    //     ),
    //     SmoothPageIndicator(
    //       controller: offerPagesController,
    //       count: sliderList.length,
    //       effect: ExpandingDotsEffect(
    //         dotHeight: 7,
    //         dotWidth: 8,
    //         activeDotColor: AppTheme.primaryColor,
    //         expansionFactor: 2.2,
    //       ),
    //     ),
    //   ],
    // );
  }
}
