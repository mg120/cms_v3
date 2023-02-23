class MenuItemModel {
  int? id;
  String? label;
  String? link;
  int? parent;
  int? sort;
  int? menu;
  int? depth;
  String? createdAt;
  String? updatedAt;
  List<MenuItemModel>? subMenus;

  MenuItemModel(
      {this.id,
      this.label,
      this.link,
      this.parent,
      this.sort,
      this.menu,
      this.depth,
      this.createdAt,
      this.updatedAt,
      this.subMenus});

  MenuItemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    label = json['label'];
    link = json['link'];
    parent = json['parent'];
    sort = json['sort'];
    menu = json['menu'];
    depth = json['depth'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['child'] != null) {
      subMenus = <MenuItemModel>[];
      json['child'].forEach((v) {
        subMenus!.add(MenuItemModel.fromJson(v));
      });
    }
  }
}
