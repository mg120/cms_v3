import 'product_category_model.dart';

class ProductModel {
  int? id;
  String? title;
  String? description;
  String? summary;
  dynamic metaKeywords;
  dynamic metaDescription;
  int? currentPrice;
  int? previousPrice;
  int? numRates;
  int? numReviews;
  int? avgReviews;
  bool? status;
  ProductCategory? category;
  List<String>? images;

  ProductModel(
      {this.id,
        this.title,
        this.description,
        this.summary,
        this.metaKeywords,
        this.metaDescription,
        this.currentPrice,
        this.previousPrice,
        this.numRates,
        this.numReviews,
        this.avgReviews,
        this.status,
        this.category,
        this.images});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    summary = json['summary'];
    metaKeywords = json['meta_keywords'];
    metaDescription = json['meta_description'];
    currentPrice = json['current_price'];
    previousPrice = json['previous_price'];
    numRates = json['num_rates'];
    numReviews = json['num_reviews'];
    avgReviews = json['avg_reviews'];
    status = json['status'];
    category = json['category'] != null
        ? ProductCategory.fromJson(json['category'])
        : null;
    images = json['images'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['summary'] = this.summary;
    data['meta_keywords'] = this.metaKeywords;
    data['meta_description'] = this.metaDescription;
    data['current_price'] = this.currentPrice;
    data['previous_price'] = this.previousPrice;
    data['num_rates'] = this.numRates;
    data['num_reviews'] = this.numReviews;
    data['avg_reviews'] = this.avgReviews;
    data['status'] = this.status;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    data['images'] = this.images;
    return data;
  }
}