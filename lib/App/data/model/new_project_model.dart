// To parse this JSON data, do
//
//     final newProjectModel = newProjectModelFromJson(jsonString);

import 'dart:convert';

List<NewProjectModel> newProjectModelFromJson(String str) => List<NewProjectModel>.from(json.decode(str).map((x) => NewProjectModel.fromJson(x)));

String newProjectModelToJson(List<NewProjectModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NewProjectModel {
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
  dynamic returnVoucher;
  DateTime? startDate;
  DateTime? expirationDate;
  String? status;
  String? minInvestment;
  String? projected;
  String? about;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? statusName;
  double? duration;
  int? inWaiting;
  List<String>? myBusinessType;
  Category? category;
  List<Review>? reviews;

  NewProjectModel({
    this.id,
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
    this.returnVoucher,
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
    this.reviews,
  });

  factory NewProjectModel.fromJson(Map<String, dynamic> json) => NewProjectModel(
    id: json["id"],
    categoriesId: json["categories_id"],
    businessType: json["business_type"],
    name: json["name"],
    image: json["image"],
    projectPrice: json["project_price"],
    returnMax: json["return_max"],
    returnMin: json["return_min"],
    place: json["place"],
    investmentTime: json["investment_time"],
    investmentGoal: json["investment_goal"],
    raise: json["raise"],
    returnVoucher: json["return_voucher"],
    startDate: json["start_date"] == null ? null : DateTime.parse(json["start_date"]),
    expirationDate: json["expiration_date"] == null ? null : DateTime.parse(json["expiration_date"]),
    status: json["status"],
    minInvestment: json["min_investment"],
    projected: json["projected"],
    about: json["about"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    statusName: json["status_name"],
    duration: json["duration"]?.toDouble(),
    inWaiting: json["in_waiting"],
    myBusinessType: json["my_business_type"] == null ? [] : List<String>.from(json["my_business_type"]!.map((x) => x)),
    category: json["category"] == null ? null : Category.fromJson(json["category"]),
    reviews: json["reviews"] == null ? [] : List<Review>.from(json["reviews"]!.map((x) => Review.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "categories_id": categoriesId,
    "business_type": businessType,
    "name": name,
    "image": image,
    "project_price": projectPrice,
    "return_max": returnMax,
    "return_min": returnMin,
    "place": place,
    "investment_time": investmentTime,
    "investment_goal": investmentGoal,
    "raise": raise,
    "return_voucher": returnVoucher,
    "start_date": "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
    "expiration_date": "${expirationDate!.year.toString().padLeft(4, '0')}-${expirationDate!.month.toString().padLeft(2, '0')}-${expirationDate!.day.toString().padLeft(2, '0')}",
    "status": status,
    "min_investment": minInvestment,
    "projected": projected,
    "about": about,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "status_name": statusName,
    "duration": duration,
    "in_waiting": inWaiting,
    "my_business_type": myBusinessType == null ? [] : List<dynamic>.from(myBusinessType!.map((x) => x)),
    "category": category?.toJson(),
    "reviews": reviews == null ? [] : List<dynamic>.from(reviews!.map((x) => x.toJson())),
  };
}

class Category {
  int? id;
  String? icon;
  String? name;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  Category({
    this.id,
    this.icon,
    this.name,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    icon: json["icon"],
    name: json["name"],
    status: json["status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "icon": icon,
    "name": name,
    "status": status,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}

class Review {
  int? id;
  String? projectId;
  String? clientId;
  String? rating;
  String? reviewText;
  String? reply;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  Client? client;

  Review({
    this.id,
    this.projectId,
    this.clientId,
    this.rating,
    this.reviewText,
    this.reply,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.client,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
    id: json["id"],
    projectId: json["project_id"],
    clientId: json["client_id"],
    rating: json["rating"],
    reviewText: json["review_text"],
    reply: json["reply"],
    status: json["status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    client: json["client"] == null ? null : Client.fromJson(json["client"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "project_id": projectId,
    "client_id": clientId,
    "rating": rating,
    "review_text": reviewText,
    "reply": reply,
    "status": status,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "client": client?.toJson(),
  };
}

class Client {
  int? id;
  String? name;
  String? email;
  DateTime? verifiedAt;
  String? phone;
  String? address;
  String? nid;
  dynamic nidF;
  dynamic nidB;
  String? tin;
  String? balance;
  dynamic image;
  dynamic otp;
  String? gender;
  String? status;
  String? clientType;
  String? referralCode;
  dynamic referralId;
  String? referralStatus;
  DateTime? createdAt;
  DateTime? updatedAt;

  Client({
    this.id,
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
    this.updatedAt,
  });

  factory Client.fromJson(Map<String, dynamic> json) => Client(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    verifiedAt: json["verified_at"] == null ? null : DateTime.parse(json["verified_at"]),
    phone: json["phone"],
    address: json["address"],
    nid: json["nid"],
    nidF: json["nid_f"],
    nidB: json["nid_b"],
    tin: json["tin"],
    balance: json["balance"],
    image: json["image"],
    otp: json["otp"],
    gender: json["gender"],
    status: json["status"],
    clientType: json["client_type"],
    referralCode: json["referral_code"],
    referralId: json["referral_id"],
    referralStatus: json["referral_status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "verified_at": verifiedAt?.toIso8601String(),
    "phone": phone,
    "address": address,
    "nid": nid,
    "nid_f": nidF,
    "nid_b": nidB,
    "tin": tin,
    "balance": balance,
    "image": image,
    "otp": otp,
    "gender": gender,
    "status": status,
    "client_type": clientType,
    "referral_code": referralCode,
    "referral_id": referralId,
    "referral_status": referralStatus,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
