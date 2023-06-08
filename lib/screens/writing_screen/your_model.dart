class YourModel {
  bool? status;
  List<YourDataList>? data;
  int? count;
  String? message;

  YourModel({
    this.status,
    this.data,
    this.count,
    this.message,
  });

  YourModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <YourDataList>[];
      json['data'].forEach((v) {
        data!.add(YourDataList.fromJson(v));
      });
    }
    count = json['count'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['count'] = count;
    data['message'] = message;

    return data;
  }
}

class YourDataList {
  int? id;
  int? userId;
  String? action;
  String? prompt;
  String? tone;
  String? length;
  String? level;
  int? isEmoji;
  Result? result;

  YourDataList(
      {this.id,
      this.userId,
      this.action,
      this.prompt,
      this.tone,
      this.length,
      this.level,
      this.isEmoji,
      this.result});

  YourDataList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    action = json['action'];
    prompt = json['prompt'];
    tone = json['tone'];
    length = json['length'];
    level = json['level'];
    isEmoji = json['is_emoji'];
    result = json['result'] != null ? Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['action'] = action;
    data['prompt'] = prompt;
    data['tone'] = tone;
    data['length'] = length;
    data['level'] = level;
    data['is_emoji'] = isEmoji;
    if (result != null) {
      data['result'] = result!.toJson();
    }
    return data;
  }
}

class Result {
  String? id;
  List<Choices>? choices;

  Result({
    this.id,
    this.choices,
  });

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
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
    if (choices != null) {
      data['choices'] = choices!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class Choices {
  String? text;
  String? subject;

  Choices({
    this.text,
    this.subject,
  });

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
