import 'dart:developer';

import 'package:cms_app/data/models/course_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:video_player/video_player.dart';

import '../../helper/appTheme.dart';
import '../../widgets/appCachedImage.dart';
import '../../widgets/app_buttons/app_elevated_button.dart';
import '../../widgets/app_text.dart';
import '../../widgets/rating_bar.dart';
import 'make_course_review.dart';

class CourseDetailsScreen extends StatefulWidget {
  const CourseDetailsScreen({Key? key, required this.courseModel})
      : super(key: key);
  final CourseModel courseModel;

  @override
  State<CourseDetailsScreen> createState() => _CourseDetailsScreenState();
}

class _CourseDetailsScreenState extends State<CourseDetailsScreen> {
  PageController pageController = PageController(initialPage: 0);

  int currentIndexPage = 0;
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    // TODO: implement initState
    log("videoUrl==> ${widget.courseModel.courseVideo ?? ""}");
    _controller = VideoPlayerController.network(
      // widget.courseModel.courseVideo ?? "",
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    );
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(false);
    _controller.setVolume(1.0);
    setState(() {});
    super.initState();
    log("Duration=> ${_controller.value.duration}");
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  floating: true,
                  pinned: true,
                  title: Text(
                      innerBoxIsScrolled ? widget.courseModel.title ?? "" : ""),
                  backgroundColor: innerBoxIsScrolled
                      ? AppTheme.primaryColor
                      : Colors.transparent,
                  expandedHeight: 250.0,
                  iconTheme: const IconThemeData(color: Colors.white),
                  automaticallyImplyLeading: true,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        PageView.builder(
                          controller: pageController,
                          itemCount: widget.courseModel.images?.length ?? 0,
                          itemBuilder: (context, index) {
                            return AppCachedImage(
                              imageUrl: widget.courseModel.images?[index] ?? "",
                              fit: BoxFit.cover,
                              radius: 12.0,
                            );
                          },
                          onPageChanged: (value) {
                            // setState(() => currentIndexPage = value);
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: SmoothPageIndicator(
                              controller: pageController, // PageController
                              count: widget.courseModel.images?.length ?? 0,
                              effect: const ScrollingDotsEffect(),
                              onDotClicked: (index) {}),
                        )
                      ],
                    ),
                  ),
                  actions: const [
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
                  const SizedBox(height: 8.0),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              child: AppText(
                            widget.courseModel.title ?? "",
                            color: AppTheme.primaryColor,
                            maxLines: 2,
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                          )),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(
                                  height: 24,
                                  child: AppText(
                                    "\$${widget.courseModel.currentPrice}",
                                    color: AppTheme.primaryColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w800,
                                  )),
                              SizedBox(
                                  height: 22,
                                  child: AppText(
                                    "\$${widget.courseModel.previousPrice}",
                                    color: Colors.grey,
                                    lineThrough: true,
                                  )),
                            ],
                          )
                        ],
                      )),
                  const SizedBox(height: 16.0),
                  Container(
                    color: Colors.grey.withOpacity(0.1),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 16),
                    child: Row(
                      children: [
                        AppText(
                          widget.courseModel.avgReviews!.toStringAsFixed(1),
                          fontSize: 20,
                          color: AppTheme.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                        const SizedBox(
                          width: 16.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                RatingBarWidget(
                                  rating: double.parse(widget
                                      .courseModel.avgReviews!
                                      .toStringAsFixed(2)),
                                  isClicked: false,
                                  itemCount: 5,
                                  itemSize: 16,
                                ),
                              ],
                            ),
                            Text('${widget.courseModel.numReviews} ${"reviews".tr}'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AppText(
                              'course_duration'.tr,
                              color: Colors.black,
                              fontSize: 15,
                            ),
                            const SizedBox(
                              width: 6.0,
                            ),
                            AppText(
                                "${widget.courseModel.courseDuration} ${"hours".tr}",
                                color: Colors.black54),
                          ],
                        ),
                        AppText(
                          'summary'.tr,
                          underLine: true,
                          color: Colors.black,
                          fontSize: 15,
                        ),
                        const SizedBox(
                          height: 4.0,
                        ),
                        Text(
                          widget.courseModel.summary ?? "",
                          style: const TextStyle(
                              color: Colors.black54, height: 1.4),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        AppText(
                          'overview'.tr,
                          underLine: true,
                          color: Colors.black,
                          fontSize: 15,
                        ),
                        const SizedBox(
                          height: 4.0,
                        ),
                        Text(
                          widget.courseModel.overview ?? "",
                          style: const TextStyle(
                              color: Colors.black54, height: 1.4),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        SizedBox(
                          height: size.height * 0.28,
                          child: FutureBuilder(
                            future: _initializeVideoPlayerFuture,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                      ConnectionState.done &&
                                  _controller.value.isInitialized) {
                                return Column(
                                  children: [
                                    Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        ClipRRect(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(16.0)),
                                          child: AspectRatio(
                                            aspectRatio:
                                                _controller.value.aspectRatio,
                                            child: VideoPlayer(_controller),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.center,
                                          child: InkWell(
                                            onTap: () {
                                              log("icon clicked...");
                                              if (_controller.value.isPlaying) {
                                                _controller.pause();
                                              } else {
                                                _controller.play();
                                              }
                                              setState(() {});
                                            },
                                            child: Icon(
                                              _controller.value.isPlaying
                                                  ? Icons.pause_circle
                                                  : Icons.play_circle,
                                              color: AppTheme.primaryColor,
                                              size: 36,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        ValueListenableBuilder(
                                            valueListenable: _controller,
                                            builder: (context,
                                                VideoPlayerValue value, child) {
                                              return AppText(_videoDuration(
                                                  value.position));
                                            }),
                                        Expanded(
                                            child: SizedBox(
                                          height: 10,
                                          child: VideoProgressIndicator(
                                            _controller,
                                            colors: VideoProgressColors(
                                                backgroundColor: Colors.grey,
                                                bufferedColor:
                                                    AppTheme.hoverColor,
                                                playedColor:
                                                    AppTheme.primaryColor),
                                            allowScrubbing: true,
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 0, horizontal: 12),
                                          ),
                                        )),
                                        AppText(_videoDuration(
                                            _controller.value.duration)),
                                      ],
                                    ),
                                  ],
                                );
                              } else {
                                // If the VideoPlayerController is still initializing, show a
                                // loading spinner.
                                return Center(
                                  child: CircularProgressIndicator(
                                    color: AppTheme.primaryColor,
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        AppText(
                          'instructor'.tr,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: AppTheme.primaryColor,
                          underLine: true,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CircleAvatar(
                              backgroundImage: NetworkImage(
                                "https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.2.jpg",
                              ),
                              backgroundColor: Colors.white,
                              maxRadius: 30,
                            ),
                            const SizedBox(width: 10.0),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppText(
                                    widget.courseModel.instructorName ?? "",
                                    fontWeight: FontWeight.w700,
                                  ),
                                  Text(widget.courseModel.instructorOccupation ?? ""),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10.0),
                        AppText(
                          "about_instructor".tr,
                          fontSize: 16,
                          underLine: true,
                          color: Colors.black,
                        ),
                        const SizedBox(height: 4.0),
                        Text(
                          widget.courseModel.instructorDetails ?? "",
                          style: const TextStyle(
                              color: Colors.black54, height: 1.4),
                        ),
                        const SizedBox(height: 48),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          Align(alignment: Alignment.bottomCenter, child: Container(
              width: 186,
              height: 45,
              margin: const EdgeInsets.only(bottom: 20.0),
              child:AppElevatedButton(text: "send_review".tr,
    onPressed:()=> Get.to(()=>CourseReviewScreen(courseModel: widget.courseModel)),),),),
        ],
      ),
    );
  }

  String _videoDuration(Duration duration) {
    String twoDigits(int val) => val.toString().padLeft(2, "0");
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inMinutes.remainder(60));

    return [if (duration.inHours > 0) hours, minutes, seconds].join(":");
  }
}
