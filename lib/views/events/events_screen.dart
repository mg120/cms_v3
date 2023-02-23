import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/events_controller.dart';
import '../../widgets/app_bar_widget.dart';
import '../../widgets/empty_list_widget.dart';
import '../../widgets/loading_widget.dart';
import 'widgets/build_event_widget.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: "Events",
        centerTitle: true,
      ),
      body: GetBuilder<EventsController>(
        init: EventsController(),
        builder: (controller) => controller.isLoading
            ? const LoadingWidget()
            : controller.events.isNotEmpty
            ? ListView.separated(
          scrollDirection: Axis.vertical,
          itemCount: controller.events.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return BuildEventWidget(
              index: index,
              eventModel: controller.events[index],
            );
          },
          separatorBuilder: (ctx, index) {
            return const SizedBox(
              height: 10,
            );
          },
        )
            : const EmptyWidget(
            iconPath: "iconPath", displayTxt: "No events founded"),
      ),
    );
  }
}
