class SliderModel {
  int? id;
  String? title;
  String? description;
  String? order;
  String? image;
  String? image2;
  String? background;
  String? icon;
  String? link;
  String? metaKeywords;
  String? metaDescription;

  SliderModel(
      {this.id,
        this.title,
        this.description,
        this.order,
        this.image,
        this.image2,
        this.background,
        this.icon,
        this.link,
        this.metaKeywords,
        this.metaDescription});

  SliderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    order = json['order'];
    image = json['image'];
    image2 = json['image2'];
    background = json['background'];
    icon = json['icon'];
    link = json['link'];
    metaKeywords = json['meta_keywords'];
    metaDescription = json['meta_description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['order'] = this.order;
    data['image'] = this.image;
    data['image2'] = this.image2;
    data['background'] = this.background;
    data['icon'] = this.icon;
    data['link'] = this.link;
    data['meta_keywords'] = this.metaKeywords;
    data['meta_description'] = this.metaDescription;
    return data;
  }
}