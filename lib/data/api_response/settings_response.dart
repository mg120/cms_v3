import 'package:cms_app/data/models/settings_item_model.dart';

class SettingsResponse {
  bool? success;
  List<SettingsItem>? data;
  String? message;

  SettingsResponse({this.success, this.data, this.message});

  SettingsResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <SettingsItem>[];
      json['data'].forEach((v) {
        data!.add(SettingsItem.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}
