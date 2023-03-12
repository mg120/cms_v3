import 'dart:developer';

import 'package:get/get.dart';

import '../data/api_response/section_response.dart';
import '../data/models/section_item_model.dart';
import '../helper/constants.dart';
import '../services/network/api_service.dart';

class SolutionsSectionController extends GetxController{
  bool _isLoading = true;

  bool get isLoading => _isLoading;
  List<SectionItem> solutionsSectionList = [];
  SectionItem? solutionsTitle;
  SectionItem? solutionsSubTitle;
  SectionItem? solutionsDescription;
  SectionItem? solutionsImage;
  SectionItem? solutionsLink;
  List<SectionListValue>? solutionsValuesList;

  void updateLoading(bool value) {
    _isLoading = value;
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    fetchSolutionsSection();
    super.onInit();
  }

  Future<void> fetchSolutionsSection() async {
    updateLoading(true);
    final response = await ApiService.get(solutionsSectionPath);
    log("response==> ${response.data}");
    SectionsResponse sectionResponse = SectionsResponse.fromJson(response.data);
    if (response.statusCode == 200 && response.data['success']) {
      solutionsSectionList = sectionResponse.data ?? [];
      solutionsSectionList.forEach((element) {
        if (element.key == "solutions_title") {
          solutionsTitle = element;
        } else if (element.key == "solutions_sub_title") {
          solutionsSubTitle = element;
        } else if (element.key == "solutions_description") {
          solutionsDescription = element;
        } else if (element.key == "solutions_image") {
          solutionsImage = element;
        } else if (element.key == "solutions_link") {
          solutionsLink = element;
        } else if (element.key == "solutions_list") {
          solutionsValuesList = element.value;
        }
      });
    }
    updateLoading(false);
  }
}