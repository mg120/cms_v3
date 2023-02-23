import 'dart:developer';

import 'package:cms_app/data/models/partner_model.dart';
import 'package:cms_app/widgets/appCachedImage.dart';
import 'package:cms_app/widgets/app_text.dart';
import 'package:flutter/material.dart';

class BuildPartnerWidget extends StatelessWidget {
  const BuildPartnerWidget({Key? key, required this.index, required this.partner}) : super(key: key);
  final int index;
  final Partner partner;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> log('link=> ${partner.link}'),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            boxShadow:  [
              BoxShadow(
                color: Colors.grey,
                spreadRadius: 1.0,
                blurRadius: 1.0,
                offset: Offset(0.0, 1.0),
              ),
            ]),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment:CrossAxisAlignment.center,
          children: [
            Expanded(child: AppCachedImage(imageUrl: partner.image??"", )),
            const SizedBox(height: 8.0),
            AppText(partner.title??"", fontSize: 15, maxLines: 2,)
          ],
        ),
      ),
    );
  }
}
