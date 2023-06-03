class YourModel {
  bool? status;
  List<YourDataList>? data;
  int? count;
  String? message;
  String? errors;

  YourModel({this.status, this.data, this.count, this.message, this.errors});

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

class YourDataList {
  int? id;
  int? userId;
  String? action;
  String? prompt;
  String? tone;
  int? length;
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
  String? object;
  int? created;
  String? model;
  List<Choices>? choices;
  Usage? usage;

  Result(
      {this.id,
      this.object,
      this.created,
      this.model,
      this.choices,
      this.usage});

  Result.fromJson(Map<String, dynamic> json) {
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
    usage = json['usage'] != null ? Usage.fromJson(json['usage']) : null;
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
    if (usage != null) {
      data['usage'] = usage!.toJson();
    }
    return data;
  }
}

class Choices {
  String? text;
  String? subject;
  int? index;
  String? finishReason;

  Choices({this.text, this.index, this.subject, this.finishReason});

  Choices.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    subject = json['subject'];
    index = json['index'];
    finishReason = json['finish_reason'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['text'] = text;
    data['subject'] = subject;
    data['index'] = index;
    data['finish_reason'] = finishReason;
    return data;
  }
}

class Usage {
  int? promptTokens;
  int? completionTokens;
  int? totalTokens;

  Usage({this.promptTokens, this.completionTokens, this.totalTokens});

  Usage.fromJson(Map<String, dynamic> json) {
    promptTokens = json['prompt_tokens'];
    completionTokens = json['completion_tokens'];
    totalTokens = json['total_tokens'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['prompt_tokens'] = promptTokens;
    data['completion_tokens'] = completionTokens;
    data['total_tokens'] = totalTokens;
    return data;
  }
}
