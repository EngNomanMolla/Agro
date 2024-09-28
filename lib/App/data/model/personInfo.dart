class PersonInfoModel {
  Client? client;

  PersonInfoModel({this.client});

  PersonInfoModel.fromJson(Map<String, dynamic> json) {
    client =
    json['client'] != null ? new Client.fromJson(json['client']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
  Null? address;
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
  Banking? banking;
  Mfs? mfs;
  Nominee? nominee;
  AllBalance? allBalance;
  Orders? orders;

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
        this.updatedAt,
        this.banking,
        this.mfs,
        this.nominee,
        this.allBalance,
        this.orders});

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
    banking =
    json['banking'] != null ? new Banking.fromJson(json['banking']) : null;
    mfs = json['mfs'] != null ? new Mfs.fromJson(json['mfs']) : null;
    nominee =
    json['nominee'] != null ? new Nominee.fromJson(json['nominee']) : null;
    allBalance = json['all_balance'] != null
        ? new AllBalance.fromJson(json['all_balance'])
        : null;
    orders =
    json['orders'] != null ? new Orders.fromJson(json['orders']) : null;
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
    if (this.banking != null) {
      data['banking'] = this.banking!.toJson();
    }
    if (this.mfs != null) {
      data['mfs'] = this.mfs!.toJson();
    }
    if (this.nominee != null) {
      data['nominee'] = this.nominee!.toJson();
    }
    if (this.allBalance != null) {
      data['all_balance'] = this.allBalance!.toJson();
    }
    if (this.orders != null) {
      data['orders'] = this.orders!.toJson();
    }
    return data;
  }
}

class Banking {
  String? bankName;
  String? branchName;
  String? acName;
  String? acNo;

  Banking({this.bankName, this.branchName, this.acName, this.acNo});

  Banking.fromJson(Map<String, dynamic> json) {
    bankName = json['bank_name'];
    branchName = json['branch_name'];
    acName = json['ac_name'];
    acNo = json['ac_no'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bank_name'] = this.bankName;
    data['branch_name'] = this.branchName;
    data['ac_name'] = this.acName;
    data['ac_no'] = this.acNo;
    return data;
  }
}

class Mfs {
  String? mfsName;
  String? mfsType;
  String? mfsNumber;

  Mfs({this.mfsName, this.mfsType, this.mfsNumber});

  Mfs.fromJson(Map<String, dynamic> json) {
    mfsName = json['mfs_name'];
    mfsType = json['mfs_type'];
    mfsNumber = json['mfs_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mfs_name'] = this.mfsName;
    data['mfs_type'] = this.mfsType;
    data['mfs_number'] = this.mfsNumber;
    return data;
  }
}

class Nominee {
  String? name;
  String? phone;
  String? nid;
  String? relationship;

  Nominee({this.name, this.phone, this.nid, this.relationship});

  Nominee.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    nid = json['nid'];
    relationship = json['relationship'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['nid'] = this.nid;
    data['relationship'] = this.relationship;
    return data;
  }
}

class AllBalance {
  int? sumOfPaymentAmount;
  String? sumOfReferralAmount;
  int? sumOfProfitAmount;
  int? sumOfWithdrawalAmount;
  int? currentBalance;
  int? sumOfWithdrawalConfirmAmount;
  int? currentMainConfirmBalance;
  int? clientActiveBalance;
  int? restBalance;
  int? currentTotalBalance;

  AllBalance(
      {this.sumOfPaymentAmount,
        this.sumOfReferralAmount,
        this.sumOfProfitAmount,
        this.sumOfWithdrawalAmount,
        this.currentBalance,
        this.sumOfWithdrawalConfirmAmount,
        this.currentMainConfirmBalance,
        this.clientActiveBalance,
        this.restBalance,
        this.currentTotalBalance});

  AllBalance.fromJson(Map<String, dynamic> json) {
    sumOfPaymentAmount = json['sumOfPaymentAmount'];
    sumOfReferralAmount = json['sumOfReferralAmount'];
    sumOfProfitAmount = json['sumOfProfitAmount'];
    sumOfWithdrawalAmount = json['sumOfWithdrawalAmount'];
    currentBalance = json['currentBalance'];
    sumOfWithdrawalConfirmAmount = json['sumOfWithdrawalConfirmAmount'];
    currentMainConfirmBalance = json['currentMainConfirmBalance'];
    clientActiveBalance = json['clientActiveBalance'];
    restBalance = json['restBalance'];
    currentTotalBalance = json['currentTotalBalance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sumOfPaymentAmount'] = this.sumOfPaymentAmount;
    data['sumOfReferralAmount'] = this.sumOfReferralAmount;
    data['sumOfProfitAmount'] = this.sumOfProfitAmount;
    data['sumOfWithdrawalAmount'] = this.sumOfWithdrawalAmount;
    data['currentBalance'] = this.currentBalance;
    data['sumOfWithdrawalConfirmAmount'] = this.sumOfWithdrawalConfirmAmount;
    data['currentMainConfirmBalance'] = this.currentMainConfirmBalance;
    data['clientActiveBalance'] = this.clientActiveBalance;
    data['restBalance'] = this.restBalance;
    data['currentTotalBalance'] = this.currentTotalBalance;
    return data;
  }
}

class Orders {
  int? totalOrder;
  int? pendingOrder;
  int? confirmOrder;
  int? rejectOrder;

  Orders(
      {this.totalOrder,
        this.pendingOrder,
        this.confirmOrder,
        this.rejectOrder});

  Orders.fromJson(Map<String, dynamic> json) {
    totalOrder = json['totalOrder'];
    pendingOrder = json['pendingOrder'];
    confirmOrder = json['confirmOrder'];
    rejectOrder = json['rejectOrder'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalOrder'] = this.totalOrder;
    data['pendingOrder'] = this.pendingOrder;
    data['confirmOrder'] = this.confirmOrder;
    data['rejectOrder'] = this.rejectOrder;
    return data;
  }
}
