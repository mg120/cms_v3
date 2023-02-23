import '../models/partner_model.dart';

class PartnersResponse {
  bool? success;
  Data? data;
  String? message;

  PartnersResponse({this.success, this.data, this.message});

  PartnersResponse.fromJson(Map<String, dynamic> json) {
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
  List<Partner>? partners;
  Data({this.partners});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['partners'] != null) {
      partners = <Partner>[];
      json['partners'].forEach((v) {
        partners!.add(Partner.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.partners != null) {
      data['partners'] = this.partners!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
