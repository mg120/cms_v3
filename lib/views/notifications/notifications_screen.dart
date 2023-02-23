import 'package:cms_app/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

import 'components/notification_item.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: "Notifications",
        centerTitle: true,
      ),
      body: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          itemCount: 10,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => const BuildNotificationItem()),
    );
  }
}
