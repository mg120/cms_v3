class AllSectionsStatusResponse {
  bool? success;
  SectionsData? data;
  String? message;

  AllSectionsStatusResponse({this.success, this.data, this.message});

  AllSectionsStatusResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? SectionsData.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class SectionsData {
  bool? about;
  bool? experience;
  bool? whyChooseUs;
  bool? counterSuccess;
  bool? features;
  bool? solutions;
  bool? whoWeAre;
  bool? banner;
  bool? bannerTop;
  bool? bannerBottom;
  bool? process;
  bool? activities;
  bool? steps;

  SectionsData(
      {this.about,
        this.experience,
        this.whyChooseUs,
        this.counterSuccess,
        this.features,
        this.solutions,
        this.whoWeAre,
        this.banner,
        this.bannerTop,
        this.bannerBottom,
        this.process,
        this.activities,
        this.steps});

  SectionsData.fromJson(Map<String, dynamic> json) {
    about = json['about'];
    experience = json['experience'];
    whyChooseUs = json['why_choose_us'];
    counterSuccess = json['counter_success'];
    features = json['features'];
    solutions = json['solutions'];
    whoWeAre = json['who_we_are'];
    banner = json['banner'];
    bannerTop = json['banner-top'];
    bannerBottom = json['banner-bottom'];
    process = json['process'];
    activities = json['activities'];
    steps = json['steps'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['about'] = this.about;
    data['experience'] = this.experience;
    data['why_choose_us'] = this.whyChooseUs;
    data['counter_success'] = this.counterSuccess;
    data['features'] = this.features;
    data['solutions'] = this.solutions;
    data['who_we_are'] = this.whoWeAre;
    data['banner'] = this.banner;
    data['banner-top'] = this.bannerTop;
    data['banner-bottom'] = this.bannerBottom;
    data['process'] = this.process;
    data['activities'] = this.activities;
    data['steps'] = this.steps;
    return data;
  }
}