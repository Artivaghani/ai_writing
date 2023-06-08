class CredHistoryModel {
  bool? status;
  List<HistoryDataList>? data;
  int? count;
  String? message;
  String? errors;

  CredHistoryModel(
      {this.status, this.data, this.count, this.message, this.errors});

  CredHistoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <HistoryDataList>[];
      json['data'].forEach((v) {
        data!.add(HistoryDataList.fromJson(v));
      });
    }
    count = json['count'];
    message = json['message'];
    errors = json['errors'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['count'] = count;
    data['message'] = message;
    data['errors'] = errors;
    return data;
  }
}

class HistoryDataList {
  int? id;
  int? userId;
  String? description;
  int? credit;
  String? type;
  String? mode;
  String? createdAt;

  HistoryDataList(
      {this.id,
      this.userId,
      this.description,
      this.credit,
      this.type,
      this.mode,
       this.createdAt});

  HistoryDataList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    description = json['description'];
    credit = json['credit'];
    type = json['type'];
    mode = json['mode'];
       createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['description'] = description;
    data['credit'] = credit;
    data['type'] = type;
    data['mode'] = mode;
    data['created_at'] = createdAt;
    return data;
  }
}
