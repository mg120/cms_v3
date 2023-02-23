class CategoryModel {
  int? id;
  String? image;
  bool? isFeatured;
  bool? status;
  String? code;
  String? icon;
  String? name;

  CategoryModel(
      {this.id,
        this.image,
        this.isFeatured,
        this.status,
        this.code,
        this.icon,
        this.name});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    isFeatured = json['isFeatured'];
    status = json['status'];
    code = json['code'];
    icon = json['icon'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['isFeatured'] = this.isFeatured;
    data['status'] = this.status;
    data['code'] = this.code;
    data['icon'] = this.icon;
    data['name'] = this.name;
    return data;
  }
}