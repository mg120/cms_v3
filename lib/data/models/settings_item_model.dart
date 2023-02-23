class SettingsItem {
  int? id;
  String? key;
  String? plainValue;
  bool? isTranslatable;
  dynamic value;
  dynamic metaKeywords;
  dynamic metaDescription;

  SettingsItem(
      {this.id,
        this.key,
        this.plainValue,
        this.isTranslatable,
        this.value,
        this.metaKeywords,
        this.metaDescription});

  SettingsItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    key = json['key'];
    plainValue = json['plain_value'];
    isTranslatable = json['is_translatable'];
    value = json['value'];
    metaKeywords = json['meta_keywords'];
    metaDescription = json['meta_description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['key'] = this.key;
    data['plain_value'] = this.plainValue;
    data['is_translatable'] = this.isTranslatable;
    data['value'] = this.value;
    data['meta_keywords'] = this.metaKeywords;
    data['meta_description'] = this.metaDescription;
    return data;
  }
}