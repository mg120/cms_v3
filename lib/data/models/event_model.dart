import 'category_model.dart';

class EventModel {
  int? id;
  String? title;
  String? content;
  String? organizer;
  String? venue;
  String? venueLocation;
  dynamic metaKeywords;
  dynamic metaDescription;
  String? image;
  String? date;
  String? time;
  int? ticketCost;
  int? availableTicketNum;
  String? organizerEmail;
  String? organizerPhone;
  String? organizerWebsite;
  String? venuePhone;
  CategoryModel? category;

  EventModel(
      {this.id,
        this.title,
        this.content,
        this.organizer,
        this.venue,
        this.venueLocation,
        this.metaKeywords,
        this.metaDescription,
        this.image,
        this.date,
        this.time,
        this.ticketCost,
        this.availableTicketNum,
        this.organizerEmail,
        this.organizerPhone,
        this.organizerWebsite,
        this.venuePhone,
        this.category});

  EventModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    organizer = json['organizer'];
    venue = json['venue'];
    venueLocation = json['venue_location'];
    metaKeywords = json['meta_keywords'];
    metaDescription = json['meta_description'];
    image = json['image'];
    date = json['date'];
    time = json['time'];
    ticketCost = json['ticket_cost'];
    availableTicketNum = json['available_ticket_num'];
    organizerEmail = json['organizer_email'];
    organizerPhone = json['organizer_phone'];
    organizerWebsite = json['organizer_website'];
    venuePhone = json['venue_phone'];
    category = json['category'] != null
        ? CategoryModel.fromJson(json['category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['content'] = this.content;
    data['organizer'] = this.organizer;
    data['venue'] = this.venue;
    data['venue_location'] = this.venueLocation;
    data['meta_keywords'] = this.metaKeywords;
    data['meta_description'] = this.metaDescription;
    data['image'] = this.image;
    data['date'] = this.date;
    data['time'] = this.time;
    data['ticket_cost'] = this.ticketCost;
    data['available_ticket_num'] = this.availableTicketNum;
    data['organizer_email'] = this.organizerEmail;
    data['organizer_phone'] = this.organizerPhone;
    data['organizer_website'] = this.organizerWebsite;
    data['venue_phone'] = this.venuePhone;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    return data;
  }
}