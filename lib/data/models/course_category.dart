import 'category_translation.dart';

class CourseCategory {
  int? id;
  bool? isTranslatable;
  bool? status;
  String? order;
  dynamic deletedAt;
  String? name;
  dynamic metaKeywords;
  dynamic metaDescription;
  List<CategoryTranslation>? translations;

  CourseCategory(
      {this.id,
        this.isTranslatable,
        this.status,
        this.order,
        this.deletedAt,
        this.name,
        this.metaKeywords,
        this.metaDescription,
        this.translations});

  CourseCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isTranslatable = json['is_translatable'];
    status = json['status'];
    order = json['order'];
    deletedAt = json['deleted_at'];
    name = json['name'];
    metaKeywords = json['meta_keywords'];
    metaDescription = json['meta_description'];
    if (json['translations'] != null) {
      translations = <CategoryTranslation>[];
      json['translations'].forEach((v) {
        translations!.add(CategoryTranslation.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['is_translatable'] = this.isTranslatable;
    data['status'] = this.status;
    data['order'] = this.order;
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
