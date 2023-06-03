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
  Usage? usage;

  GenerateData(
      {this.id,
      this.object,
      this.created,
      this.model,
      this.choices,
      this.usage});

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
  int? index;
  String? subject;
  String? finishReason;

  Choices({this.text, this.index, this.subject, this.finishReason});

  Choices.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    index = json['index'];
    subject = json['subject'];
    finishReason = json['finish_reason'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['text'] = text;
    data['index'] = index;
    data['subject'] = subject;
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
