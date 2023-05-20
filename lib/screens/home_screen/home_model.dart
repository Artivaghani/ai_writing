// To parse this JSON data, do
//
//     final allData = allDataFromJson(jsonString);

import 'dart:convert';

AllData allDataFromJson(String str) => AllData.fromJson(json.decode(str));

String allDataToJson(AllData data) => json.encode(data.toJson());

class AllData {
  AllData({
    this.status,
    this.data,
    this.oth,
  });

  bool? status;
  Data? data;
  String? oth;

  factory AllData.fromJson(Map<String, dynamic> json) => AllData(
        status: json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        oth: json["oth"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
        "oth": oth,
      };
}

class Data {
  Data({
    this.list,
    this.name,
  });

  List<ListElement>? list;
  String? name;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        list: json["list"] == null ? [] : List<ListElement>.from(json["list"]!.map((x) => ListElement.fromJson(x))),
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "list": list == null ? [] : List<dynamic>.from(list!.map((x) => x.toJson())),
        "name": name,
      };
}

class ListElement {
  ListElement({
    this.name,
    this.images,
    this.lastmsg,
    this.time,
    this.status,
    this.noticount,
  });

  String? name;
  String? images;
  String? lastmsg;
  int? time;
  int? status;
  int? noticount;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        name: json["name"],
        images: json["images"],
        lastmsg: json["lastmsg"],
        time: json["time"],
        status: json["status"],
        noticount: json["noticount"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "images": images,
        "lastmsg": lastmsg,
        "time": time,
        "status": status,
        "noticount": noticount,
      };
}
