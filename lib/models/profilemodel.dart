// To parse this JSON data, do
//
//     final profilemodel = profilemodelFromJson(jsonString);

import 'dart:convert';

Profilemodel profilemodelFromJson(String str) => Profilemodel.fromJson(json.decode(str));

String profilemodelToJson(Profilemodel data) => json.encode(data.toJson());

class Profilemodel {
  Profilemodel({
    this.basic,
    this.blogs,
    this.clientPostings,
    this.crewPostings,
    this.events,
    this.isLoggedIn,
    this.locations,
    this.portfolio,
    this.professions,
    this.questions,
    this.skills,
    this.socialHubs,
  });

  Basic basic;
  List<dynamic> blogs;
  List<ClientPosting> clientPostings;
  List<dynamic> crewPostings;
  List<Event> events;
  bool isLoggedIn;
  List<Location> locations;
  List<Portfolio> portfolio;
  List<Profession> professions;
  List<Question> questions;
  List<dynamic> skills;
  List<dynamic> socialHubs;

  factory Profilemodel.fromJson(Map<String, dynamic> json) => Profilemodel(
    basic: Basic.fromJson(json["basic"]),
    blogs: List<dynamic>.from(json["blogs"].map((x) => x)),
    clientPostings: List<ClientPosting>.from(json["client_postings"].map((x) => ClientPosting.fromJson(x))),
    crewPostings: List<dynamic>.from(json["crew_postings"].map((x) => x)),
    events: List<Event>.from(json["events"].map((x) => Event.fromJson(x))),
    isLoggedIn: json["is_logged_in"],
    locations: List<Location>.from(json["locations"].map((x) => Location.fromJson(x))),
    portfolio: List<Portfolio>.from(json["portfolio"].map((x) => Portfolio.fromJson(x))),
    professions: List<Profession>.from(json["professions"].map((x) => Profession.fromJson(x))),
    questions: List<Question>.from(json["questions"].map((x) => Question.fromJson(x))),
    skills: List<dynamic>.from(json["skills"].map((x) => x)),
    socialHubs: List<dynamic>.from(json["social_hubs"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "basic": basic.toJson(),
    "blogs": List<dynamic>.from(blogs.map((x) => x)),
    "client_postings": List<dynamic>.from(clientPostings.map((x) => x.toJson())),
    "crew_postings": List<dynamic>.from(crewPostings.map((x) => x)),
    "events": List<dynamic>.from(events.map((x) => x.toJson())),
    "is_logged_in": isLoggedIn,
    "locations": List<dynamic>.from(locations.map((x) => x.toJson())),
    "portfolio": List<dynamic>.from(portfolio.map((x) => x.toJson())),
    "professions": List<dynamic>.from(professions.map((x) => x.toJson())),
    "questions": List<dynamic>.from(questions.map((x) => x.toJson())),
    "skills": List<dynamic>.from(skills.map((x) => x)),
    "social_hubs": List<dynamic>.from(socialHubs.map((x) => x)),
  };
}

class Basic {
  Basic({
    this.bio,
    this.cover,
    this.createdAt,
    this.dob,
    this.facebook,
    this.followings,
    this.fullname,
    this.image,
    this.imageHd,
    this.instagram,
    this.isFollowing,
    this.isVerified,
    this.isWorking,
    this.linkedin,
    this.name,
    this.quickBookings,
    this.quickbookVerified,
    this.strength,
    this.twitter,
    this.type,
    this.userId,
    this.username,
    this.visits,
    this.website,
  });

  String bio;
  String cover;
  String createdAt;
  DateTime dob;
  String facebook;
  int followings;
  String fullname;
  String image;
  String imageHd;
  String instagram;
  bool isFollowing;
  bool isVerified;
  bool isWorking;
  String linkedin;
  String name;
  int quickBookings;
  bool quickbookVerified;
  int strength;
  String twitter;
  dynamic type;
  int userId;
  String username;
  int visits;
  String website;

  factory Basic.fromJson(Map<String, dynamic> json) => Basic(
    bio: json["bio"],
    cover: json["cover"],
    createdAt: json["created_at"],
    dob: json['dob'] == null ? null : DateTime.tryParse(json['dob'] as String),
    facebook: json["facebook"],
    followings: json["followings"],
    fullname: json["fullname"],
    image: json["image"],
    imageHd: json["image_hd"],
    instagram: json["instagram"],
    isFollowing: json["is_following"],
    isVerified: json["is_verified"],
    isWorking: json["is_working"],
    linkedin: json["linkedin"],
    name: json["name"],
    quickBookings: json["quick_bookings"],
    quickbookVerified: json["quickbook_verified"],
    strength: json["strength"],
    twitter: json["twitter"],
    type: json["type_"],
    userId: json["user_id"],
    username: json["username"],
    visits: json["visits"],
    website: json["website"],
  );

  Map<String, dynamic> toJson() => {
    "bio": bio,
    "cover": cover,
    "created_at": createdAt,
    "dob": "${dob.year.toString().padLeft(4, '0')}-${dob.month.toString().padLeft(2, '0')}-${dob.day.toString().padLeft(2, '0')}",
    "facebook": facebook,
    "followings": followings,
    "fullname": fullname,
    "image": image,
    "image_hd": imageHd,
    "instagram": instagram,
    "is_following": isFollowing,
    "is_verified": isVerified,
    "is_working": isWorking,
    "linkedin": linkedin,
    "name": name,
    "quick_bookings": quickBookings,
    "quickbook_verified": quickbookVerified,
    "strength": strength,
    "twitter": twitter,
    "type_": type,
    "user_id": userId,
    "username": username,
    "visits": visits,
    "website": website,
  };
}

class ClientPosting {
  ClientPosting({
    this.budget,
    this.budgetCc,
    this.createdAt,
    this.description,
    this.experience,
    this.id,
    this.isActive,
    this.jobType,
    this.location,
    this.openings,
    this.profession,
    this.skills,
    this.timePeriod,
    this.timeStart,
    this.type,
  });

  int budget;
  String budgetCc;
  String createdAt;
  String description;
  int experience;
  int id;
  bool isActive;
  String jobType;
  String location;
  int openings;
  String profession;
  String skills;
  String timePeriod;
  String timeStart;
  String type;

  factory ClientPosting.fromJson(Map<String, dynamic> json) => ClientPosting(
    budget: json["budget"] == null ? null : json["budget"],
    budgetCc: json["budget_cc"],
    createdAt: json["created_at"],
    description: json["description"],
    experience: json["experience"],
    id: json["id"],
    isActive: json["is_active"],
    jobType: json["job_type"],
    location: json["location"],
    openings: json["openings"],
    profession: json["profession"],
    skills: json["skills"] == null ? null : json["skills"],
    timePeriod: json["time_period"] == null ? null : json["time_period"],
    timeStart: json["time_start"] == null ? null : json["time_start"],
    type: json["type_"],
  );

  Map<String, dynamic> toJson() => {
    "budget": budget == null ? null : budget,
    "budget_cc": budgetCc,
    "created_at": createdAt,
    "description": description,
    "experience": experience,
    "id": id,
    "is_active": isActive,
    "job_type": jobType,
    "location": location,
    "openings": openings,
    "profession": profession,
    "skills": skills == null ? null : skills,
    "time_period": timePeriod == null ? null : timePeriod,
    "time_start": timeStart == null ? null : timeStart,
    "type_": type,
  };
}

class Event {
  Event({
    this.sku,
    this.theme,
    this.thumbnail,
  });

  String sku;
  String theme;
  String thumbnail;

  factory Event.fromJson(Map<String, dynamic> json) => Event(
    sku: json["sku"],
    theme: json["theme"],
    thumbnail: json["thumbnail"],
  );

  Map<String, dynamic> toJson() => {
    "sku": sku,
    "theme": theme,
    "thumbnail": thumbnail,
  };
}

class Location {
  Location({
    this.city,
    this.country,
    this.createdAt,
    this.id,
    this.isPrimary,
    this.state,
    this.zipCode,
  });

  String city;
  String country;
  String createdAt;
  int id;
  bool isPrimary;
  String state;
  String zipCode;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    city: json["city"],
    country: json["country"],
    createdAt: json["created_at"],
    id: json["id"],
    isPrimary: json["is_primary"],
    state: json["state"],
    zipCode: json["zip_code"],
  );

  Map<String, dynamic> toJson() => {
    "city": city,
    "country": country,
    "created_at": createdAt,
    "id": id,
    "is_primary": isPrimary,
    "state": state,
    "zip_code": zipCode,
  };
}

class Portfolio {
  Portfolio({
    this.createdAt,
    this.description,
    this.endedTime,
    this.id,
    this.images,
    this.link,
    this.position,
    this.projectName,
    this.startedTime,
  });

  String createdAt;
  String description;
  DateTime endedTime;
  int id;
  List<Image> images;
  String link;
  String position;
  String projectName;
  DateTime startedTime;

  factory Portfolio.fromJson(Map<String, dynamic> json) => Portfolio(
    createdAt: json["created_at"],
    description: json["description"],
    endedTime: json['ended_time'] == null ? null : DateTime.tryParse(json['ended_time'] as String),
    id: json["id"],
    images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
    link: json["link"],
    position: json["position"],
    projectName: json["project_name"],
    startedTime: json['started_time'] == null ? null : DateTime.tryParse(json['started_time'] as String),
  );

  Map<String, dynamic> toJson() => {
    "created_at": createdAt,
    "description": description,
    "ended_time": "${endedTime.year.toString().padLeft(4, '0')}-${endedTime.month.toString().padLeft(2, '0')}-${endedTime.day.toString().padLeft(2, '0')}",
    "id": id,
    "images": List<dynamic>.from(images.map((x) => x.toJson())),
    "link": link,
    "position": position,
    "project_name": projectName,
    "started_time": "${startedTime.year.toString().padLeft(4, '0')}-${startedTime.month.toString().padLeft(2, '0')}-${startedTime.day.toString().padLeft(2, '0')}",
  };
}

class Image {
  Image({
    this.id,
    this.image,
  });

  int id;
  String image;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    id: json["id"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
  };
}

class Profession {
  Profession({
    this.createdAt,
    this.experience,
    this.forQuickbook,
    this.id,
    this.isPrimary,
    this.quickbookDetails,
    this.title,
    this.userId,
  });

  String createdAt;
  int experience;
  bool forQuickbook;
  int id;
  bool isPrimary;
  QuickbookDetails quickbookDetails;
  String title;
  int userId;

  factory Profession.fromJson(Map<String, dynamic> json) => Profession(
    createdAt: json["created_at"],
    experience: json["experience"],
    forQuickbook: json["for_quickbook"],
    id: json["id"],
    isPrimary: json["is_primary"],
    quickbookDetails: json["quickbook_details"] == null ? null : QuickbookDetails.fromJson(json["quickbook_details"]),
    title: json["title"],
    userId: json["user_id"],
  );

  Map<String, dynamic> toJson() => {
    "created_at": createdAt,
    "experience": experience,
    "for_quickbook": forQuickbook,
    "id": id,
    "is_primary": isPrimary,
    "quickbook_details": quickbookDetails == null ? null : quickbookDetails.toJson(),
    "title": title,
    "user_id": userId,
  };
}

class QuickbookDetails {
  QuickbookDetails({
    this.isActive,
    this.isFlexible,
    this.portfoliosIds,
    this.rateAmount,
    this.rateCurrency,
    this.rateDuration,
  });

  bool isActive;
  bool isFlexible;
  List<String> portfoliosIds;
  double rateAmount;
  String rateCurrency;
  String rateDuration;

  factory QuickbookDetails.fromJson(Map<String, dynamic> json) => QuickbookDetails(
    isActive: json["is_active"],
    isFlexible: json["is_flexible"],
    portfoliosIds: List<String>.from(json["portfolios_ids"].map((x) => x)),
    rateAmount: json["rate_amount"],
    rateCurrency: json["rate_currency"],
    rateDuration: json["rate_duration"],
  );

  Map<String, dynamic> toJson() => {
    "is_active": isActive,
    "is_flexible": isFlexible,
    "portfolios_ids": List<dynamic>.from(portfoliosIds.map((x) => x)),
    "rate_amount": rateAmount,
    "rate_currency": rateCurrency,
    "rate_duration": rateDuration,
  };
}

class Question {
  Question({
    this.answer,
    this.createdAt,
    this.description,
    this.id,
    this.me,
    this.title,
  });

  Answer answer;
  String createdAt;
  String description;
  int id;
  bool me;
  String title;

  factory Question.fromJson(Map<String, dynamic> json) => Question(
    answer: Answer.fromJson(json["answer"]),
    createdAt: json["created_at"],
    description: json["description"],
    id: json["id"],
    me: json["me"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "answer": answer.toJson(),
    "created_at": createdAt,
    "description": description,
    "id": id,
    "me": me,
    "title": title,
  };
}

class Answer {
  Answer({
    this.createdAt,
    this.description,
    this.id,
  });

  String createdAt;
  String description;
  int id;

  factory Answer.fromJson(Map<String, dynamic> json) => Answer(
    createdAt: json["created_at"],
    description: json["description"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "created_at": createdAt,
    "description": description,
    "id": id,
  };
}
