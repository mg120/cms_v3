class TranslationsModel {
  int? id;
  String? locale;
  String? title;
  String? metaKeywords;
  String? metaDescription;
  String? description;
  int? servicesId;
  String? createdAt;
  String? updatedAt;
  String? icon;
  String? shortDescription;
  String? gallery;
  String? features;

  TranslationsModel(
      {this.id,
        this.locale,
        this.title,
        this.metaKeywords,
        this.metaDescription,
        this.description,
        this.servicesId,
        this.createdAt,
        this.updatedAt,
        this.icon,
        this.shortDescription,
        this.gallery,
        this.features});

  TranslationsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    locale = json['locale'];
    title = json['title'];
    metaKeywords = json['meta_keywords'];
    metaDescription = json['meta_description'];
    description = json['description'];
    servicesId = json['services_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    icon = json['icon'];
    shortDescription = json['short_description'];
    gallery = json['gallery'];
    features = json['features'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['locale'] = this.locale;
    data['title'] = this.title;
    data['meta_keywords'] = this.metaKeywords;
    data['meta_description'] = this.metaDescription;
    data['description'] = this.description;
    data['services_id'] = this.servicesId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['icon'] = this.icon;
    data['short_description'] = this.shortDescription;
    data['gallery'] = this.gallery;
    data['features'] = this.features;
    return data;
  }
}
