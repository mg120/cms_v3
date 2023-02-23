import '../models/section_item_model.dart';

class SectionResponse {
  bool? success;
  List<SectionItem>? data;
  String? message;

  SectionResponse({this.success, this.data, this.message});

  SectionResponse.fromJson(Map<String, dynamic> json) {
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
