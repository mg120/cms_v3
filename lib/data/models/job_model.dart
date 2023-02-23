import 'package:cms_app/data/models/category_model.dart';

class JobModel {
  int? id;
  String? title;
  String? employmentStatus;
  String? jobResponsibilities;
  String? educationalRequirements;
  String? experienceRequirements;
  String? skills;
  String? description;
  String? photo;
  String? jobLocation;
  dynamic metaKeywords;
  dynamic metaDescription;
  String? readBeforeApply;
  dynamic code;
  String? applicationDeadline;
  int? experienceInYears;
  int? salary;
  String? email;
  bool? status;
  CategoryModel? category;

  JobModel(
      {this.id,
        this.title,
        this.employmentStatus,
        this.jobResponsibilities,
        this.educationalRequirements,
        this.experienceRequirements,
        this.skills,
        this.description,
        this.photo,
        this.jobLocation,
        this.metaKeywords,
        this.metaDescription,
        this.readBeforeApply,
        this.code,
        this.applicationDeadline,
        this.experienceInYears,
        this.salary,
        this.email,
        this.status,
        this.category});

  JobModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    employmentStatus = json['employment_status'];
    jobResponsibilities = json['job_responsibilities'];
    educationalRequirements = json['educational_requirements'];
    experienceRequirements = json['experience_requirements'];
    skills = json['skills'];
    description = json['description'];
    photo = json['photo'];
    jobLocation = json['job_location'];
    metaKeywords = json['meta_keywords'];
    metaDescription = json['meta_description'];
    readBeforeApply = json['read_before_apply'];
    code = json['code'];
    applicationDeadline = json['application_deadline'];
    experienceInYears = json['experience_in_years'];
    salary = json['salary'];
    email = json['email'];
    status = json['status'];
    category = json['category'] != null
        ? CategoryModel.fromJson(json['category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['employment_status'] = this.employmentStatus;
    data['job_responsibilities'] = this.jobResponsibilities;
    data['educational_requirements'] = this.educationalRequirements;
    data['experience_requirements'] = this.experienceRequirements;
    data['skills'] = this.skills;
    data['description'] = this.description;
    data['photo'] = this.photo;
    data['job_location'] = this.jobLocation;
    data['meta_keywords'] = this.metaKeywords;
    data['meta_description'] = this.metaDescription;
    data['read_before_apply'] = this.readBeforeApply;
    data['code'] = this.code;
    data['application_deadline'] = this.applicationDeadline;
    data['experience_in_years'] = this.experienceInYears;
    data['salary'] = this.salary;
    data['email'] = this.email;
    data['status'] = this.status;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    return data;
  }
}