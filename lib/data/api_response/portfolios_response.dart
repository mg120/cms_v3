import 'package:cms_app/data/models/portfolio_model.dart';

class PortfoliosResponse {
  bool? success;
  Data? data;
  String? message;

  PortfoliosResponse({this.success, this.data, this.message});

  PortfoliosResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
  }
}

class Data {
  List<PortfolioModel>? portfolios;

  Data({this.portfolios});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['portfolios'] != null) {
      portfolios = <PortfolioModel>[];
      json['portfolios'].forEach((v) {
        portfolios!.add(PortfolioModel.fromJson(v));
      });
    }
  }
}