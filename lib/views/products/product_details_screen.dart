import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/models/product_model.dart';
import '../../helper/appTheme.dart';
import '../../widgets/appCachedImage.dart';
import '../../widgets/app_buttons/app_elevated_button.dart';
import '../../widgets/app_text.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({Key? key, required this.productModel}) : super(key: key);
  final ProductModel productModel;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int index = 0;

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        // title: commonCachedNetworkImage(
        //   'images/sneakerShopping/ic_sneaker_logo.png',
        //   height: 30,
        //   width: 30,
        //   color: appStore.isDarkModeOn ? Colors.white : Colors.black,
        //   fit: BoxFit.cover,
        // ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero, side: BorderSide(color: Color(0x00000000), width: 1)),
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(Icons.arrow_back_ios, color: context.iconColor, size: 20),
        ),
        actions: [
          Icon(Icons.favorite_border, color: context.iconColor, size: 20).paddingOnly(right: 16),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(color: Colors.grey.withOpacity(0.3)),
              child: Column(
                children: [
                  AppCachedImage(
                    imageUrl: widget.productModel.images![index],
                    height: 210,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children:  widget.productModel.images!.map((e) {
                        return InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          radius: 8,
                          onTap: () {
                            setState(() {
                              index = widget.productModel.images!.indexOf(e);
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 8),
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: index == widget.productModel.images!.indexOf(e) ? Colors.red : Colors.transparent,
                              ),
                            ),
                            child: AppCachedImage(imageUrl: e, height: 48, width: 48, fit: BoxFit.cover,),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(widget.productModel.category?.name??"", textAlign: TextAlign.start,
                          overflow: TextOverflow.clip, style: TextStyle(color: Colors.black54, fontSize: 15)),
                      Row(
                        children: [
                          AppText("\$${widget.productModel.currentPrice}", color: AppTheme.primaryColor, fontWeight: FontWeight.w700, fontSize: 16,),
                          const SizedBox(width: 4,),
                          AppText("\$${widget.productModel.previousPrice}", lineThrough: true,
                            color: Colors.black54, fontWeight: FontWeight.w500, fontSize: 15,),
                        ],
                      ),
                    ],
                  ),
                  AppText(widget.productModel.title??"", maxLines:2,color: Colors.black,
                    fontWeight: FontWeight.w800, fontSize: 16,),
                  const SizedBox(height: 16),
                  const AppText("Description", color: Colors.black, fontWeight: FontWeight.w600, fontSize: 15,),
                  const SizedBox(height: 6),
                  AppText(
                    widget.productModel.description??"",
                      color: Colors.black54, fontSize: 14, maxLines: 100,),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.grey.withOpacity(0.5)), borderRadius: BorderRadius.circular(8)),
              padding: EdgeInsets.all(8),
              child: Icon(Icons.shopping_cart_outlined),
            ),
            SizedBox(width: 8),
            Expanded(
              child: AppElevatedButton(
                text: 'Buy Now',
                onPressed: () {
                  // showModalBottomSheet(
                  //   shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
                  //   ),
                  //   context: context,
                  //   builder: (_) {
                  //     return AddToCartBottomSheet();
                  //   },
                  // );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
