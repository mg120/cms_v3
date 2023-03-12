import 'package:cms_app/data/models/testimonial_model.dart';

class AllTestimonialsResponse {
  bool? success;
  Data? data;
  String? message;

  AllTestimonialsResponse({this.success, this.data, this.message});

  AllTestimonialsResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  List<TestimonialModel>? testimonials;

  Data({this.testimonials});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['testimonials'] != null) {
      testimonials = <TestimonialModel>[];
      json['testimonials'].forEach((v) {
        testimonials!.add(TestimonialModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.testimonials != null) {
      data['testimonials'] = this.testimonials!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}