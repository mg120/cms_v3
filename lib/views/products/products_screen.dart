import 'package:cms_app/controller/products_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/app_bar_widget.dart';
import '../../widgets/empty_list_widget.dart';
import '../../widgets/loading_widget.dart';
import 'components/product_widget.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: "Products",
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetBuilder<ProductsController>(
          builder: (controller) => controller.isLoading
              ? const LoadingWidget()
              : controller.productsList.isNotEmpty
                  ? GridView.builder(
            padding: const EdgeInsets.symmetric(
                horizontal: 8.0, vertical: 28.0),
            scrollDirection: Axis.vertical,
            itemCount: controller.productsList.length,
            physics: const BouncingScrollPhysics(),
            gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 0.6),
            itemBuilder: (BuildContext context, int index) {
              return ProductWidget(
                index: index,
                productModel: controller.productsList[index],
              );
            },
          ) : const Padding(
                padding: EdgeInsets.only(top: 48.0),
                child: EmptyWidget(
                    iconPath: "assets/icons/search.svg",
                    displayTxt: "No providers founded"),
              ),
        ),
      ),
    );
  }
}
