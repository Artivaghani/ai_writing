class TemplateModel {
  bool? status;
  List<TempData>? data;
  int? count;
  String? message;
  String? errors;

  TemplateModel(
      {this.status, this.data, this.count, this.message, this.errors});

  TemplateModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <TempData>[];
      json['data'].forEach((v) {
        data!.add(TempData.fromJson(v));
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

class TempData {
  int? id;
  String? type;
  String? title;
  String? subject;
  String? content;

  TempData({this.id, this.type, this.title,this.subject, this.content});

  TempData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    title = json['title'];
    subject = json['subject'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['title'] = title;
    data['subject'] = subject;
    data['content'] = content;
    return data;
  }
}
