import 'package:cms_app/data/models/event_model.dart';
import 'package:cms_app/widgets/appCachedImage.dart';
import 'package:cms_app/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../helper/appTheme.dart';
import '../../../widgets/rating_bar.dart';
import '../event_details_screen.dart';

class BuildEventWidget extends StatelessWidget {
  const BuildEventWidget({Key? key, required this.index, required this.eventModel}) : super(key: key);
  final int index;
  final EventModel eventModel;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: ()=> Get.to(()=> EventDetailsScreen(eventModel: eventModel)),
      child: Column(
        children: [
          Stack(
            //overflow: Overflow.visible,
            alignment: Alignment.bottomCenter,
            children: [
              AppCachedImage(imageUrl: eventModel.image??"", height: 230, width: size.width, fit: BoxFit.cover, radius: 0,),
              Positioned(
                  right: 16,
                  top: 16,
                  child: const Icon(
                    Icons.favorite_border,
                    size: 22,
                  )),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(6),
                color: AppTheme.primaryColor,
                child:Row(
                  children: [
                    const Icon(Icons.access_time, color: Colors.white),
                    const SizedBox(width: 10),
                    AppText("${eventModel.date}, ${eventModel.time}", fontSize: 16, color: Colors.white),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText("# ${eventModel.category?.name}", color: Colors.grey, fontSize: 15,),
                    AppText('\$' + eventModel.ticketCost.toString(), fontSize: 17, color: AppTheme.primaryColor,),
                  ],
                ),
                AppText(eventModel.title??'', fontWeight: FontWeight.bold),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RatingBarWidget(
                      rating: 4,
                      isClicked: false,
                    ),
                    SizedBox(width: 6.0),
                    // Text('1.3k', style: secondaryTextStyle()),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(Icons.location_on_outlined, size: 16,  color: Colors.black),
                        const SizedBox(width: 4.0),
                       AppText("${eventModel.venue}, ${eventModel.venueLocation}", color: Colors.grey, fontSize: 15,),
                      ],
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(Icons.local_activity_outlined, size: 16, color: Colors.black),
                    const SizedBox(width: 4.0),
                    AppText(eventModel.availableTicketNum.toString(), fontSize: 15,color: Colors.grey),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
