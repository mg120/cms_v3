import 'dart:developer';

import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../data/api_response/section_response.dart';
import '../data/models/section_item_model.dart';
import '../helper/constants.dart';
import '../services/network/api_service.dart';

class WhoWeAreController extends GetxController {
  bool _isLoading = true;

  bool get isLoading => _isLoading;
  List<SectionItem> experienceSectionList = [];
  SectionItem? whoWeAreTitle;
  SectionItem? whoWeAreSubTitle;
  SectionItem? whoWeAreDescription;
  SectionItem? whoWeAreImage;
  SectionItem? whoWeAreLink;
  SectionItem? whoWeAreStatus;

  int currentIndexPage = 0;

  void updateLoading(bool value) {
    _isLoading = value;
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    fetchWhoWeAreSection();
    super.onInit();
  }

  Future<void> fetchWhoWeAreSection() async {
    updateLoading(true);
    final response = await ApiService.get(whoWeAreSectionPath);
    log("response==> ${response.data}");
    SectionsResponse sectionResponse = SectionsResponse.fromJson(response.data);
    if (response.statusCode == 200 && response.data['success']) {
      experienceSectionList = sectionResponse.data ?? [];
      experienceSectionList.forEach((element) {
        if (element.key == "who_we_are_title") {
          whoWeAreTitle = element;
        } else if (element.key == "who_we_are_sub_title") {
          whoWeAreSubTitle = element;
        } else if (element.key == "who_we_are_description") {
          whoWeAreDescription = element;
        } else if (element.key == "who_we_are_image") {
          whoWeAreImage = element;
        } else if (element.key == "who_we_are_link") {
          whoWeAreLink = element;
        }
      });
    }
    updateLoading(false);
  }
}
