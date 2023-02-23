class ProductCategory {
  int? id;
  bool? isTranslatable;
  bool? status;
  String? deletedAt;
  String? name;
  String? metaKeywords;
  String? metaDescription;
  List<Translations>? translations;

  ProductCategory(
      {this.id,
        this.isTranslatable,
        this.status,
        this.deletedAt,
        this.name,
        this.metaKeywords,
        this.metaDescription,
        this.translations});

  ProductCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isTranslatable = json['is_translatable'];
    status = json['status'];
    deletedAt = json['deleted_at'];
    name = json['name'];
    metaKeywords = json['meta_keywords'];
    metaDescription = json['meta_description'];
    if (json['translations'] != null) {
      translations = <Translations>[];
      json['translations'].forEach((v) {
        translations!.add(Translations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['is_translatable'] = this.isTranslatable;
    data['status'] = this.status;
    data['deleted_at'] = this.deletedAt;
    data['name'] = this.name;
    data['meta_keywords'] = this.metaKeywords;
    data['meta_description'] = this.metaDescription;
    if (this.translations != null) {
      data['translations'] = this.translations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Translations {
  int? id;
  String? locale;
  String? name;
  dynamic metaKeywords;
  dynamic metaDescription;
  int? productCategoryId;
  String? createdAt;
  String? updatedAt;

  Translations(
      {this.id,
        this.locale,
        this.name,
        this.metaKeywords,
        this.metaDescription,
        this.productCategoryId,
        this.createdAt,
        this.updatedAt});

  Translations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    locale = json['locale'];
    name = json['name'];
    metaKeywords = json['meta_keywords'];
    metaDescription = json['meta_description'];
    productCategoryId = json['product_category_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['locale'] = this.locale;
    data['name'] = this.name;
    data['meta_keywords'] = this.metaKeywords;
    data['meta_description'] = this.metaDescription;
    data['product_category_id'] = this.productCategoryId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}