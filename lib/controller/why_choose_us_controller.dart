import 'dart:developer';

import 'package:get/get.dart';

import '../data/api_response/section_response.dart';
import '../data/models/section_item_model.dart';
import '../helper/constants.dart';
import '../services/network/api_service.dart';

class WhyChooseUsController extends GetxController {
  bool _isLoading = true;

  bool get isLoading => _isLoading;
  List<SectionItem> whyChooseUsSectionList = [];
  SectionItem? whyChooseUsTitle;
  SectionItem? whyChooseUsSubTitle;
  SectionItem? whyChooseUsDescription;
  SectionItem? whyChooseUsImage;
  SectionItem? whyChooseUsLink;
  SectionItem? whyChooseUsStatus;

  int currentIndexPage = 0;

  void updateLoading(bool value) {
    _isLoading = value;
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    fetchWhyChooseUsSection();
    super.onInit();
  }

  Future<void> fetchWhyChooseUsSection() async {
    updateLoading(true);
    final response = await ApiService.get(whyChooseUsSectionPath);
    log("response==> ${response.data}");
    SectionsResponse sectionResponse = SectionsResponse.fromJson(response.data);
    if (response.statusCode == 200 && response.data['success']) {
      whyChooseUsSectionList = sectionResponse.data ?? [];
      whyChooseUsSectionList.forEach((element) {
        if (element.key == "why_choose_us_title") {
          whyChooseUsTitle = element;
        } else if (element.key == "why_choose_us_sub_title") {
          whyChooseUsSubTitle = element;
        } else if (element.key == "why_choose_us_description") {
          whyChooseUsDescription = element;
        } else if (element.key == "why_choose_us_image") {
          whyChooseUsImage = element;
        } else if (element.key == "why_choose_us_link") {
          whyChooseUsLink = element;
        } else if (element.key == "why_choose_us_section_status") {
          whyChooseUsStatus = element;
        }
      });
    }
    updateLoading(false);
  }
}
