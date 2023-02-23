import 'package:cms_app/widgets/app_text.dart';
import 'package:flutter/material.dart';

import '../../../../../helper/images.dart';

class PopularServices extends StatelessWidget {
  PopularServices({Key? key}) : super(key: key);
  List<String> servicesList = [plumber, electrician, painter1, carpenter];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppText("Popular Services", fontSize: 18, fontWeight: FontWeight.w700,),
        const SizedBox(height: 16.0),
        SizedBox(
          height: 125,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            scrollDirection: Axis.horizontal,
            children: List.generate(
              servicesList.length,
                  (index) => GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => ServiceProvidersScreen(index: index)),
                  // );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: SizedBox(
                    width: 110,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(servicesList[index], fit: BoxFit.cover),
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
