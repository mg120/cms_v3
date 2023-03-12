import 'dart:developer';

import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../data/api_response/section_response.dart';
import '../data/models/section_item_model.dart';
import '../helper/constants.dart';
import '../services/network/api_service.dart';

class ExperienceSectionController extends GetxController{
  bool _isLoading = true;
  bool get isLoading => _isLoading;
  List<SectionItem> experienceSectionList = [];
  SectionItem? experienceTitle;
  SectionItem? experienceSubTitle;
  SectionItem? experienceDescription;
  SectionItem? experienceVideoTitle;
  SectionItem? experienceVideo;
  SectionItem? experienceImage;
  SectionItem? experienceSectionStatus;

  int currentIndexPage = 0;
  late VideoPlayerController playerController;
  late Future<void> initializeVideoPlayerFuture;

  void updateLoading(bool value){
    _isLoading = value;
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    fetchExperienceSection();
    playerController = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    );
    initializeVideoPlayerFuture = playerController.initialize();
    playerController.setLooping(false);
    playerController.setVolume(1.0);
    log("aspectRatio==> ${playerController.value.aspectRatio.toString()}");
    super.onInit();
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    playerController.dispose();
    super.dispose();
  }

  Future<void> fetchExperienceSection()async{
    updateLoading(true);
    final response = await ApiService.get(experienceSectionPath);
    log("response==> ${response.data}");
    SectionsResponse sectionResponse = SectionsResponse.fromJson(response.data);
    if(response.statusCode==200 && response.data['success']){
      experienceSectionList = sectionResponse.data??[];
      experienceSectionList.forEach((element) {
        if(element.key=="experience_title"){
          experienceTitle = element;
        } else if(element.key=="experience_sub_title"){
          experienceSubTitle = element;
        } else if(element.key=="experience_description"){
          experienceDescription = element;
        } else if(element.key=="experience_title_video"){
          experienceVideoTitle = element;
        } else if(element.key=="experience_url_video"){
          experienceVideo = element;
        } else if(element.key=="experience_image"){
          experienceImage = element;
        } else if(element.key=="experience_section_status"){
          experienceSectionStatus = element;
        }
      });
    }
    updateLoading(false);
  }
}