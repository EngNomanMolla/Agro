class ProjectModel {
  String? projectTypeName;
  List<Projects>? projects;

  ProjectModel({this.projectTypeName, this.projects});

  ProjectModel.fromJson(Map<String, dynamic> json) {
    projectTypeName = json['project_type_name'];
    if (json['projects'] != null) {
      projects = <Projects>[];
      json['projects'].forEach((v) {
        projects!.add(new Projects.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['project_type_name'] = this.projectTypeName;
    if (this.projects != null) {
      data['projects'] = this.projects!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Projects {
  int? id;
  String? categoriesId;
  String? name;
  String? image;
  String? projectPrice;
  String? returnMax;
  String? returnMin;
  String? place;
  String? investmentTime;
  String? investmentGoal;
  String? raise;
  String? startDate;
  String? expirationDate;
  String? status;
  String? minInvestment;
  String? projected;
  String? about;
  String? createdAt;
  String? updatedAt;
  String? statusName;
  String? duration;
  int? inWaiting;
  String? categoryName;
  List<Reviews>? reviews;

  Projects(
      {this.id,
        this.categoriesId,
        this.name,
        this.image,
        this.projectPrice,
        this.returnMax,
        this.returnMin,
        this.place,
        this.investmentTime,
        this.investmentGoal,
        this.raise,
        this.startDate,
        this.expirationDate,
        this.status,
        this.minInvestment,
        this.projected,
        this.about,
        this.createdAt,
        this.updatedAt,
        this.statusName,
        this.duration,
        this.inWaiting,
        this.categoryName,
        this.reviews});

  Projects.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoriesId = json['categories_id'];
    name = json['name'];
    image = json['image'];
    projectPrice = json['project_price'];
    returnMax = json['return_max'];
    returnMin = json['return_min'];
    place = json['place'];
    investmentTime = json['investment_time'];
    investmentGoal = json['investment_goal'];
    raise = json['raise'];
    startDate = json['start_date'];
    expirationDate = json['expiration_date'];
    status = json['status'];
    minInvestment = json['min_investment'];
    projected = json['projected'];
    about = json['about'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    statusName = json['status_name'];
    duration = json['duration'];
    inWaiting = json['in_waiting'];
    categoryName = json['category_name'];
    if (json['reviews'] != null) {
      reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        reviews!.add(new Reviews.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['categories_id'] = this.categoriesId;
    data['name'] = this.name;
    data['image'] = this.image;
    data['project_price'] = this.projectPrice;
    data['return_max'] = this.returnMax;
    data['return_min'] = this.returnMin;
    data['place'] = this.place;
    data['investment_time'] = this.investmentTime;
    data['investment_goal'] = this.investmentGoal;
    data['raise'] = this.raise;
    data['start_date'] = this.startDate;
    data['expiration_date'] = this.expirationDate;
    data['status'] = this.status;
    data['min_investment'] = this.minInvestment;
    data['projected'] = this.projected;
    data['about'] = this.about;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['status_name'] = this.statusName;
    data['duration'] = this.duration;
    data['in_waiting'] = this.inWaiting;
    data['category_name'] = this.categoryName;
    if (this.reviews != null) {
      data['reviews'] = this.reviews!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Reviews {
  int? id;
  String? projectId;
  String? clientId;
  String? rating;
  String? reviewText;
  String? reply;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? clientName;
  String? clientImage;

  Reviews(
      {this.id,
        this.projectId,
        this.clientId,
        this.rating,
        this.reviewText,
        this.reply,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.clientName,
        this.clientImage});

  Reviews.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    projectId = json['project_id'];
    clientId = json['client_id'];
    rating = json['rating'];
    reviewText = json['review_text'];
    reply = json['reply'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    clientName = json['client_name'];
    clientImage = json['client_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['project_id'] = this.projectId;
    data['client_id'] = this.clientId;
    data['rating'] = this.rating;
    data['review_text'] = this.reviewText;
    data['reply'] = this.reply;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['client_name'] = this.clientName;
    data['client_image'] = this.clientImage;
    return data;
  }
}
