import 'dart:developer';

import 'package:get/get.dart';

import '../data/api_response/jobs_response.dart';
import '../data/models/job_model.dart';
import '../helper/constants.dart';
import '../helper/ui.dart';
import '../services/network/api_service.dart';

class JobsController extends GetxController{
  bool _isLoading = true;
  bool get isLoading => _isLoading;

  List<JobModel> jobsList = [];

  void updateLoading(bool value) {
    _isLoading = value;
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    fetchAllJobs();
    super.onInit();
  }

  Future<void> fetchAllJobs() async {
    updateLoading(true);
    final response = await ApiService.get(allJobsPath);
    if (response.statusCode == 200) {
      JobsResponse jobsResponse = JobsResponse.fromJson(response.data);
      jobsList = jobsResponse.data?.jobs ?? [];
      log("portfoliosList==> ${jobsList.length}");
    } else {
      Get.showSnackbar(Ui.errorSnackBar(message: response.data['message']));
    }
    updateLoading(false);
  }
}