import '../models/donation_model.dart';

class DonationsResponse {
  bool? success;
  Data? data;
  String? message;

  DonationsResponse({this.success, this.data, this.message});

  DonationsResponse.fromJson(Map<String, dynamic> json) {
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
  List<DonationModel>? donations;

  Data({this.donations,});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['donations'] != null) {
      donations = <DonationModel>[];
      json['donations'].forEach((v) {
        donations!.add(DonationModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.donations != null) {
      data['donations'] = this.donations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

