
import 'package:cms_app/widgets/app_text.dart';
import 'package:flutter/material.dart';

import '../../../helper/appTheme.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({Key? key, required this.title, this.icon,required this.index, this.colored, required this.onPressed}) : super(key: key);
  final String title;
  final IconData? icon;
  final Function onPressed;
  final bool? colored;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        if (onPressed != null) {
          Navigator.pop(context);
          onPressed();
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 3.0),
        child: ListTile(
            leading: Icon(icon, color: AppTheme.primaryColor,),
              title: AppText(title, fontSize: 16, fontWeight: FontWeight.w500, color: AppTheme.primaryColor)),
      ),
    );
  }
}
