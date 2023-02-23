import 'category_model.dart';

class FaqsModel {
  int? id;
  String? question;
  String? answer;
  String? metaKeywords;
  String? metaDescription;
  String? order;
  bool? status;
  CategoryModel? category;
  bool? isExpanded;

  FaqsModel(
      {this.id,
        this.question,
        this.answer,
        this.metaKeywords,
        this.metaDescription,
        this.order,
        this.status,
        this.isExpanded = false,
        this.category});

  FaqsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    answer = json['answer'];
    metaKeywords = json['meta_keywords'];
    metaDescription = json['meta_description'];
    order = json['order'];
    status = json['status'];
    category = json['category'] != null
        ? CategoryModel.fromJson(json['category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['question'] = this.question;
    data['answer'] = this.answer;
    data['meta_keywords'] = this.metaKeywords;
    data['meta_description'] = this.metaDescription;
    data['order'] = this.order;
    data['status'] = this.status;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    return data;
  }
}
