class LoginModel {
  bool? status;
  LoginData? data;
  int? count;
  String? message;
  String? errors;

  LoginModel({this.status, this.data, this.count, this.message, this.errors});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? LoginData.fromJson(json['data']) : null;
    count = json['count'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['count'] = count;
    data['message'] = message;

    return data;
  }
}

class LoginData {
  int? id;
  String? name;
  String? email;
  int? status;
  String? provider;
  String? profile;
  String? deviceToken;
  String? deviceType;
  String? authtoken;
  String? referralCode;

  LoginData(
      {this.id,
      this.name,
      this.email,
      this.status,
      this.provider,
      this.profile,
      this.deviceToken,
      this.deviceType,
      this.referralCode,
      this.authtoken});

  LoginData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    status = json['status'];
    provider = json['provider'];
    profile = json['profile'];
    deviceToken = json['device_token'];
    deviceType = json['device_type'];
    referralCode = json['referral_code'];
    authtoken = json['authToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['status'] = status;
    data['provider'] = provider;
    data['profile'] = profile;
    data['device_token'] = deviceToken;
    data['device_type'] = deviceType;
    data['referral_code'] = referralCode;
    data['authToken'] = authtoken;
    return data;
  }
}
