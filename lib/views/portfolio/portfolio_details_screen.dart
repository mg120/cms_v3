import 'package:flutter/material.dart';

import '../../data/models/portfolio_model.dart';
import '../../widgets/appCachedImage.dart';
import '../../widgets/app_bar_widget.dart';
import '../../widgets/app_text.dart';

class PortfolioDetailsScreen extends StatelessWidget {
  const PortfolioDetailsScreen({Key? key, required this.portfolioModel}) : super(key: key);
  final PortfolioModel portfolioModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: "Portfolio Details"),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        physics: const BouncingScrollPhysics(),
        children: [
          AppCachedImage(imageUrl: portfolioModel.image??"", width: double.infinity, height: 186,
              fit: BoxFit.cover, radius: 16.0, bgColor: Colors.grey.shade300),
          const SizedBox(height: 10),
          AppText("# ${portfolioModel.services?.title}", color: Colors.grey, fontSize: 15),
          const SizedBox(height: 10),
          AppText(portfolioModel.title??"", fontWeight: FontWeight.w700, maxLines: 2, underLine: true,),
          const SizedBox(height: 6),
          AppText(portfolioModel.text??"", maxLines: 20,),
          const SizedBox(height: 6),
          const AppText("Features:", fontSize: 16, underLine: true,),
          const SizedBox(height: 4.0),
          Text(portfolioModel.services?.features??"", style: const TextStyle(color: Colors.black54, height: 1.4),),
          const SizedBox(height: 6),
          const AppText("Description:", fontSize: 16, underLine: true,),
          const SizedBox(height: 4.0),
          Text(portfolioModel.services?.description??"", style: const TextStyle(color: Colors.black54, height: 1.4),),
          const SizedBox(height: 36.0),
        ],
      ),
    );
  }
}
