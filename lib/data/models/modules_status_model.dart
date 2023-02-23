class ModulesStatus{
  bool? blogs;
  bool? jobs;
  bool? galleries;
  bool? events;
  bool? courses;
  bool? products;
  bool? donations;
  bool? articles;
  bool? tickets;

  ModulesStatus(
      {this.blogs,
        this.jobs,
        this.galleries,
        this.events,
        this.courses,
        this.products,
        this.donations,
        this.articles,
        this.tickets});

  ModulesStatus.fromJson(Map<String, dynamic> json) {
    blogs = json['blogs'];
    jobs = json['jobs'];
    galleries = json['galleries'];
    events = json['events'];
    courses = json['courses'];
    products = json['products'];
    donations = json['donations'];
    articles = json['articles'];
    tickets = json['tickets'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['blogs'] = this.blogs;
    data['jobs'] = this.jobs;
    data['galleries'] = this.galleries;
    data['events'] = this.events;
    data['courses'] = this.courses;
    data['products'] = this.products;
    data['donations'] = this.donations;
    data['articles'] = this.articles;
    data['tickets'] = this.tickets;
    return data;
  }
}