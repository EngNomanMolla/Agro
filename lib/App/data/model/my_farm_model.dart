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
  String? productId;
  String? projectName;
  String? projectPrice;
  DateTime? projectStartDate;
  DateTime? projectExpirationDate;
  String? projectStatus;
  String? projectCategory;
  String? totalDeposit;
  String? totalProfit;
  String? projectDuration;
  String? projectImage;
  String? returnMin;
  String? returnMax;

  Datum({
    this.productId,
    this.projectName,
    this.projectPrice,
    this.projectStartDate,
    this.projectExpirationDate,
    this.projectStatus,
    this.projectCategory,
    this.totalDeposit,
    this.totalProfit,
    this.projectDuration,
    this.projectImage,
    this.returnMax,
    this.returnMin,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    productId: json["product_id"],
    projectName: json["project_name"],
    projectImage: json['project_image'],
    returnMax: json['project_return_max'],
    returnMin: json['project_return_min'],
    projectPrice: json["project_price"],
    projectStartDate: json["project_start_date"] == null ? null : DateTime.parse(json["project_start_date"]),
    projectExpirationDate: json["project_expiration_date"] == null ? null : DateTime.parse(json["project_expiration_date"]),
    projectStatus: json["project_status"],
    projectCategory: json["project_category"],
    totalDeposit: json["total_deposit"],
    totalProfit: json["total_profit"],
    projectDuration: json["project_duration"],
  );

  Map<String, dynamic> toJson() => {
    "product_id": productId,
    "project_name": projectName,
    "project_price": projectPrice,
    "project_start_date": "${projectStartDate!.year.toString().padLeft(4, '0')}-${projectStartDate!.month.toString().padLeft(2, '0')}-${projectStartDate!.day.toString().padLeft(2, '0')}",
    "project_expiration_date": "${projectExpirationDate!.year.toString().padLeft(4, '0')}-${projectExpirationDate!.month.toString().padLeft(2, '0')}-${projectExpirationDate!.day.toString().padLeft(2, '0')}",
    "project_status": projectStatus,
    "project_category": projectCategory,
    "total_deposit": totalDeposit,
    "total_profit": totalProfit,
    "project_duration": projectDuration,
  };
}
