class DonationModel {
  int? id;
  String? title;
  String? content;
  dynamic metaKeywords;
  dynamic metaDescription;
  String? image;
  int? goalAmount;
  int? minimumAmount;
  int? customAmount;

  DonationModel(
      {this.id,
        this.title,
        this.content,
        this.metaKeywords,
        this.metaDescription,
        this.image,
        this.goalAmount,
        this.minimumAmount,
        this.customAmount});

  DonationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    metaKeywords = json['meta_keywords'];
    metaDescription = json['meta_description'];
    image = json['image'];
    goalAmount = json['goal_amount'];
    minimumAmount = json['minimum_amount'];
    customAmount = json['custom_amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['content'] = this.content;
    data['meta_keywords'] = this.metaKeywords;
    data['meta_description'] = this.metaDescription;
    data['image'] = this.image;
    data['goal_amount'] = this.goalAmount;
    data['minimum_amount'] = this.minimumAmount;
    data['custom_amount'] = this.customAmount;
    return data;
  }
}