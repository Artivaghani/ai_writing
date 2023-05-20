// To parse this JSON data, do
//
//     final languageModel = languageModelFromJson(jsonString);

import 'dart:convert';

List<LanguageModel> languageModelFromJson(String str) => List<LanguageModel>.from(json.decode(str).map((x) => LanguageModel.fromJson(x)));

String languageModelToJson(List<LanguageModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LanguageModel {
    String? code;
    String? assetpath;
    String? name;
    String? flagpath;

    LanguageModel({
        this.code,
        this.assetpath,
        this.name,
        this.flagpath,
    });

    factory LanguageModel.fromJson(Map<String, dynamic> json) => LanguageModel(
        code: json["code"],
        assetpath: json["assetpath"],
        name: json["name"],
        flagpath: json["flagpath"],
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "assetpath": assetpath,
        "name": name,
        "flagpath": flagpath,
    };
}
