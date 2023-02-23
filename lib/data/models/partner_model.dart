class Partner {
  int? id;
  String? title;
  String? description;
  String? image;
  String? link;

  Partner({this.id, this.title, this.description, this.image, this.link});

  Partner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['image'] = this.image;
    data['link'] = this.link;
    return data;
  }
}