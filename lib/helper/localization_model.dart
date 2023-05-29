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

class ToneModel {
  String? assetpath;
  String? name;

  ToneModel({
    this.assetpath,
    this.name,
  });

  factory ToneModel.fromJson(Map<String, dynamic> json) => ToneModel(
        assetpath: json["assetpath"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "assetpath": assetpath,
        "name": name,
      };
}
