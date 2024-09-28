

class CategoryModel {
  int? id;
  String? icon;
  String? name;
  String? status;
  String? createdAt;
  String? updatedAt;
  bool? check;

  CategoryModel(
      {this.id,
        this.icon,
        this.name,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.check});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    icon = json['icon'];
    name = json['name'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    check = json['check'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['icon'] = this.icon;
    data['name'] = this.name;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['check'] = this.check;
    return data;
  }
}
