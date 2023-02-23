class PageModel {
  int? id;
  String? name;
  String? description;
  String? breadcrumbTitle;
  String? breadcrumbSubtitle;
  int? status;
  String? code;

  PageModel(
      {this.id,
        this.name,
        this.description,
        this.breadcrumbTitle,
        this.breadcrumbSubtitle,
        this.status,
        this.code});

  PageModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    breadcrumbTitle = json['breadcrumb_title'];
    breadcrumbSubtitle = json['breadcrumb_subtitle'];
    status = json['status'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['breadcrumb_title'] = this.breadcrumbTitle;
    data['breadcrumb_subtitle'] = this.breadcrumbSubtitle;
    data['status'] = this.status;
    data['code'] = this.code;
    return data;
  }
}