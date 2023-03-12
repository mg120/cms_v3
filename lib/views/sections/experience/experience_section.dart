import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../../../controller/experience_section_controller.dart';
import '../../../helper/appTheme.dart';
import '../../../widgets/appCachedImage.dart';
import '../../../widgets/app_text.dart';
import '../../../widgets/empty_list_widget.dart';
import '../../../widgets/loading_widget.dart';
import '../../home/tabs/home/widgets/header_title_widget.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GetBuilder<ExperienceSectionController>(
      builder:(controller)=> controller.isLoading? const LoadingWidget(): controller.experienceSectionList.isNotEmpty?Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // HeaderTitleWidget(title: "experience".tr,),
          Center(child: AppCachedImage(imageUrl: controller.experienceImage?.value??"",
            width: size.width, height: 220, fit: BoxFit.cover, radius: 16,)),
          const SizedBox(height: 10,),
          Center(child: AppText(controller.experienceTitle?.value??"", fontSize: 17, color: AppTheme.primaryColor,)),
          const SizedBox(height: 6),
          AppText(controller.experienceSubTitle?.value??"", color: Colors.black54, maxLines: 100,),
          AppText("description".tr, underLine: true, fontSize: 16,),
          AppText(controller.experienceDescription?.value??"", color: Colors.black54, maxLines: 100,),
          const SizedBox(height: 6),
          SizedBox(
            height: size.height * 0.28,
            child: FutureBuilder(
              future: controller.initializeVideoPlayerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done && controller.playerController.value.isInitialized) {
                  return Column(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.all(
                                Radius.circular(16.0)),
                            child: AspectRatio(
                              aspectRatio: 1.9,
                              child: VideoPlayer(controller.playerController),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: InkWell(
                              onTap: () {
                                log("icon clicked...");
                                if (controller.playerController.value.isPlaying) {
                                  controller.playerController.pause();
                                } else {
                                  controller.playerController.play();
                                }
                                controller.update();
                              },
                              child: Icon(
                                controller.playerController.value.isPlaying
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
                              valueListenable: controller.playerController,
                              builder: (context,
                                  VideoPlayerValue value, child) {
                                return AppText(_videoDuration(
                                    value.position));
                              }),
                          Expanded(
                              child: SizedBox(
                                height: 10,
                                child: VideoProgressIndicator(
                                  controller.playerController,
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
                              controller.playerController.value.duration)),
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
        ],
      ): const EmptyWidget(iconPath: "iconPath", displayTxt: "Experience section empty"),
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
