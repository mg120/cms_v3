import 'package:cms_app/data/models/category_model.dart';

class ServiceModel {
  int? id;
  String? title;
  String? description;
  String? metaKeywords;
  String? metaDescription;
  String? image;
  bool? isFeatured;
  bool? status;
  String? code;
  CategoryModel? category;

  ServiceModel(
      {this.id,
        this.title,
        this.description,
        this.metaKeywords,
        this.metaDescription,
        this.image,
        this.isFeatured,
        this.status,
        this.code,
        this.category});

  ServiceModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    metaKeywords = json['meta_keywords'];
    metaDescription = json['meta_description'];
    image = json['image'];
    isFeatured = json['isFeatured'];
    status = json['status'];
    code = json['code'];
    category = json['category'] != null
        ? CategoryModel.fromJson(json['category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['meta_keywords'] = this.metaKeywords;
    data['meta_description'] = this.metaDescription;
    data['image'] = this.image;
    data['isFeatured'] = this.isFeatured;
    data['status'] = this.status;
    data['code'] = this.code;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    return data;
  }
}