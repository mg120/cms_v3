import 'package:cms_app/widgets/app_text.dart';
import 'package:flutter/material.dart';

class ListCheckedItem extends StatelessWidget {
  const ListCheckedItem({Key? key, this.isChecked = false}) : super(key: key);
  final bool isChecked;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
      decoration: BoxDecoration(
        color: isChecked? Colors.greenAccent.shade700:Colors.grey.shade300,
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      ),
      child: Row(
        children: [
          Icon(Icons.check),
          const SizedBox(width: 6.0,),
          AppText("Text"),
        ],
      ),
    );
  }
}
