import 'package:cms_app/data/models/page_model.dart';

class AllPagesResponse {
  bool? success;
  Data? data;
  String? message;

  AllPagesResponse({this.success, this.data, this.message});

  AllPagesResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  List<PageModel>? pages;

  Data({this.pages,});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['pages'] != null) {
      pages = <PageModel>[];
      json['pages'].forEach((v) {
        pages!.add(PageModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.pages != null) {
      data['pages'] = this.pages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}