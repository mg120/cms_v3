import '../models/section_item_model.dart';

class SectionsResponse {
  bool? success;
  List<SectionItem>? data;
  String? message;

  SectionsResponse({this.success, this.data, this.message});

  SectionsResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <SectionItem>[];
      json['data'].forEach((v) {
        data!.add(SectionItem.fromJson(v));
      });
    }
    message = json['message'];
  }
}
