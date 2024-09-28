class ShortModel {
  int? currentPage;
  List<Data>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  Null? nextPageUrl;
  String? path;
  int? perPage;
  Null? prevPageUrl;
  int? to;
  int? total;

  ShortModel(
      {this.currentPage,
        this.data,
        this.firstPageUrl,
        this.from,
        this.lastPage,
        this.lastPageUrl,
        this.links,
        this.nextPageUrl,
        this.path,
        this.perPage,
        this.prevPageUrl,
        this.to,
        this.total});

  ShortModel.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(new Links.fromJson(v));
      });
    }
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = this.firstPageUrl;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['last_page_url'] = this.lastPageUrl;
    if (this.links != null) {
      data['links'] = this.links!.map((v) => v.toJson()).toList();
    }
    data['next_page_url'] = this.nextPageUrl;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['prev_page_url'] = this.prevPageUrl;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

class Data {
  int? id;
  String? categoriesId;
  String? businessType;
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
  double? duration;
  int? inWaiting;
  List<String>? myBusinessType;
  Category? category;
  List<Reviews>? reviews;

  Data(
      {this.id,
        this.categoriesId,
        this.businessType,
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
        this.myBusinessType,
        this.category,
        this.reviews});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoriesId = json['categories_id'];
    businessType = json['business_type'];
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
    myBusinessType = json['my_business_type'].cast<String>();
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
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
    data['business_type'] = this.businessType;
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
    data['my_business_type'] = this.myBusinessType;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.reviews != null) {
      data['reviews'] = this.reviews!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Category {
  int? id;
  String? icon;
  String? name;
  String? status;
  String? createdAt;
  String? updatedAt;

  Category(
      {this.id,
        this.icon,
        this.name,
        this.status,
        this.createdAt,
        this.updatedAt});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    icon = json['icon'];
    name = json['name'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['icon'] = this.icon;
    data['name'] = this.name;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
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
  Client? client;

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
        this.client});

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
    client =
    json['client'] != null ? new Client.fromJson(json['client']) : null;
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
    if (this.client != null) {
      data['client'] = this.client!.toJson();
    }
    return data;
  }
}

class Client {
  int? id;
  String? name;
  String? email;
  String? verifiedAt;
  String? phone;
  String? address;
  String? nid;
  Null? nidF;
  Null? nidB;
  String? tin;
  String? balance;
  Null? image;
  Null? otp;
  String? gender;
  String? status;
  String? clientType;
  String? referralCode;
  Null? referralId;
  String? referralStatus;
  String? createdAt;
  String? updatedAt;

  Client(
      {this.id,
        this.name,
        this.email,
        this.verifiedAt,
        this.phone,
        this.address,
        this.nid,
        this.nidF,
        this.nidB,
        this.tin,
        this.balance,
        this.image,
        this.otp,
        this.gender,
        this.status,
        this.clientType,
        this.referralCode,
        this.referralId,
        this.referralStatus,
        this.createdAt,
        this.updatedAt});

  Client.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    verifiedAt = json['verified_at'];
    phone = json['phone'];
    address = json['address'];
    nid = json['nid'];
    nidF = json['nid_f'];
    nidB = json['nid_b'];
    tin = json['tin'];
    balance = json['balance'];
    image = json['image'];
    otp = json['otp'];
    gender = json['gender'];
    status = json['status'];
    clientType = json['client_type'];
    referralCode = json['referral_code'];
    referralId = json['referral_id'];
    referralStatus = json['referral_status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['verified_at'] = this.verifiedAt;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['nid'] = this.nid;
    data['nid_f'] = this.nidF;
    data['nid_b'] = this.nidB;
    data['tin'] = this.tin;
    data['balance'] = this.balance;
    data['image'] = this.image;
    data['otp'] = this.otp;
    data['gender'] = this.gender;
    data['status'] = this.status;
    data['client_type'] = this.clientType;
    data['referral_code'] = this.referralCode;
    data['referral_id'] = this.referralId;
    data['referral_status'] = this.referralStatus;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['label'] = this.label;
    data['active'] = this.active;
    return data;
  }
}
