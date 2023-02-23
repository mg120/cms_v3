import 'blog_tag_model.dart';
import 'category_model.dart';

class BlogModel {
  int? id;
  String? title;
  String? description;
  String? shortDescription;
  String? order;
  String? image;
  List<String>? gallery;
  List<String>? features;
  int? views;
  String? type;
  String? username;
  List<dynamic>? comments;
  String? publishDate;
  String? metaKeywords;
  String? metaDescription;
  CategoryModel? category;
  List<Tags>? tags;

  BlogModel(
      {this.id,
        this.title,
        this.description,
        this.shortDescription,
        this.order,
        this.image,
        this.gallery,
        this.features,
        this.views,
        this.type,
        this.username,
        this.comments,
        this.publishDate,
        this.metaKeywords,
        this.metaDescription,
        this.category,
        this.tags});

  BlogModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    shortDescription = json['short_description'];
    order = json['order'];
    image = json['image'];
    gallery = json['gallery'].cast<String>();
    features = json['features'].cast<String>();
    views = json['views'];
    type = json['type'];
    username = json['username'];
    // if (json['comments'] != null) {
    //   comments = <Null>[];
    //   json['comments'].forEach((v) {
    //     comments!.add(new Null.fromJson(v));
    //   });
    // }
    publishDate = json['publish_date'];
    metaKeywords = json['meta_keywords'];
    metaDescription = json['meta_description'];
    category = json['category'] != null
        ? CategoryModel.fromJson(json['category'])
        : null;
    if (json['tags'] != null) {
      tags = <Tags>[];
      json['tags'].forEach((v) {
        tags!.add(Tags.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['short_description'] = this.shortDescription;
    data['order'] = this.order;
    data['image'] = this.image;
    data['gallery'] = this.gallery;
    data['features'] = this.features;
    data['views'] = this.views;
    data['type'] = this.type;
    data['username'] = this.username;
    // if (this.comments != null) {
    //   data['comments'] = this.comments!.map((v) => v.toJson()).toList();
    // }
    data['publish_date'] = this.publishDate;
    data['meta_keywords'] = this.metaKeywords;
    data['meta_description'] = this.metaDescription;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.tags != null) {
      data['tags'] = this.tags!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}