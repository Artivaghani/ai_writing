class GenerateModel {
  bool? status;
  GenerateData? data;
  int? count;
  String? message;
  String? errors;

  GenerateModel(
      {this.status, this.data, this.count, this.message, this.errors});

  GenerateModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? GenerateData.fromJson(json['data']) : null;
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

class GenerateData {
  String? id;
  String? object;
  int? created;
  String? model;
  List<Choices>? choices;

  GenerateData({
    this.id,
    this.object,
    this.created,
    this.model,
    this.choices,
  });

  GenerateData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    object = json['object'];
    created = json['created'];
    model = json['model'];
    if (json['choices'] != null) {
      choices = <Choices>[];
      json['choices'].forEach((v) {
        choices!.add(Choices.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['object'] = object;
    data['created'] = created;
    data['model'] = model;
    if (choices != null) {
      data['choices'] = choices!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class Choices {
  String? text;
  String? subject;

  Choices({this.text, this.subject});

  Choices.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    subject = json['subject'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['text'] = text;
    data['subject'] = subject;

    return data;
  }
}
