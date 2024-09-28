class AllProjectModel {
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

  AllProjectModel(
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

  AllProjectModel.fromJson(Map<String, dynamic> json) {
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
  String? expirationDate;
  String? status;
  String? minInvestment;
  String? projected;
  String? about;
  String? createdAt;
  String? updatedAt;
  bool? check;
  List<String>? myBusinessType;
  Category? category;

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
        this.expirationDate,
        this.status,
        this.minInvestment,
        this.projected,
        this.about,
        this.createdAt,
        this.updatedAt,
        this.check,
        this.myBusinessType,
        this.category});

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
    expirationDate = json['expiration_date'];
    status = json['status'];
    minInvestment = json['min_investment'];
    projected = json['projected'];
    about = json['about'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    check = json['check'];
    myBusinessType = json['my_business_type'].cast<String>();
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
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
    data['expiration_date'] = this.expirationDate;
    data['status'] = this.status;
    data['min_investment'] = this.minInvestment;
    data['projected'] = this.projected;
    data['about'] = this.about;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['check'] = this.check;
    data['my_business_type'] = this.myBusinessType;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
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