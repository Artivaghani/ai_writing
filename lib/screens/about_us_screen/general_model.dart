class GeneralModel {
  bool? status;
  Data? data;
  int? count;
  String? message;
  String? errors;

  GeneralModel({this.status, this.data, this.count, this.message, this.errors});

  GeneralModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    count = json['count'];
    message = json['message'];
    errors = json['errors'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['count'] = count;
    data['message'] = message;
    data['errors'] = errors;
    return data;
  }
}

class Data {
  String? content;

  Data({this.content});

  Data.fromJson(Map<String, dynamic> json) {
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['content'] = content;
    return data;
  }
}
