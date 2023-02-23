class PortfolioModel {
  int? id;
  String? title;
  String? text;
  String? clientName;
  String? metaKeywords;
  String? metaDescription;
  String? image;
  dynamic code;
  String? status;
  String? startDate;
  String? submissionDate;
  String? websiteLink;
  dynamic services;

  PortfolioModel(
      {this.id,
        this.title,
        this.text,
        this.clientName,
        this.metaKeywords,
        this.metaDescription,
        this.image,
        this.code,
        this.status,
        this.startDate,
        this.submissionDate,
        this.websiteLink,
        this.services});

  PortfolioModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    text = json['text'];
    clientName = json['client_name'];
    metaKeywords = json['meta_keywords'];
    metaDescription = json['meta_description'];
    image = json['image'];
    code = json['code'];
    status = json['status'];
    startDate = json['start_date'];
    submissionDate = json['submission_date'];
    websiteLink = json['website_link'];
    services = json['services'];
  }
}