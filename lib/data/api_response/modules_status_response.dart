import 'package:cms_app/data/models/modules_status_model.dart';

class ModulesStatusResponse {
  bool? success;
  ModulesStatus? modulesStatus;
  String? message;

  ModulesStatusResponse({this.success, this.modulesStatus, this.message});

  ModulesStatusResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    modulesStatus = json['data'] != null ? ModulesStatus.fromJson(json['data']) : null;
    message = json['message'];
  }
}