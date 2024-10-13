// To parse this JSON data, do
//
//     final dashboardModel = dashboardModelFromJson(jsonString);

import 'dart:convert';

DashboardModel dashboardModelFromJson(String str) => DashboardModel.fromJson(json.decode(str));

String dashboardModelToJson(DashboardModel data) => json.encode(data.toJson());

class DashboardModel {
  Data? data;

  DashboardModel({
    this.data,
  });

  factory DashboardModel.fromJson(Map<String, dynamic> json) => DashboardModel(
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
  };
}

class Data {
  int? totalInvestor;
  int? totalProject;
  String? fundDisbursed;
  String? returnReimbursed;

  Data({
    this.totalInvestor,
    this.totalProject,
    this.fundDisbursed,
    this.returnReimbursed,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    totalInvestor: json["total_investor"],
    totalProject: json["total_project"],
    fundDisbursed: json["fund_disbursed"],
    returnReimbursed: json["return_reimbursed"],
  );

  Map<String, dynamic> toJson() => {
    "total_investor": totalInvestor,
    "total_project": totalProject,
    "fund_disbursed": fundDisbursed,
    "return_reimbursed": returnReimbursed,
  };
}
