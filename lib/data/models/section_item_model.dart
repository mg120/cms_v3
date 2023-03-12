class SectionItem {
  int? id;
  String? type;
  String? key;
  dynamic value;
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

class SectionListValue {
  String? title;
  String? description;
  String? icon;

  SectionListValue({this.title, this.description, this.icon});

  SectionListValue.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['icon'] = this.icon;
    return data;
  }
}