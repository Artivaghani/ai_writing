class CreditModel {
  bool? status;
  CreditData? data;

  CreditModel({
    this.status,
    this.data,
  });

  CreditModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? CreditData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }

    return data;
  }
}

class CreditData {
  int? totalCredit;

  CreditData({this.totalCredit});

  CreditData.fromJson(Map<String, dynamic> json) {
    totalCredit = json['total_credit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total_credit'] = totalCredit;
    return data;
  }
}
