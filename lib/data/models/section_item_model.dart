class SectionItem {
  int? id;
  String? type;
  String? key;
  String? value;
  dynamic metaKeywords;
  dynamic metaDescription;

  SectionItem(
      {this.id,
        this.type,
        this.key,
        this.value,
        this.metaKeywords,
        this.metaDescription});

  SectionItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    key = json['key'];
    value = json['value'];
    metaKeywords = json['meta_keywords'];
    metaDescription = json['meta_description'];
  }
}