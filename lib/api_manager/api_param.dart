import 'package:ai_writing/utils/config_packages.dart';

class ApiParam {
  static const String name = "name";
  static const String email = "email";
  static const String profile = "profile";
  static const String provider = "provider";
  static const String devicetoken = "device_token";
  static const String deviceType = "device_type";

  static Map<String, String> header = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer ${StorageHelper().loginData.authtoken}',
  };


}


class Slug{
  static const String email = "email";
  static const String proposal = "proposal";
  static const String speechText = "speech-to-text";
  static const String grammerly = "grammerly";
}