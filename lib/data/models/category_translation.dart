class CategoryTranslation {
  int? id;
  String? locale;
  String? name;
  dynamic metaKeywords;
  dynamic metaDescription;
  int? courseCategoryId;
  String? createdAt;
  String? updatedAt;

  CategoryTranslation(
      {this.id,
        this.locale,
        this.name,
        this.metaKeywords,
        this.metaDescription,
        this.courseCategoryId,
        this.createdAt,
        this.updatedAt});

  CategoryTranslation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    locale = json['locale'];
    name = json['name'];
    metaKeywords = json['meta_keywords'];
    metaDescription = json['meta_description'];
    courseCategoryId = json['course_category_id'];
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
    data['course_category_id'] = this.courseCategoryId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}