import '../models/page_model.dart';

class PageResponse {
  bool? success;
  PageModel? page;
  String? message;

  PageResponse({this.success, this.page, this.message});

  PageResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    page = json['data'] != null ? PageModel.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.page != null) {
      data['data'] = this.page!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}