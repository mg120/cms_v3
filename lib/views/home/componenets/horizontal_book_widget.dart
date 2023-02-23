import 'package:cms_app/widgets/app_text.dart';
import 'package:flutter/material.dart';

class HorizontalBookWidget extends StatelessWidget {
  const HorizontalBookWidget({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      // onTap: ()=> Get.to(()=> const BookDetailsScreen()),
      child: Container(
        width: size.width * 0.35,
        margin: const EdgeInsets.symmetric(horizontal: 6.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(6.0)),
                child: Image.asset("assets/images/category2.jpg", height: 160, fit: BoxFit.fill,),
              ),
            ),
            const SizedBox(height: 6,),
            const AppText(
              "الدعوة التامة",
              color: Colors.black,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
            const AppText(
              'فقه',
              color: Colors.black54,
              fontSize: 14.0,
            ),
          ],
        ),
      ),
    );
  }
}
