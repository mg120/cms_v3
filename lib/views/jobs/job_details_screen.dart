import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/models/job_model.dart';
import '../../helper/appTheme.dart';
import '../../widgets/appCachedImage.dart';
import '../../widgets/app_buttons/app_elevated_button.dart';
import '../../widgets/app_text.dart';
import 'apply_job_screen.dart';

class JobDetailsScreen extends StatelessWidget {
  const JobDetailsScreen({Key? key, required this.jobModel}) : super(key: key);
  final JobModel jobModel;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: size.width,
                  padding: const EdgeInsets.only(left: 16.0, top: 30.0, right: 16.0, bottom: 16.0),
                  decoration: BoxDecoration(
                      color: AppTheme.primaryColor,
                      borderRadius: const BorderRadius.vertical(bottom: Radius.circular(16.0))
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(alignment: Alignment.topLeft, child: InkWell(
                          onTap: ()=> Get.back(),
                          child: const Icon(Icons.arrow_back_ios, color: Colors.white)),),
                      const SizedBox(height: 10,),
                      Row(
                        children: [
                          AppCachedImage(imageUrl: jobModel.photo??"", width: 76, height: 76,
                            isCircular: true, borderColor: Colors.white, borderWidth: 1.5,),
                          const SizedBox(width: 8.0),
                          Expanded(child: AppText(jobModel.title??"", fontSize: 17, fontWeight: FontWeight.w700, color: Colors.white, maxLines: 2,)),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8.0,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AppText("# ${jobModel.category?.name}", fontSize: 16, color: Colors.grey),
                      const AppText("Job Responsibilities:", fontSize: 16, underLine: true,),
                      const SizedBox(height: 4.0),
                      Text(jobModel.jobResponsibilities??"", style: const TextStyle(color: Colors.black54, height: 1.4),),
                      buildDivider(),
                      const AppText("Skills:", fontSize: 16, underLine: true,),
                      const SizedBox(height: 4.0),
                      Text(jobModel.skills??"", style: const TextStyle(color: Colors.black54, height: 1.4),),
                      buildDivider(),
                      const AppText("Description:", fontSize: 16, underLine: true,),
                      const SizedBox(height: 4.0),
                      Text(jobModel.description??"", style: const TextStyle(color: Colors.black54, height: 1.4),),
                      buildDivider(),
                      Row(
                        children: [
                          const AppText("EmploymentStatus:", fontSize: 14),
                          const SizedBox(width: 10),
                          AppText(jobModel.employmentStatus??"", fontSize: 15, color: Colors.grey,),
                        ],
                      ),
                      buildDivider(),
                      Row(
                        children: [
                          const AppText("YearsOfExperience:", fontSize: 14),
                          const SizedBox(width: 10),
                          AppText(jobModel.experienceInYears.toString(), fontSize: 15, color: Colors.grey,),
                        ],
                      ),
                      buildDivider(),
                      Row(
                        children: [
                          const AppText("Email:", fontSize: 14),
                          const SizedBox(width: 10),
                          AppText(jobModel.email??"", fontSize: 15, color: Colors.grey,),
                        ],
                      ),
                      buildDivider(),
                      Row(
                        children: [
                          const AppText("Salary:", fontSize: 14),
                          const SizedBox(width: 10),
                          AppText(jobModel.salary.toString(), fontSize: 15, color: Colors.grey,),
                        ],
                      ),
                      buildDivider(),
                      Row(
                        children: [
                          const AppText("Location:", fontSize: 14),
                          const SizedBox(width: 10),
                          AppText(jobModel.jobLocation??"", fontSize: 15, color: Colors.grey,),
                        ],
                      ),
                      buildDivider(),
                    ],),
                ),
                const SizedBox(height: 36.0,),
              ],
            ),
          ),
          Align(alignment: Alignment.bottomCenter, child: Container(
              width: 160,
              height: 45,
              margin: const EdgeInsets.only(bottom: 12.0),
              child: AppElevatedButton(text: "Apply Now", onPressed:()=> Get.to(()=> ApplyJobScreen(jobModel: jobModel)),)),)
        ],
      ),
    );
  }

  Widget buildDivider(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Divider(color: AppTheme.primaryColor.withOpacity(0.6),),
    );
  }
}
