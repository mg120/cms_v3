import 'package:cms_app/data/models/event_model.dart';
import 'package:cms_app/widgets/appCachedImage.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../helper/appTheme.dart';
import '../../widgets/app_text.dart';
import '../../widgets/rating_bar.dart';

class EventDetailsScreen extends StatefulWidget {
  const EventDetailsScreen({Key? key, required this.eventModel}) : super(key: key);
  final EventModel eventModel;

  @override
  State<EventDetailsScreen> createState() => _EventDetailsScreenState();
}

class _EventDetailsScreenState extends State<EventDetailsScreen> {
  PageController pageController = PageController(initialPage: 0);
  int currentIndexPage = 0;
  bool fev = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              floating: true,
              pinned: true,
              title: Text(innerBoxIsScrolled ? widget.eventModel.title??"" : ""),
              backgroundColor: innerBoxIsScrolled? AppTheme.primaryColor: Colors.transparent,
              expandedHeight: 250.0,
              iconTheme: const IconThemeData(color: Colors.white),
              automaticallyImplyLeading: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    PageView.builder(
                      controller: pageController,
                      itemCount: 3,
                      itemBuilder: (context, i) {
                        return AppCachedImage(imageUrl: widget.eventModel.image??"", fit: BoxFit.cover, radius: 12.0,);
                      },
                      onPageChanged: (value) {
                        setState(() => currentIndexPage = value);
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: SmoothPageIndicator(
                          controller: pageController,  // PageController
                          count:  1,
                          effect: ScrollingDotsEffect(),
                          onDotClicked: (index){
                          }
                      ),
                    )
                  ],
                ),
              ),
              actions: const[
                Padding(
                  padding: EdgeInsets.only(right: 12.0),
                  child: Icon(Icons.share_outlined, color: Colors.white),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 12.0),
                  child: Icon(Icons.favorite_border, color: Colors.white),
                ),
              ],
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppText("# ${widget.eventModel.category?.name}", fontSize: 15, color: Colors.grey),
                    AppText(widget.eventModel.title??"", fontSize: 17, color: AppTheme.primaryColor,),
                    Row(
                      children: [
                        Icon(Icons.timelapse_rounded, size: 18),
                        SizedBox(width: 6.0,),
                        AppText("${widget.eventModel.date}, ${widget.eventModel.time}"),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.local_activity_outlined,
                          size: 18,
                        ),
                        const SizedBox(width: 5.0),
                        Text(widget.eventModel.availableTicketNum.toString(),),
                      ],
                    ),
                  ],),
              ),
              const SizedBox(height: 16.0),
              Container(
                color: Colors.grey.withOpacity(0.1),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                child: Row(
                  children: [
                    AppText('4.3', fontSize: 20, color: AppTheme.primaryColor),
                    const SizedBox(width: 6.0,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: const[
                            RatingBarWidget(
                              rating: 4.3,
                              isClicked: false,
                              itemCount: 5,
                              itemSize: 16,
                            ),

                          ],
                        ),
                        Text('241K Reviews'),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16.0,),
              Padding(
                padding: const EdgeInsets.only(left: 12, bottom: 8, top: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText('About'.toUpperCase(), color: Colors.grey),
                    const SizedBox(height: 8.0,),
                    AppText(widget.eventModel.content??"", fontSize: 16,maxLines: 40,),
                  ],
                ),
              ),
              const SizedBox(height: 16.0,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: AppText(
                  'Organized by'.toUpperCase(),
                  fontSize: 17, color: Colors.grey
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12, bottom: 16, top: 8, right: 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                        "https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.2.jpg",
                      ),
                      backgroundColor: Colors.white,
                      maxRadius: 30,
                    ),
                    const SizedBox(width: 10.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(widget.eventModel.organizer??"", fontWeight: FontWeight.w700,),
                        Text(widget.eventModel.organizerPhone??""),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12, bottom: 8, top: 8, right: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText('Location'.toUpperCase(), color: Colors.grey, fontSize: 17,),
                    AppText(widget.eventModel.venueLocation!.toUpperCase(), color: Colors.grey, fontSize: 17,),
                  ],
                ),
              ),
              AppCachedImage(imageUrl: "https://assets.iqonic.design/old-themeforest-images/prokit/images/eventApp/map.jpg",
                  fit: BoxFit.cover, height: 200, width: size.width, radius: 0.0,),
              const SizedBox(height: 36.0,),
            ],
          ),
        ),
      ),
    );
  }
}
