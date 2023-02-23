import 'package:cms_app/data/models/faqs_model.dart';

class FaqsResponse {
  bool? success;
  Data? data;
  String? message;

  FaqsResponse({this.success, this.data, this.message});

  FaqsResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
  }
}

class Data {
  List<FaqsModel>? faqs;

  Data({this.faqs,});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['fags'] != null) {
      faqs = <FaqsModel>[];
      json['fags'].forEach((v) {
        faqs!.add(FaqsModel.fromJson(v));
      });
    }
  }
}