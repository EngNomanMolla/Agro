// To parse this JSON data, do
//
//     final myFarmModel = myFarmModelFromJson(jsonString);

import 'dart:convert';

MyFarmModel myFarmModelFromJson(String str) => MyFarmModel.fromJson(json.decode(str));

String myFarmModelToJson(MyFarmModel data) => json.encode(data.toJson());

class MyFarmModel {
  bool? status;
  List<Datum>? data;

  MyFarmModel({
    this.status,
    this.data,
  });

  factory MyFarmModel.fromJson(Map<String, dynamic> json) => MyFarmModel(
    status: json["status"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  String? id;
  String? orderId;
  String? productId;
  String? quantity;
  String? price;
  int? totalPrice;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? clientId;
  String? orderNumber;
  String? totalAmount;
  String? discount;
  dynamic acceptedBy;
  String? status;
  DateTime? investmentDate;
  String? categoriesId;
  String? businessType;
  String? name;
  String? image;
  int? projectPrice;
  String? returnMax;
  String? returnMin;
  String? place;
  String? investmentTime;
  String? investmentGoal;
  String? raise;
  dynamic returnVoucher;
  DateTime? startDate;
  DateTime? expirationDate;
  String? minInvestment;
  String? projected;
  String? about;
  String? projectName;
  String? icon;
  String? projectCategory;
  String? interestAmount;
  String? projectDuration;
  int? totalInterest;
  String? projectStatus;
  String? orderStatus;

  Datum({
    this.id,
    this.orderId,
    this.productId,
    this.quantity,
    this.price,
    this.totalPrice,
    this.createdAt,
    this.updatedAt,
    this.clientId,
    this.orderNumber,
    this.totalAmount,
    this.discount,
    this.acceptedBy,
    this.status,
    this.investmentDate,
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
    this.minInvestment,
    this.projected,
    this.about,
    this.projectName,
    this.icon,
    this.projectCategory,
    this.interestAmount,
    this.projectDuration,
    this.totalInterest,
    this.projectStatus,
    this.orderStatus,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    orderId: json["order_id"],
    productId: json["product_id"],
    quantity: json["quantity"],
    price: json["price"],
    totalPrice: json["total_price"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    clientId: json["client_id"],
    orderNumber: json["order_number"],
    totalAmount: json["total_amount"],
    discount: json["discount"],
    acceptedBy: json["accepted_by"],
    status: json["status"],
    investmentDate: json["investment_date"] == null ? null : DateTime.parse(json["investment_date"]),
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
    minInvestment: json["min_investment"],
    projected: json["projected"],
    about: json["about"],
    projectName: json["project_name"],
    icon: json["icon"],
    projectCategory: json["project_category"],
    interestAmount: json["interest_amount"],
    projectDuration: json["project_duration"],
    totalInterest: json["total_interest"],
    projectStatus: json["project_status"],
    orderStatus: json["order_status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "order_id": orderId,
    "product_id": productId,
    "quantity": quantity,
    "price": price,
    "total_price": totalPrice,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "client_id": clientId,
    "order_number": orderNumber,
    "total_amount": totalAmount,
    "discount": discount,
    "accepted_by": acceptedBy,
    "status": status,
    "investment_date": investmentDate?.toIso8601String(),
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
    "min_investment": minInvestment,
    "projected": projected,
    "about": about,
    "project_name": projectName,
    "icon": icon,
    "project_category": projectCategory,
    "interest_amount": interestAmount,
    "project_duration": projectDuration,
    "total_interest": totalInterest,
    "project_status": projectStatus,
    "order_status": orderStatus,
  };
}
