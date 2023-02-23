import 'package:flutter/material.dart';

import '../helper/appTheme.dart';


InputDecoration commonInputDecoration({String? hintText, Widget? prefixIcon, Widget? suffixIcon}) {
  return InputDecoration(
    filled: true,
    fillColor: AppTheme.lightGreyTxtColor,
    hintText: hintText,
    prefixIcon: prefixIcon,
    suffixIcon: suffixIcon,
    hintStyle: TextStyle(color: AppTheme.lightGreyTxtColor, fontSize: 16),
    contentPadding: EdgeInsets.symmetric(horizontal: 16),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none),
  );
}

Widget homeTitleWidget({
  String? titleText,
  String? viewAllText,
  Function()? onAllTap,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(titleText!, style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 18)),
        TextButton(
          child: Text(
            viewAllText ?? "View All",
            style: TextStyle(color: AppTheme.primaryColor, fontSize: 16, fontWeight: FontWeight.normal),
          ),
          onPressed: onAllTap!,
        ),
      ],
    ),
  );
}

Widget drawerWidget({String? drawerTitle, Function()? drawerOnTap, IconData? drawerIcon}) {
  return ListTile(
    horizontalTitleGap: 0,
    visualDensity: VisualDensity.compact,
    leading: Icon(drawerIcon!, size: 20),
    title: Text(drawerTitle!, style: TextStyle()),
    onTap: drawerOnTap!,
  );
}

Future<void> showAlertDialog(BuildContext context, {int? index}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Are you sure to book that service again?'),
        actions: [
          TextButton(
            child: Text('No', style: TextStyle(color: Colors.black)),
              onPressed: () {
                Navigator.of(context).pop();
              },
          ),
          TextButton(
            onPressed: () {
              // againBooking(index!);
              // Navigator.push(context, MaterialPageRoute(builder: (context) => DashBoardScreen()));
            }, child: Text('Yes', style: TextStyle(color: Colors.black)),
          ),
        ],
      );
    },
  );
}
