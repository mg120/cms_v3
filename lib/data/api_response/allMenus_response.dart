import '../models/menu_item_model.dart';

class AllMenusResponse {
  bool? success;
  List<MenuItemModel>? data;
  String? message;

  AllMenusResponse({this.success, this.data, this.message});

  AllMenusResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <MenuItemModel>[];
      json['data'].forEach((v) { data!.add(MenuItemModel.fromJson(v)); });
    }
    message = json['message'];
  }
}