import 'package:cms_app/data/models/product_model.dart';
import 'package:cms_app/widgets/appCachedImage.dart';
import 'package:cms_app/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../helper/appTheme.dart';
import '../../../widgets/rating_bar.dart';
import '../product_details_screen.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({Key? key, required this.index, required this.productModel}) : super(key: key);
  final int index;
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: ()=> Get.to(()=> ProductDetailsScreen(productModel: productModel)),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: AppCachedImage(imageUrl: productModel.images?[0]??'', width: size.width,
                  radius: 8.0, height: 168, bgColor: Colors.grey.shade200,),
            ),
            const SizedBox(height: 8.0,),
            AppText(productModel.category?.name??"", fontSize: 14, color: Colors.black54),
            AppText(productModel.title??"", fontSize: 15, fontWeight: FontWeight.w600, color: Colors.black),
            RatingBarWidget(
              rating: double.parse(productModel.avgReviews.toString()),
              isClicked: false,
              itemSize: 16,
            ),
            Row(
              children: [
                AppText('\$' +productModel.currentPrice.toString(), fontSize: 14, color: AppTheme.primaryColor),
                const SizedBox(width: 4.0,),
                AppText('\$' +productModel.previousPrice.toString(), fontSize: 13, color: Colors.black54, lineThrough: true,),
              ],
            ),
          ],
      ),
    );
  }
}
