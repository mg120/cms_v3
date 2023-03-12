class TestimonialModel {
  int? id;
  String? title;
  String? job;
  String? image;
  String? description;

  TestimonialModel({this.id, this.title, this.job, this.image, this.description});

  TestimonialModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    job = json['job'];
    image = json['image'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['job'] = this.job;
    data['image'] = this.image;
    data['description'] = this.description;
    return data;
  }
}