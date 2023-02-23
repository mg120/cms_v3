import 'course_category.dart';

class CourseModel {
  int? id;
  String? title;
  String? summary;
  String? overview;
  String? instructorDetails;
  dynamic metaKeywords;
  dynamic metaDescription;
  List<String>? images;
  String? courseDuration;
  int? currentPrice;
  int? previousPrice;
  String? courseVideo;
  String? instructorName;
  String? instructorOccupation;
  CourseCategory? category;
  int? numRates;
  int? numReviews;
  double? avgReviews;

  CourseModel(
      {this.id,
        this.title,
        this.summary,
        this.overview,
        this.instructorDetails,
        this.metaKeywords,
        this.metaDescription,
        this.images,
        this.courseDuration,
        this.currentPrice,
        this.previousPrice,
        this.courseVideo,
        this.instructorName,
        this.instructorOccupation,
        this.category,
        this.numRates,
        this.numReviews,
        this.avgReviews});

  CourseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    summary = json['summary'];
    overview = json['overview'];
    instructorDetails = json['instructor_details'];
    metaKeywords = json['meta_keywords'];
    metaDescription = json['meta_description'];
    images = json['images'].cast<String>();
    courseDuration = json['course_duration'];
    currentPrice = json['current_price'];
    previousPrice = json['previous_price'];
    courseVideo = json['course_video'];
    instructorName = json['instructor_name'];
    instructorOccupation = json['instructor_occupation'];
    category = json['category'] != null
        ? CourseCategory.fromJson(json['category'])
        : null;
    numRates = json['num_rates'];
    numReviews = json['num_reviews'];
    avgReviews = double.parse(json['avg_reviews'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['summary'] = this.summary;
    data['overview'] = this.overview;
    data['instructor_details'] = this.instructorDetails;
    data['meta_keywords'] = this.metaKeywords;
    data['meta_description'] = this.metaDescription;
    data['images'] = this.images;
    data['course_duration'] = this.courseDuration;
    data['current_price'] = this.currentPrice;
    data['previous_price'] = this.previousPrice;
    data['course_video'] = this.courseVideo;
    data['instructor_name'] = this.instructorName;
    data['instructor_occupation'] = this.instructorOccupation;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    data['num_rates'] = this.numRates;
    data['num_reviews'] = this.numReviews;
    data['avg_reviews'] = this.avgReviews;
    return data;
  }
}
