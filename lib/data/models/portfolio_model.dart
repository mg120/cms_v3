import 'service_translations_model.dart';

class PortfolioModel {
  int? id;
  String? title;
  String? text;
  String? clientName;
  String? metaKeywords;
  String? metaDescription;
  String? image;
  dynamic code;
  String? status;
  String? startDate;
  String? submissionDate;
  String? websiteLink;
  Services? services;

  PortfolioModel(
      {this.id,
        this.title,
        this.text,
        this.clientName,
        this.metaKeywords,
        this.metaDescription,
        this.image,
        this.code,
        this.status,
        this.startDate,
        this.submissionDate,
        this.websiteLink,
        this.services});

  PortfolioModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    text = json['text'];
    clientName = json['client_name'];
    metaKeywords = json['meta_keywords'];
    metaDescription = json['meta_description'];
    image = json['image'];
    code = json['code'];
    status = json['status'];
    startDate = json['start_date'];
    submissionDate = json['submission_date'];
    websiteLink = json['website_link'];
    services = json['services'] != null
        ? Services.fromJson(json['services'])
        : null;
  }
}

class Services {
  int? id;
  bool? isTranslatable;
  String? image;
  bool? isFeatured;
  String? order;
  bool? status;
  int? categoryId;
  Null? deletedAt;
  String? title;
  String? gallery;
  String? features;
  String? shortDescription;
  String? icon;
  String? metaKeywords;
  String? metaDescription;
  String? description;
  List<TranslationsModel>? translations;

  Services(
      {this.id,
        this.isTranslatable,
        this.image,
        this.isFeatured,
        this.order,
        this.status,
        this.categoryId,
        this.deletedAt,
        this.title,
        this.gallery,
        this.features,
        this.shortDescription,
        this.icon,
        this.metaKeywords,
        this.metaDescription,
        this.description,
        this.translations});

  Services.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isTranslatable = json['is_translatable'];
    image = json['image'];
    isFeatured = json['isFeatured'];
    order = json['order'];
    status = json['status'];
    categoryId = json['category_id'];
    deletedAt = json['deleted_at'];
    title = json['title'];
    gallery = json['gallery'];
    features = json['features'];
    shortDescription = json['short_description'];
    icon = json['icon'];
    metaKeywords = json['meta_keywords'];
    metaDescription = json['meta_description'];
    description = json['description'];
    if (json['translations'] != null) {
      translations = <TranslationsModel>[];
      json['translations'].forEach((v) {
        translations!.add(TranslationsModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['is_translatable'] = this.isTranslatable;
    data['image'] = this.image;
    data['isFeatured'] = this.isFeatured;
    data['order'] = this.order;
    data['status'] = this.status;
    data['category_id'] = this.categoryId;
    data['deleted_at'] = this.deletedAt;
    data['title'] = this.title;
    data['gallery'] = this.gallery;
    data['features'] = this.features;
    data['short_description'] = this.shortDescription;
    data['icon'] = this.icon;
    data['meta_keywords'] = this.metaKeywords;
    data['meta_description'] = this.metaDescription;
    data['description'] = this.description;
    if (this.translations != null) {
      data['translations'] = this.translations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
