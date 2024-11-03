// To parse this JSON data, do
//
//     final transactionsModel = transactionsModelFromJson(jsonString);

import 'dart:convert';

List<TransactionsModel> transactionsModelFromJson(String str) => List<TransactionsModel>.from(json.decode(str).map((x) => TransactionsModel.fromJson(x)));

class TransactionsModel {
  int? id;
  String? orderId;
  String? clientId;
  String? transactionNumber;
  String? requestNumber;
  dynamic paymentMethod;
  String? methodType;
  String? paymentType;
  String? oldBalance;
  String? amount;
  String? status;
  CustomerNote? customerNote;
  String? adminNote;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic projectId;
  Orders? orders;
  Client? client;

  TransactionsModel({
    this.id,
    this.orderId,
    this.clientId,
    this.transactionNumber,
    this.requestNumber,
    this.paymentMethod,
    this.methodType,
    this.paymentType,
    this.oldBalance,
    this.amount,
    this.status,
    this.customerNote,
    this.adminNote,
    this.createdAt,
    this.updatedAt,
    this.projectId,
    this.orders,
    this.client,
  });

  factory TransactionsModel.fromJson(Map<String, dynamic> json) => TransactionsModel(
    id: json["id"],
    orderId: json["order_id"],
    clientId: json["client_id"],
    transactionNumber: json["transaction_number"],
    requestNumber: json["request_number"],
    paymentMethod: json["payment_method"],
    methodType: json["method_type"],
    paymentType: json["payment_type"],
    oldBalance: json["old_balance"],
    amount: json["amount"],
    status: json["status"],
    adminNote: json["admin_note"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    projectId: json["project_id"],
    orders: json["orders"] == null ? null : Orders.fromJson(json["orders"]),
    client: json["client"] == null ? null : Client.fromJson(json["client"]),
  );

}

class Client {
  int? id;
  dynamic name;
  dynamic email;
  DateTime? verifiedAt;
  String? phone;
  dynamic address;
  String? nid;
  dynamic nidF;
  dynamic nidB;
  String? tin;
  String? balance;
  dynamic image;
  dynamic otp;
  dynamic gender;
  String? status;
  String? clientType;
  dynamic referralCode;
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
    name: json["name"] ?? 'NULL',
    email: json["email"] ?? 'NULL',
    verifiedAt: json["verified_at"] == null ? null : DateTime.parse(json["verified_at"]),
    phone: json["phone"],
    address: json["address"] ?? 'NULL',
    nid: json["nid"],
    nidF: json["nid_f"],
    nidB: json["nid_b"],
    tin: json["tin"],
    balance: json["balance"],
    image: json["image"] ?? 'NULL',
    otp: json["otp"],
    gender: json["gender"] ?? 'NULL',
    status: json["status"],
    clientType: json["client_type"],
    referralCode: json["referral_code"] ?? 'NULL',
    referralId: json["referral_id"],
    referralStatus: json["referral_status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": nameValues.reverse[name],
    "email": emailValues.reverse[email],
    "verified_at": verifiedAt?.toIso8601String(),
    "phone": phone,
    "address": addressValues.reverse[address],
    "nid": nid,
    "nid_f": nidF,
    "nid_b": nidB,
    "tin": tin,
    "balance": balance,
    "image": imageValues.reverse[image],
    "otp": otp,
    "gender": genderValues.reverse[gender],
    "status": status,
    "client_type": clientType,
    "referral_code": referralCodeValues.reverse[referralCode],
    "referral_id": referralId,
    "referral_status": referralStatus,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}

enum Address {
  TEST
}

final addressValues = EnumValues({
  "Test": Address.TEST
});

enum Email {
  YTSHIRAJLL_GMAIL_COM
}

final emailValues = EnumValues({
  "ytshirajll@gmail.com": Email.YTSHIRAJLL_GMAIL_COM
});

enum Gender {
  MALE
}

final genderValues = EnumValues({
  "male": Gender.MALE
});

enum Image {
  UPLOADS_CLIENT_1730179440_JPG
}

final imageValues = EnumValues({
  "uploads/client/1730179440.jpg": Image.UPLOADS_CLIENT_1730179440_JPG
});

enum Name {
  SIRAJUL
}

final nameValues = EnumValues({
  "Sirajul": Name.SIRAJUL
});

enum ReferralCode {
  NERWOHTZ
}

final referralCodeValues = EnumValues({
  "NERWOHTZ": ReferralCode.NERWOHTZ
});

enum CustomerNote {
  THANK_YOU_FOR_YOUR_PURCHASE,
  WITHDRAW_SUBMIT
}

final customerNoteValues = EnumValues({
  "Thank you for your purchase": CustomerNote.THANK_YOU_FOR_YOUR_PURCHASE,
  "Withdraw Submit...": CustomerNote.WITHDRAW_SUBMIT
});

class Orders {
  int? id;
  String? clientId;
  String? orderNumber;
  String? totalAmount;
  String? discount;
  String? acceptedBy;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  Orders({
    this.id,
    this.clientId,
    this.orderNumber,
    this.totalAmount,
    this.discount,
    this.acceptedBy,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Orders.fromJson(Map<String, dynamic> json) => Orders(
    id: json["id"],
    clientId: json["client_id"],
    orderNumber: json["order_number"],
    totalAmount: json["total_amount"],
    discount: json["discount"],
    acceptedBy: json["accepted_by"],
    status: json["status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "client_id": clientId,
    "order_number": orderNumber,
    "total_amount": totalAmount,
    "discount": discount,
    "accepted_by": acceptedBy,
    "status": status,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}

enum PaymentMethod {
  BKASH,
  DUTCH_BANGLA,
  ROCKET
}

final paymentMethodValues = EnumValues({
  "bkash": PaymentMethod.BKASH,
  "Dutch Bangla": PaymentMethod.DUTCH_BANGLA,
  "Rocket": PaymentMethod.ROCKET
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
